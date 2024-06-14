--Create Schema Cadastro

--go


drop table if exists Cadastro.DetalhesOrdens
drop table if exists  Cadastro.Ordens
drop table if exists Cadastro.Produtos
drop table if exists Cadastro.Funcionarios
drop table if exists Cadastro.Categorias
drop table if exists Cadastro.Clientes
drop table  if exists Cadastro.Lojas



CREATE TABLE Cadastro.Categorias (
    IdCategoria INT  IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
	constraint PK_CadastroCategorias primary key(IdCategoria)

);

CREATE TABLE Cadastro.Funcionarios (
    IdFuncionario INT  IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    Salario DECIMAL(10, 2),
	constraint PK_CadastroFuncionarios primary key(IdFuncionario)
);


CREATE TABLE Cadastro.Clientes (
    IdCliente INT  IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Telefone NVARCHAR(15),
	constraint PK_CadastroClientes primary key(IdCliente)
);

CREATE TABLE Cadastro.Produtos (
    IdProduto INT  IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    IdCategoria INT ,
    Estoque INT NOT NULL
	constraint PK_CadastroProdutos primary key(IdProduto),
	constraint FK_CadastroProdutos_Possuem_Categorias FOREIGN KEY(IdCategoria)
	REFERENCES Cadastro.Categorias(IdCategoria)
	

);


CREATE TABLE Cadastro.Lojas (
    IdLoja INT  IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(200),
    Telefone NVARCHAR(15),
	constraint PK_CadastroLojas primary key(IdLoja)
);

CREATE TABLE Cadastro.Ordens (
    IdOrdem INT IDENTITY(1,1),
    IdCliente INT  not null,
    IdFuncionario INT ,
    IdLoja INT FOREIGN KEY REFERENCES Cadastro.Lojas(IdLoja),
    DataOrdem DATETIME NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
	constraint PK_CadastroOrdens primary key(IdOrdem),
	constraint FK_CadastroOrdens_Possuem_Clientes FOREIGN KEY(IdCliente)
	REFERENCES Cadastro.Clientes(IdCliente),
	constraint FK_CadastroOrdens_Possuem_Funcionarios FOREIGN KEY(IdFuncionario)
	REFERENCES Cadastro.Funcionarios(IdFuncionario),
	constraint FK_CadastroOrdens_Possuem_Lojas FOREIGN KEY(IdLoja)
	REFERENCES Cadastro.Lojas(IdLoja),

);


CREATE TABLE Cadastro.DetalhesOrdens (
    IdDetalheOrdem INT IDENTITY(1,1),
    IdOrdem INT FOREIGN KEY REFERENCES Cadastro.Ordens(IdOrdem),
    IdProduto INT FOREIGN KEY REFERENCES Cadastro.Produtos(IdProduto),
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL,
	constraint PK_CadastroDetalhesOrdens primary key(IdDetalheOrdem), 
	constraint FK_CadastroOrdens_Possuem_DetalhesOrdens FOREIGN KEY(IdOrdem)
	REFERENCES Cadastro.Ordens(IdOrdem),
	constraint FK_CadastroDetalhesOrdens_Possuem_Produtos FOREIGN KEY(IdProduto)
	REFERENCES Cadastro.Produtos(IdProduto),
);