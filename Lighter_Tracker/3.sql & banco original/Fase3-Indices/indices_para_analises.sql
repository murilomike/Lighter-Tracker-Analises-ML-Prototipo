-- =========================================================
-- 3. CRIAÇÃO DE ÍNDICES PARA PERFORMANCE
-- =========================================================

-- Índices para Usuários
CREATE NONCLUSTERED INDEX IX_Usuarios_Email ON Usuarios(Email);
CREATE NONCLUSTERED INDEX IX_Usuarios_CidadeID ON Usuarios(CidadeID);
CREATE NONCLUSTERED INDEX IX_Usuarios_DataCadastro ON Usuarios(DataCadastro);

-- Índices para Compras
CREATE NONCLUSTERED INDEX IX_Compras_UsuarioID_DataCompra ON Compras(UsuarioID, DataCompra DESC);
CREATE NONCLUSTERED INDEX IX_Compras_EstabelecimentoID ON Compras(EstabelecimentoID);
CREATE NONCLUSTERED INDEX IX_Compras_DataCompra ON Compras(DataCompra DESC);

-- Índices para Utilização
CREATE NONCLUSTERED INDEX IX_Utilizacao_IsqueiroUsuarioID_DataHoraUso ON Utilizacao(IsqueiroUsuarioID, DataHoraUso DESC);
CREATE NONCLUSTERED INDEX IX_Utilizacao_LocalID ON Utilizacao(LocalID);
CREATE NONCLUSTERED INDEX IX_Utilizacao_DataHoraUso ON Utilizacao(DataHoraUso DESC);

-- Índices para IsqueirosUsuario
CREATE NONCLUSTERED INDEX IX_IsqueirosUsuario_UsuarioID_StatusAtual ON IsqueirosUsuario(UsuarioID, StatusAtual);
CREATE NONCLUSTERED INDEX IX_IsqueirosUsuario_DataCompra ON IsqueirosUsuario(DataCompra DESC);

-- Índices compostos para análises
CREATE NONCLUSTERED INDEX IX_Compras_Usuario_Estabelecimento_Data 
ON Compras(UsuarioID, EstabelecimentoID, DataCompra DESC);