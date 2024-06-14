
CREATE TABLE Dimensao.D_Produtos (
	SK_Produto INT NOT null IDENTITY(1,1),
    IdProduto INT NOT null ,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    SK_Categoria INT  NOT NULL,
    Estoque INT NOT NULL,
	DataCriacao datetime2(2) NOT NULL,
	DataAlteracao datetime2(2) NOT NULL
	constraint PK_DimensaoProdutos primary key(SK_Produto),
	constraint FK_DimensaoProdutos_Possuem_Categorias FOREIGN KEY(SK_Categoria)
	REFERENCES Dimensao.D_Categorias(SK_Categoria)
);