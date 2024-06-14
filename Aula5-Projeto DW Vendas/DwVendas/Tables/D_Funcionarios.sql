CREATE TABLE Dimensao.D_Funcionarios (
	SK_Funcionario INT NOT null IDENTITY(1,1),
    IdFuncionario INT  NOT null,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
	DataCriacao datetime2(2) NOT NULL,
	DataAlteracao datetime2(2) NOT NULL
	constraint PK_DimensaoFuncionarios primary key(SK_Funcionario)
);
