﻿/*
Deployment script for DWVendas

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DWVendas"
:setvar DefaultFilePrefix "DWVendas"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Table [Dimensao].[D_Clientes]...';


GO
CREATE TABLE [Dimensao].[D_Clientes] (
    [SK_Cliente]    INT           IDENTITY (1, 1) NOT NULL,
    [IdCliente]     INT           NOT NULL,
    [Nome]          VARCHAR (100) NOT NULL,
    [Email]         VARCHAR (100) NULL,
    [Telefone]      VARCHAR (15)  NULL,
    [DataCriacao]   DATETIME2 (2) NOT NULL,
    [DataAlteracao] DATETIME2 (2) NOT NULL,
    CONSTRAINT [PK_DimensaoClientes] PRIMARY KEY CLUSTERED ([SK_Cliente] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);


GO
PRINT N'Creating Table [Dimensao].[D_Funcionarios]...';


GO
CREATE TABLE [Dimensao].[D_Funcionarios] (
    [SK_Funcionario] INT             IDENTITY (1, 1) NOT NULL,
    [IdFuncionario]  INT             NOT NULL,
    [Nome]           VARCHAR (100)   NOT NULL,
    [Cargo]          VARCHAR (50)    NULL,
    [Salario]        DECIMAL (10, 2) NULL,
    [DataCriacao]    DATETIME2 (2)   NOT NULL,
    [DataAlteracao]  DATETIME2 (2)   NOT NULL,
    CONSTRAINT [PK_DimensaoFuncionarios] PRIMARY KEY CLUSTERED ([SK_Funcionario] ASC)
);


GO
PRINT N'Creating Table [Dimensao].[D_Lojas]...';


GO
CREATE TABLE [Dimensao].[D_Lojas] (
    [SK_Loja]       INT           IDENTITY (1, 1) NOT NULL,
    [IdLoja]        INT           NOT NULL,
    [Nome]          VARCHAR (100) NOT NULL,
    [Endereco]      VARCHAR (200) NULL,
    [Telefone]      VARCHAR (15)  NULL,
    [DataCriacao]   DATETIME2 (2) NOT NULL,
    [DataAlteracao] DATETIME2 (2) NOT NULL,
    CONSTRAINT [PK_CadastroLojas] PRIMARY KEY CLUSTERED ([SK_Loja] ASC)
);


GO
PRINT N'Creating Table [Dimensao].[D_Produtos]...';


GO
CREATE TABLE [Dimensao].[D_Produtos] (
    [SK_Produto]    INT             IDENTITY (1, 1) NOT NULL,
    [IdProduto]     INT             NOT NULL,
    [Nome]          VARCHAR (100)   NOT NULL,
    [Preco]         DECIMAL (10, 2) NOT NULL,
    [SK_Categoria]  INT             NOT NULL,
    [Estoque]       INT             NOT NULL,
    [DataCriacao]   DATETIME2 (2)   NOT NULL,
    [DataAlteracao] DATETIME2 (2)   NOT NULL,
    CONSTRAINT [PK_DimensaoProdutos] PRIMARY KEY CLUSTERED ([SK_Produto] ASC)
);


GO
PRINT N'Creating Table [Fato].[Vendas]...';


GO
CREATE TABLE [Fato].[Vendas] (
    [SK_Venda]       INT             IDENTITY (1, 1) NOT NULL,
    [IdOrdem]        INT             NOT NULL,
    [IdDetalheOrdem] INT             NOT NULL,
    [SK_Cliente]     INT             NOT NULL,
    [SK_Funcionario] INT             NOT NULL,
    [SK_IdProduto]   INT             NOT NULL,
    [SK_Loja]        INT             NULL,
    [DataOrdem]      DATETIME        NOT NULL,
    [Quantidade]     INT             NOT NULL,
    [PrecoUnitario]  DECIMAL (10, 2) NOT NULL,
    [DataCriacao]    DATETIME2 (2)   NOT NULL,
    [DataAlteracao]  DATETIME2 (2)   NOT NULL,
    CONSTRAINT [PK_FatoVendas] PRIMARY KEY CLUSTERED ([SK_Venda] ASC)
);


GO
PRINT N'Creating Foreign Key [Dimensao].[FK_DimensaoProdutos_Possuem_Categorias]...';


GO
ALTER TABLE [Dimensao].[D_Produtos] WITH NOCHECK
    ADD CONSTRAINT [FK_DimensaoProdutos_Possuem_Categorias] FOREIGN KEY ([SK_Categoria]) REFERENCES [Dimensao].[D_Categorias] ([SK_Categoria]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [Fato].[Vendas]...';


GO
ALTER TABLE [Fato].[Vendas] WITH NOCHECK
    ADD FOREIGN KEY ([SK_Cliente]) REFERENCES [Dimensao].[D_Clientes] ([SK_Cliente]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [Fato].[Vendas]...';


GO
ALTER TABLE [Fato].[Vendas] WITH NOCHECK
    ADD FOREIGN KEY ([SK_Funcionario]) REFERENCES [Dimensao].[D_Funcionarios] ([SK_Funcionario]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [Fato].[Vendas]...';


GO
ALTER TABLE [Fato].[Vendas] WITH NOCHECK
    ADD FOREIGN KEY ([SK_IdProduto]) REFERENCES [Dimensao].[D_Produtos] ([SK_Produto]);


GO
PRINT N'Creating Foreign Key unnamed constraint on [Fato].[Vendas]...';


GO
ALTER TABLE [Fato].[Vendas] WITH NOCHECK
    ADD FOREIGN KEY ([SK_Loja]) REFERENCES [Dimensao].[D_Lojas] ([SK_Loja]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [Dimensao].[D_Produtos] WITH CHECK CHECK CONSTRAINT [FK_DimensaoProdutos_Possuem_Categorias];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'Fato.Vendas'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Checking constraint: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Constraint verification failed:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'An error occurred while verifying constraints', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update complete.';


GO