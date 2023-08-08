INSERT INTO Usuarios (idUsuario, [login], senha)
VALUES (1, 'op1', 'op1');

INSERT INTO Usuarios (idUsuario, [login], senha)
VALUES (2, 'op2', 'op2');

INSERT INTO Produtos (idProduto, nome, quantidade, precoVenda)
VALUES (
	1, 
	'Banana', 
	'100',
	'5.00'
	);

INSERT INTO Produtos (idProduto, nome, quantidade, precoVenda)
VALUES (
	3, 
	'Laranja', 
	'500',
	'2.00'
	);

INSERT INTO Produtos (idProduto, nome, quantidade, precoVenda)
VALUES (
	4, 
	'Manga', 
	'800',
	'4.00'
	);

DECLARE @ProximoID INT;
SET @ProximoID = NEXT VALUE FOR seqID;

INSERT INTO Pessoas (idPessoa, nome, cidade, estado, telefone, email)
VALUES (@ProximoID, 'João', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com');

INSERT INTO PessoasFisicas (idPFisica, cpf)
VALUES (@ProximoID, '11111111111');

INSERT INTO Pessoas (idPessoa, nome, cidade, estado, telefone, email)
VALUES (@ProximoID, 'JJC', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com');

INSERT INTO PessoasJuridicas(idPJuridica, cnpj)
VALUES (@ProximoID, '222222222222');

INSERT INTO Movimentos (idMovimentos, idUsuario,  idPessoa, idProduto, Quantidade, Tipo, PrecoUnitario)
VALUES (1, 1, 7, 1, 20,'S', 4.00);

INSERT INTO Movimentos (idMovimentos, idUsuario, idPessoa, idProduto, Quantidade,Tipo, PrecoUnitario)
VALUES (4, 1, 7, 3, 15,'S', 2.00);

INSERT INTO Movimentos (idMovimentos, idUsuario, idPessoa, idProduto, Quantidade,Tipo, PrecoUnitario)
VALUES (5, 2, 7, 3, 10,'S', 3.00);

INSERT INTO Movimentos (idMovimentos, idUsuario, idPessoa, idProduto, Quantidade,Tipo, PrecoUnitario)
VALUES (7, 1, 8, 3, 15,'E', 5.00);

INSERT INTO Movimentos (idMovimentos, idUsuario, idPessoa, idProduto, Quantidade,Tipo, PrecoUnitario)
VALUES (8, 1, 8, 4, 20,'E', 4.00);