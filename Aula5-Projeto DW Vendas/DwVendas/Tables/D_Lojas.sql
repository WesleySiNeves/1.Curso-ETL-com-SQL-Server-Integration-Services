
CREATE TABLE Dimensao.D_Lojas (
	SK_Loja INT NOT null IDENTITY(1,1),
    IdLoja INT  NOT null,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15),
	DataCriacao datetime2(2) NOT NULL,
	DataAlteracao datetime2(2) NOT NULL
	constraint PK_CadastroLojas primary key(SK_Loja)
);