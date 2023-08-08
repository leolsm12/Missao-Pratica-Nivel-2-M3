CREATE DATABASE Loja;

CREATE TABLE Usuarios (
    idUsuario INT PRIMARY KEY,
    [login] VARCHAR(255),
    senha VARCHAR(255)
);
CREATE TABLE Pessoas (
    idPessoa INT PRIMARY KEY,
    nome VARCHAR(255),
	cidade VARCHAR(255),
	estado CHAR(2),
	telefone VARCHAR(11),
	email VARCHAR(255)
);
CREATE TABLE PessoasFisicas (
    idPFisica INT PRIMARY KEY DEFAULT NEXT VALUE FOR seqId,
    cpf VARCHAR(14),
    FOREIGN KEY (idPFisica) REFERENCES Pessoas(idPessoa)
);
CREATE TABLE PessoasJuridicas (
    idPJuridica INT PRIMARY KEY DEFAULT NEXT VALUE FOR seqId,
    cnpj VARCHAR(14),
    FOREIGN KEY (idPjuridica) REFERENCES Pessoas(idPessoa)
);
CREATE TABLE Produtos (
    idProduto INT PRIMARY KEY,
    nome VARCHAR(255),
    quantidade INT,
    precoVenda NUMERIC(10, 2)
);
CREATE TABLE Movimentos (
    idMovimentos INT PRIMARY KEY,
    idUsuario INT,
	idPessoa INT,
	idProduto INT,
	Quantidade INT,
	Tipo CHAR(1) CHECK (Tipo IN ('E', 'S')),
    PrecoUnitario NUMERIC(10, 2),
	FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto),
    FOREIGN KEY (idPessoa) REFERENCES Pessoas(idPessoa)
);
CREATE SEQUENCE seqId
    AS INT
    START WITH 1
    INCREMENT BY 1;

