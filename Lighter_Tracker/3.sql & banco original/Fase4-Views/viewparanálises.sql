-- =========================================================
-- 4. CRIAÇÃO DE VIEWS PARA ANÁLISES
-- =========================================================

-- View para análise de compras consolidadas
CREATE VIEW vw_ComprasConsolidadas AS
SELECT 
    c.CompraID,
    c.UsuarioID,
    u.Nome AS NomeUsuario,
    u.Genero,
    u.Fumante,
    DATEDIFF(YEAR, u.DataNascimento, c.DataCompra) AS IdadeNaCompra,
    c.EstabelecimentoID,
    e.NomeEstabelecimento,
    te.NomeTipo AS TipoEstabelecimento,
    ci.NomeCidade,
    es.SiglaEstado,
    c.DataCompra,
    YEAR(c.DataCompra) AS AnoCompra,
    MONTH(c.DataCompra) AS MesCompra,
    DATENAME(WEEKDAY, c.DataCompra) AS DiaSemanaCompra,
    c.ValorTotal,
    c.MetodoPagamento,
    COUNT(ic.ItemCompraID) AS QuantidadeItens,
    SUM(ic.Quantidade) AS TotalIsqueiros
FROM Compras c
    INNER JOIN Usuarios u ON c.UsuarioID = u.UsuarioID
    INNER JOIN Estabelecimentos e ON c.EstabelecimentoID = e.EstabelecimentoID
    INNER JOIN TiposEstabelecimento te ON e.TipoEstabelecimentoID = te.TipoEstabelecimentoID
    INNER JOIN Cidades ci ON e.CidadeID = ci.CidadeID
    INNER JOIN Estados es ON ci.EstadoID = es.EstadoID
    INNER JOIN ItensCompra ic ON c.CompraID = ic.CompraID
GROUP BY 
    c.CompraID, c.UsuarioID, u.Nome, u.Genero, u.Fumante, u.DataNascimento,
    c.EstabelecimentoID, e.NomeEstabelecimento, te.NomeTipo,
    ci.Nome

	-- View para análise de utilização
CREATE VIEW vw_UtilizacaoAnalise AS
SELECT 
    u.UtilizacaoID,
    iu.IsqueiroUsuarioID,
    iu.UsuarioID,
    usr.Nome AS NomeUsuario,
    usr.Fumante,
    i.Modelo AS ModeloIsqueiro,
    m.NomeMarca,
    u.DataHoraUso,
    YEAR(u.DataHoraUso) AS AnoUso,
    MONTH(u.DataHoraUso) AS MesUso,
    DATEPART(HOUR, u.DataHoraUso) AS HoraUso,
    DATENAME(WEEKDAY, u.DataHoraUso) AS DiaSemanaUso,
    u.TipoUso,
    u.DuracaoUsoSegundos,
    u.ConsumoEstimadoML,
    l.NomeLocal,
    l.TipoLocal,
    DATEDIFF(DAY, iu.DataCompra, u.DataHoraUso) AS DiasDesdeCompra
FROM Utilizacao u
    INNER JOIN IsqueirosUsuario iu ON u.IsqueiroUsuarioID = iu.IsqueiroUsuarioID
    INNER JOIN Usuarios usr ON iu.UsuarioID = usr.UsuarioID
    INNER JOIN ItensCompra ic ON iu.ItemCompraID = ic.ItemCompraID
    INNER JOIN Isqueiros i ON ic.IsqueiroID = i.IsqueiroID
    INNER JOIN Marcas m ON i.MarcaID = m.MarcaID
    LEFT JOIN Locais l ON u.LocalID = l.LocalID;

SELECT * FROM vw_UtilizacaoAnalise;
