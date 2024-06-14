
CREATE TABLE Dimensao.D_Clientes (
	SK_Cliente INT NOT null IDENTITY(1,1),
    IdCliente INT NOT null ,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(15),
	DataCriacao datetime2(2) NOT NULL,
	DataAlteracao datetime2(2) NOT NULL
	constraint PK_DimensaoClientes primary key(SK_Cliente)
);
