
CREATE TABLE Fato.Vendas (
	SK_Venda INT NOT null IDENTITY(1,1),
    IdOrdem INT NOT null ,
	IdDetalheOrdem INT NOT null,
    SK_Cliente INT  not null FOREIGN KEY REFERENCES Dimensao.D_Clientes(SK_Cliente),
    SK_Funcionario INT  not null FOREIGN KEY REFERENCES Dimensao.D_Funcionarios(SK_Funcionario),
	SK_IdProduto INT  not null FOREIGN KEY REFERENCES Dimensao.D_Produtos(SK_Produto),
    SK_Loja INT FOREIGN KEY REFERENCES Dimensao.D_Lojas(SK_Loja),
    DataOrdem DATETIME NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
	DataCriacao datetime2(2) NOT NULL,
	DataAlteracao datetime2(2) NOT NULL
	constraint PK_FatoVendas primary key(SK_Venda)
);
