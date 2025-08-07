-- =========================================================
-- 7. TRIGGERS PARA AUDITORIA E CONTROLE
-- =========================================================

-- Trigger para atualizar data de modificação em Usuarios
CREATE TRIGGER tr_Usuarios_Update
ON Usuarios
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE Usuarios 
    SET DataUltimaAtualizacao = GETDATE()
    FROM Usuarios u
    INNER JOIN inserted i ON u.UsuarioID = i.UsuarioID;
END;

-- Trigger para atualizar combustível após uso
CREATE TRIGGER tr_Utilizacao_Insert
ON Utilizacao
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE IsqueirosUsuario
    SET CombustivelAtual = CASE 
        WHEN CombustivelAtual - ISNULL(i.ConsumoEstimadoML, 0.1) < 0 
        THEN 0 
        ELSE CombustivelAtual - ISNULL(i.ConsumoEstimadoML, 0.1)
    END,
    DataAtualizacao = GETDATE()
    FROM IsqueirosUsuario iu
    INNER JOIN inserted i ON iu.IsqueiroUsuarioID = i.IsqueiroUsuarioID;
END;