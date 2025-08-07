-- =========================================================
-- 9. PROCEDURES PARA GERAÇÃO DE DADOS SIMULADOS
-- =========================================================

-- Procedure para gerar usuários simulados
CREATE PROCEDURE sp_GerarUsuariosSimulados
    @Quantidade INT = 100
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @i INT = 1;
    DECLARE @Nome VARCHAR(100), @Email VARCHAR(150), @DataNasc DATE;
    DECLARE @Genero CHAR(1), @CidadeID INT, @Fumante BIT;
    
    WHILE @i <= @Quantidade
    BEGIN
        -- Gerar dados aleatórios
        SET @Nome = 'Usuário Teste ' + CAST(@i AS VARCHAR(10));
        SET @Email = 'usuario' + CAST(@i AS VARCHAR(10)) + '@teste.com';
        SET @DataNasc = DATEADD(YEAR, -ABS(CHECKSUM(NEWID()) % 50 + 18), GETDATE());
        SET @Genero = CASE WHEN ABS(CHECKSUM(NEWID()) % 2) = 0 THEN 'M' ELSE 'F' END;
        SET @CidadeID = (SELECT TOP 1 CidadeID FROM Cidades ORDER BY NEWID());
        SET @Fumante = CASE WHEN ABS(CHECKSUM(NEWID()) % 3) = 0 THEN 1 ELSE 0 END;
        
        INSERT INTO Usuarios (Nome, Email, DataNascimento, Genero, CidadeID, Fumante)
        VALUES (@Nome, @Email, @DataNasc, @Genero, @CidadeID, @Fumante);
        
        SET @i = @i + 1;
    END
    
    SELECT 'Usuários simulados gerados com sucesso' AS Mensagem;
END;

-- Procedure para gerar compras simuladas
CREATE PROCEDURE sp_GerarComprasSimuladas
    @Quantidade INT = 500
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @i INT = 1;
    DECLARE @UsuarioID INT, @EstabelecimentoID INT, @IsqueiroID INT;
    DECLARE @DataCompra DATETIME2, @PrecoUnitario DECIMAL(8,2);
    DECLARE @MetodoPagamento VARCHAR(20);
    
    WHILE @i <= @Quantidade
    BEGIN
        -- Selecionar dados aleatórios
        SET @UsuarioID = (SELECT TOP 1 UsuarioID FROM Usuarios ORDER BY NEWID());
        SET @EstabelecimentoID = (SELECT TOP 1 EstabelecimentoID FROM Estabelecimentos ORDER BY NEWID());
        SET @IsqueiroID = (SELECT TOP 1 IsqueiroID FROM Isqueiros ORDER BY NEWID());
        SET @DataCompra = DATEADD(DAY, -ABS(CHECKSUM(NEWID()) % 365), GETDATE());
        SET @PrecoUnitario = (SELECT PrecoSugerido FROM Isqueiros WHERE IsqueiroID = @IsqueiroID);
        SET @MetodoPagamento = CASE ABS(CHECKSUM(NEWID()) % 4)
            WHEN 0 THEN 'Dinheiro'
            WHEN 1 THEN 'Cartão Débito'
            WHEN 2 THEN 'Cartão Crédito'
            ELSE 'PIX'
        END;
        
        EXEC sp_InserirCompra 
            @UsuarioID = @UsuarioID,
            @EstabelecimentoID = @EstabelecimentoID,
            @DataCompra = @DataCompra,
            @MetodoPagamento = @MetodoPagamento,
            @IsqueiroID = @IsqueiroID,
            @Quantidade = 1,
            @PrecoUnitario = @PrecoUnitario;
        
        SET @i = @i + 1;
    END
    
    SELECT 'Compras simuladas geradas com sucesso' AS Mensagem;
END;