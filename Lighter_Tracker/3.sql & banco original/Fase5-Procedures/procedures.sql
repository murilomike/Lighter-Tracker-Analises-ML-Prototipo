-- =========================================================
-- 5. STORED PROCEDURES PARA OPERAÇÕES COMUNS
-- =========================================================

-- Procedure para inserir nova compra completa

GO

CREATE PROCEDURE sp_InserirCompra
    @UsuarioID INT,
    @EstabelecimentoID INT,
    @DataCompra DATETIME2,
    @MetodoPagamento VARCHAR(20),
    @IsqueiroID INT,
    @Quantidade INT = 1,
    @PrecoUnitario DECIMAL(8,2),
    @Desconto DECIMAL(5,2) = 0
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @CompraID INT, @ItemCompraID INT, @ValorTotal DECIMAL(10,2);
    
    BEGIN TRANSACTION;
    
    TRY
        -- Calcular valor total
        SET @ValorTotal = @Quantidade * @PrecoUnitario * (1 - @Desconto/100);
        
        -- Inserir compra
        INSERT INTO Compras (UsuarioID, EstabelecimentoID, DataCompra, ValorTotal, MetodoPagamento)
        VALUES (@UsuarioID, @EstabelecimentoID, @DataCompra, @ValorTotal, @MetodoPagamento);
        
        SET @CompraID = SCOPE_IDENTITY();
        
        -- Inserir item da compra
        INSERT INTO ItensCompra (CompraID, IsqueiroID, Quantidade, PrecoUnitario, Desconto)
        VALUES (@CompraID, @IsqueiroID, @Quantidade, @PrecoUnitario, @Desconto);
        
        SET @ItemCompraID = SCOPE_IDENTITY();
        
        -- Inserir isqueiros do usuário (uma instância para cada quantidade)
        DECLARE @i INT = 1;
        WHILE @i <= @Quantidade
        BEGIN
            INSERT INTO IsqueirosUsuario (UsuarioID, ItemCompraID, DataCompra, StatusAtual)
            VALUES (@UsuarioID, @ItemCompraID, @DataCompra, 'Novo');
            
            SET @i = @i + 1;
        END
        
        COMMIT TRANSACTION;
        
        SELECT @CompraID AS CompraID, 'Compra inserida com sucesso' AS Mensagem;
        
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

-- Procedure para registrar uso de isqueiro
CREATE PROCEDURE sp_RegistrarUso
    @IsqueiroUsuarioID INT,
    @TipoUso VARCHAR(50),
    @LocalID INT = NULL,
    @DuracaoSegundos INT = NULL,
    @ConsumoML DECIMAL(5,3) = NULL,
    @Latitude DECIMAL(10,8) = NULL,
    @Longitude DECIMAL(11,8) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @DataHoraUso DATETIME2 = GETDATE();
    
    -- Inserir registro de utilização
    INSERT INTO Utilizacao (
        IsqueiroUsuarioID, LocalID, DataHoraUso, TipoUso, 
        DuracaoUsoSegundos, ConsumoEstimadoML, Latitude, Longitude
    )
    VALUES (
        @IsqueiroUsuarioID, @LocalID, @DataHoraUso, @TipoUso,
        @DuracaoSegundos, @ConsumoML, @Latitude, @Longitude
    );
    
    -- Atualizar status e localização do isqueiro
    UPDATE IsqueirosUsuario 
    SET StatusAtual = 'Em Uso',
        DataUltimaLocalizacao = @DataHoraUso,
        DataAtualizacao = @DataHoraUso
    WHERE IsqueiroUsuarioID = @IsqueiroUsuarioID;
    
    -- Se fornecido localização, registrar no histórico
    IF @Latitude IS NOT NULL AND @Longitude IS NOT NULL
    BEGIN
        INSERT INTO HistoricoLocalizacao (
            IsqueiroUsuarioID, LocalID, DataHoraRegistro, 
            TipoEvento, Latitude, Longitude, Descricao
        )
        VALUES (
            @IsqueiroUsuarioID, @LocalID, @DataHoraUso,
            'Movido', @Latitude, @Longitude, 'Uso registrado: ' + @TipoUso
        );
    END
    
    SELECT 'Uso registrado com sucesso' AS Mensagem;
END;