
SELECT P.*, PF.*
FROM PessoasFisicas PF
INNER JOIN Pessoas P ON PF.idPFisica = P.idPessoa;

SELECT P.*, PJ.*
FROM PessoasJuridicas PJ
INNER JOIN Pessoas P ON PJ.idPJuridica = P.idPessoa;

SELECT
    M.idMovimentos,
    P.nome AS Produto,
    F.nome AS Fornecedor,
    M.Quantidade,
    M.PrecoUnitario,
    M.Quantidade * M.PrecoUnitario AS ValorTotal
FROM
    Movimentos M
JOIN
    Produtos P ON M.idProduto = P.idProduto
JOIN
    Pessoas F ON M.idPessoa = F.idPessoa
WHERE
    M.Tipo = 'E';

SELECT
    M.idMovimentos,
    P.nome AS Produto,
    C.nome AS Comprador,
    M.Quantidade,
    M.PrecoUnitario,
    M.Quantidade * M.PrecoUnitario AS ValorTotal
FROM
    Movimentos M
JOIN
    Produtos P ON M.idProduto = P.idProduto
JOIN
    Pessoas C ON M.idPessoa = C.idPessoa
WHERE
    M.Tipo = 'S';


SELECT
    P.nome AS Produto,
    SUM(M.Quantidade * M.PrecoUnitario) AS ValorTotalEntradas
FROM
    Movimentos M
JOIN
    Produtos P ON M.idProduto = P.idProduto
WHERE
    M.Tipo = 'E' 
GROUP BY
    P.nome;

SELECT
    P.nome AS Produto,
    SUM(M.Quantidade * M.PrecoUnitario) AS ValorTotalSaidas
FROM
    Movimentos M
JOIN
    Produtos P ON M.idProduto = P.idProduto
WHERE
    M.Tipo = 'S' -- Movimentações de saída
GROUP BY
    P.nome;

SELECT
    U.[login] AS Operador
FROM
    Usuarios U
LEFT JOIN
    Movimentos M ON U.idUsuario = M.idUsuario AND M.Tipo = 'E'
WHERE
    M.idMovimentos IS NULL;

SELECT
    U.[login] AS Operador,
    SUM(M.Quantidade * M.PrecoUnitario) AS ValorTotalEntrada
FROM
    Usuarios U
JOIN
    Movimentos M ON U.idUsuario = M.idUsuario AND M.Tipo = 'E'
GROUP BY
    U.[login];

SELECT
    U.[login] AS Operador,
    SUM(M.Quantidade * M.PrecoUnitario) AS ValorTotalSaida
FROM
    Usuarios U
JOIN
    Movimentos M ON U.idUsuario = M.idUsuario AND M.Tipo = 'S'
GROUP BY
    U.[login];

SELECT
    P.nome AS Produto,
    CAST(ROUND(SUM(M.Quantidade * M.PrecoUnitario) / SUM(M.Quantidade), 2) AS DECIMAL(10, 2)) AS ValorMedioVenda
FROM
    Produtos P
JOIN
    Movimentos M ON P.idProduto = M.idProduto AND M.Tipo = 'S'
GROUP BY
    P.nome;