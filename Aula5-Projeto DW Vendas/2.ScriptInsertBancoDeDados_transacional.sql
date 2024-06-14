delete from Cadastro.DetalhesOrdens
delete from Cadastro.Ordens
delete from Cadastro.Produtos
delete from Cadastro.Categorias
delete from Cadastro.Clientes
delete from Cadastro.Funcionarios
delete from Cadastro.Lojas

DBCC CHECKIDENT ('Cadastro.Categorias', RESEED, 0);
DBCC CHECKIDENT ('Cadastro.Produtos', RESEED, 0);
DBCC CHECKIDENT ('Cadastro.Funcionarios', RESEED, 0);
DBCC CHECKIDENT ('Cadastro.Clientes', RESEED, 0);
DBCC CHECKIDENT ('Cadastro.Lojas', RESEED, 0);
DBCC CHECKIDENT ('Cadastro.Ordens', RESEED, 0);
DBCC CHECKIDENT ('Cadastro.DetalhesOrdens', RESEED, 0);

INSERT INTO Cadastro.Categorias (Nome) VALUES
('Eletr�nicos'),
('Livros'),
('Roupas'),
('M�veis'),
('Brinquedos');

INSERT INTO Cadastro.Produtos (Nome, Preco, IdCategoria, Estoque) VALUES
('Smartphone', 999.99, 1, 50),
('Notebook', 1999.99, 1, 30),
('Livro de SQL', 49.99, 2, 100),
('Camiseta', 29.99, 3, 200),
('Sof�', 899.99, 4, 10),
('Boneca', 19.99, 5, 150),
('Tablet', 499.99, 1, 75),
('Monitor 24"', 199.99, 1, 40),
('Mouse Gamer', 39.99, 1, 150),
('Teclado Mec�nico', 79.99, 1, 60),
('Fone de Ouvido', 29.99, 1, 120),
('Livro de Python', 59.99, 2, 80),
('Livro de Java', 69.99, 2, 70),
('Cal�a Jeans', 89.99, 3, 100),
('Jaqueta de Couro', 299.99, 3, 30),
('Cadeira de Escrit�rio', 399.99, 4, 20),
('Arm�rio de Cozinha', 499.99, 4, 15),
('Carrinho de Controle Remoto', 49.99, 5, 100),
('Quebra-Cabe�a 1000 Pe�as', 24.99, 5, 200);

INSERT INTO Cadastro.Funcionarios (Nome, Cargo, Salario) VALUES
('Jo�o Silva', 'Gerente', 5000.00),
('Maria Souza', 'Vendedor', 3000.00),
('Carlos Pereira', 'Caixa', 2000.00),
('Ana Oliveira', 'Assistente', 2500.00);

INSERT INTO Cadastro.Clientes (Nome, Email, Telefone) VALUES
('Lucas Martins', 'lucas.martins@example.com', '11999999999'),
('Mariana Lima', 'mariana.lima@example.com', '21988888888'),
('Pedro Santos', 'pedro.santos@example.com', '31977777777'),
('Fernanda Costa', 'fernanda.costa@example.com', '41966666666');

INSERT INTO Cadastro.Lojas (Nome, Endereco, Telefone) VALUES
('Loja Centro', 'Rua Central, 123, Centro', '1133333333'),
('Loja Norte', 'Avenida Norte, 456, Zona Norte', '1144444444'),
('Loja Sul', 'Rua Sul, 789, Zona Sul', '1155555555'),
('Loja Leste', 'Avenida Leste, 987, Zona Leste', '1166666666'),
('Loja Oeste', 'Rua Oeste, 654, Zona Oeste', '1177777777'),
('Loja Centro II', 'Rua Central, 1234, Centro', '1188888888'),
('Loja Norte II', 'Avenida Norte, 4567, Zona Norte', '1199999999'),
('Loja Sul II', 'Rua Sul, 8901, Zona Sul', '1110000000');


INSERT INTO Cadastro.Ordens (IdCliente, IdFuncionario, IdLoja, DataOrdem, Total) VALUES
(1, 1, 1, '2023-05-01 10:00:00', 1049.98),
(2, 2, 2, '2023-05-02 14:30:00', 2049.98),
(3, 3, 3, '2023-05-03 09:45:00', 49.99),
(4, 4, 1, '2023-05-04 11:20:00', 929.98),
(1, 2, 2, '2023-05-05 13:15:00', 1499.97),
(2, 1, 1, '2023-05-06 16:40:00', 329.97),
(3, 4, 3, '2023-05-07 10:30:00', 99.98),
(4, 3, 1, '2023-05-08 15:50:00', 699.98),
(1, 1, 2, '2023-05-09 09:00:00', 599.99),
(2, 2, 3, '2023-05-10 11:20:00', 124.99),
(3, 3, 2, '2023-05-11 14:10:00', 289.99),
(4, 4, 3, '2023-05-12 08:45:00', 999.99),
(1, 2, 1, '2023-05-13 17:30:00', 849.98),
(2, 3, 2, '2023-05-14 12:25:00', 179.99);



INSERT INTO Cadastro.DetalhesOrdens (IdOrdem, IdProduto, Quantidade, PrecoUnitario) VALUES
(5, 1, 1, 999.99),
(5, 2, 1, 499.99),
(6, 3, 2, 29.99),
(6, 4, 1, 199.99),
(7, 6, 1, 59.99),
(7, 7, 1, 69.99),
(8, 9, 1, 299.99),
(8, 10, 1, 399.99),
(9, 1, 1, 999.99),
(9, 3, 2, 29.99),
(10, 5, 1, 49.99),
(10, 8, 1, 89.99),
(11, 11, 1, 499.99),
(11, 12, 2, 24.99),
(12, 1, 1, 999.99),
(12, 13, 1, 24.99),
(13, 3, 1, 29.99),
(13, 6, 1, 59.99),
(14, 2, 1, 499.99),
(14, 7, 1, 69.99);

