-- =========================================================
-- 6. FUNCTIONS PARA CÁLCULOS E ANÁLISES
-- =========================================================

-- Function para calcular idade do usuário
CREATE FUNCTION fn_CalcularIdade(@DataNascimento DATE, @DataReferencia DATE = NULL)
RETURNS INT
AS
BEGIN
    IF @DataReferencia IS NULL
        SET @DataReferencia = CAST(GETDATE() AS DATE);
    
    RETURN DATEDIFF(YEAR, @DataNascimento, @DataReferencia) - 
           CASE WHEN MONTH(@DataNascimento) > MONTH(@DataReferencia) 
                OR (MONTH(@DataNascimento) = MONTH(@DataReferencia) 
                    AND DAY(@DataNascimento) > DAY(@DataReferencia))
                THEN 1 ELSE 0 END;
END;

-- Function para calcular tempo médio entre compras
CREATE FUNCTION fn_TempoMedioEntreCompras(@UsuarioID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TempoMedio DECIMAL(10,2);
    
    SELECT @TempoMedio = AVG(CAST(DiasEntre AS DECIMAL(10,2)))
    FROM (
        SELECT DATEDIFF(DAY, 
            LAG(DataCompra) OVER (ORDER BY DataCompra), 
            DataCompra
        ) AS DiasEntre
        FROM Compras 
        WHERE UsuarioID = @UsuarioID
    ) AS Intervalos
    WHERE DiasEntre IS NOT NULL;
    
    RETURN ISNULL(@TempoMedio, 0);
END;

-- Function para calcular taxa de perda de isqueiros
CREATE FUNCTION fn_TaxaPerdaUsuario(@UsuarioID INT)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @TotalIsqueiros INT, @IsqueirosPerdidos INT, @TaxaPerda DECIMAL(5,2);
    
    SELECT @TotalIsqueiros = COUNT(*),
           @IsqueirosPerdidos = SUM(CASE WHEN StatusAtual = 'Perdido' THEN 1 ELSE 0 END)
    FROM IsqueirosUsuario 
    WHERE UsuarioID = @UsuarioID;
    
    IF @TotalIsqueiros = 0
        SET @TaxaPerda = 0;
    ELSE
        SET @TaxaPerda = (CAST(@IsqueirosPerdidos AS DECIMAL(5,2)) / @TotalIsqueiros) * 100;
    
    RETURN @TaxaPerda;
END;