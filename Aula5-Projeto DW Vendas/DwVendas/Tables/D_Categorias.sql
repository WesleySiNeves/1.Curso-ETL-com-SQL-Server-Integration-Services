CREATE TABLE Dimensao.D_Categorias 
(
	SK_Categoria INT not null IDENTITY(1,1),
    IdCategoria INT  ,
    Nome VARCHAR(100) NOT NULL,
	DataCriacao datetime2(2) NOT NULL,
	DataAlteracao datetime2(2) NOT NULL,
	teste int,
	constraint PK_DimensaoCategorias primary key(SK_Categoria)
);