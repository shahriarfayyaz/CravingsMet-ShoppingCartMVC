
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/18/2023 23:12:27
-- Generated from EDMX file: E:\Vs 2017\CravingsMet\ShoppingCartMVC\ShoppingCartMVC\ShoppingCartMVC\Models\dbOnlineStoreModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [dbOnlineStore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__tblInvoic__UserI__1B0907CE]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblInvoice] DROP CONSTRAINT [FK__tblInvoic__UserI__1B0907CE];
GO
IF OBJECT_ID(N'[dbo].[FK__tblOrder__Invoic__21B6055D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblOrder] DROP CONSTRAINT [FK__tblOrder__Invoic__21B6055D];
GO
IF OBJECT_ID(N'[dbo].[FK_tblOrder_tblProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblOrder] DROP CONSTRAINT [FK_tblOrder_tblProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_tblProducts_tblCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[tblProducts] DROP CONSTRAINT [FK_tblProducts_tblCategories];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tblCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblCategories];
GO
IF OBJECT_ID(N'[dbo].[tblInvoice]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblInvoice];
GO
IF OBJECT_ID(N'[dbo].[tblOrder]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblOrder];
GO
IF OBJECT_ID(N'[dbo].[tblProducts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblProducts];
GO
IF OBJECT_ID(N'[dbo].[tblUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tblUser];
GO
IF OBJECT_ID(N'[dbOnlineStoreModelStoreContainer].[getallorders]', 'U') IS NOT NULL
    DROP TABLE [dbOnlineStoreModelStoreContainer].[getallorders];
GO
IF OBJECT_ID(N'[dbOnlineStoreModelStoreContainer].[getallorderusers]', 'U') IS NOT NULL
    DROP TABLE [dbOnlineStoreModelStoreContainer].[getallorderusers];
GO
IF OBJECT_ID(N'[dbOnlineStoreModelStoreContainer].[user_invoices]', 'U') IS NOT NULL
    DROP TABLE [dbOnlineStoreModelStoreContainer].[user_invoices];
GO
IF OBJECT_ID(N'[dbOnlineStoreModelStoreContainer].[viewallproducts]', 'U') IS NOT NULL
    DROP TABLE [dbOnlineStoreModelStoreContainer].[viewallproducts];
GO
IF OBJECT_ID(N'[dbOnlineStoreModelStoreContainer].[vw_getallproducts]', 'U') IS NOT NULL
    DROP TABLE [dbOnlineStoreModelStoreContainer].[vw_getallproducts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tblCategories'
CREATE TABLE [dbo].[tblCategories] (
    [CatId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NULL
);
GO

-- Creating table 'tblInvoices'
CREATE TABLE [dbo].[tblInvoices] (
    [InvoiceId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NULL,
    [Bill] int  NULL,
    [Payment] varchar(50)  NULL,
    [InvoiceDate] datetime  NULL
);
GO

-- Creating table 'tblOrders'
CREATE TABLE [dbo].[tblOrders] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [ProID] int  NULL,
    [Contact] varchar(50)  NULL,
    [Address] varchar(100)  NULL,
    [Unit] int  NULL,
    [Qty] int  NULL,
    [Total] int  NULL,
    [OrderDate] datetime  NULL,
    [InvoiceId] int  NULL
);
GO

-- Creating table 'tblProducts'
CREATE TABLE [dbo].[tblProducts] (
    [ProID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NULL,
    [Description] varchar(50)  NULL,
    [Unit] int  NULL,
    [Image] varchar(1000)  NULL,
    [CatId] int  NULL
);
GO

-- Creating table 'tblUsers'
CREATE TABLE [dbo].[tblUsers] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NULL,
    [Email] varchar(50)  NULL,
    [Password] varchar(50)  NULL,
    [RoleType] int  NULL
);
GO

-- Creating table 'vw_getallproducts'
CREATE TABLE [dbo].[vw_getallproducts] (
    [ProID] int  NOT NULL,
    [cat_name] varchar(50)  NULL,
    [Description] varchar(50)  NULL,
    [Unit] int  NULL,
    [Image] varchar(1000)  NULL
);
GO

-- Creating table 'viewallproducts'
CREATE TABLE [dbo].[viewallproducts] (
    [ProID] int  NOT NULL,
    [pro_name] varchar(50)  NULL,
    [pro_categories] varchar(50)  NULL,
    [Description] varchar(50)  NULL,
    [Unit] int  NULL,
    [Image] varchar(1000)  NULL
);
GO

-- Creating table 'getallorders'
CREATE TABLE [dbo].[getallorders] (
    [InvoiceId] int  NOT NULL,
    [user] varchar(50)  NULL,
    [pro_name] varchar(50)  NULL,
    [Contact] varchar(50)  NULL,
    [Address] varchar(100)  NULL,
    [Unit] int  NULL,
    [Qty] int  NULL,
    [Total] int  NULL,
    [Bill] int  NULL,
    [Payment] varchar(50)  NULL,
    [InvoiceDate] datetime  NULL
);
GO

-- Creating table 'getallorderusers'
CREATE TABLE [dbo].[getallorderusers] (
    [InvoiceId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [user] varchar(50)  NULL,
    [Bill] int  NULL,
    [Payment] varchar(50)  NULL,
    [InvoiceDate] datetime  NULL
);
GO

-- Creating table 'user_invoices'
CREATE TABLE [dbo].[user_invoices] (
    [InvoiceId] int  NOT NULL,
    [Name] varchar(50)  NULL,
    [Unit] int  NULL,
    [Qty] int  NULL,
    [UserId] int  NOT NULL,
    [Total] int  NULL,
    [Contact] varchar(50)  NULL,
    [Address] varchar(100)  NULL,
    [Customer] varchar(50)  NULL,
    [Bill] int  NULL,
    [Payment] varchar(50)  NULL,
    [InvoiceDate] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CatId] in table 'tblCategories'
ALTER TABLE [dbo].[tblCategories]
ADD CONSTRAINT [PK_tblCategories]
    PRIMARY KEY CLUSTERED ([CatId] ASC);
GO

-- Creating primary key on [InvoiceId] in table 'tblInvoices'
ALTER TABLE [dbo].[tblInvoices]
ADD CONSTRAINT [PK_tblInvoices]
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC);
GO

-- Creating primary key on [OrderId] in table 'tblOrders'
ALTER TABLE [dbo].[tblOrders]
ADD CONSTRAINT [PK_tblOrders]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [ProID] in table 'tblProducts'
ALTER TABLE [dbo].[tblProducts]
ADD CONSTRAINT [PK_tblProducts]
    PRIMARY KEY CLUSTERED ([ProID] ASC);
GO

-- Creating primary key on [UserId] in table 'tblUsers'
ALTER TABLE [dbo].[tblUsers]
ADD CONSTRAINT [PK_tblUsers]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [ProID] in table 'vw_getallproducts'
ALTER TABLE [dbo].[vw_getallproducts]
ADD CONSTRAINT [PK_vw_getallproducts]
    PRIMARY KEY CLUSTERED ([ProID] ASC);
GO

-- Creating primary key on [ProID] in table 'viewallproducts'
ALTER TABLE [dbo].[viewallproducts]
ADD CONSTRAINT [PK_viewallproducts]
    PRIMARY KEY CLUSTERED ([ProID] ASC);
GO

-- Creating primary key on [InvoiceId] in table 'getallorders'
ALTER TABLE [dbo].[getallorders]
ADD CONSTRAINT [PK_getallorders]
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC);
GO

-- Creating primary key on [InvoiceId], [UserId] in table 'getallorderusers'
ALTER TABLE [dbo].[getallorderusers]
ADD CONSTRAINT [PK_getallorderusers]
    PRIMARY KEY CLUSTERED ([InvoiceId], [UserId] ASC);
GO

-- Creating primary key on [InvoiceId], [UserId] in table 'user_invoices'
ALTER TABLE [dbo].[user_invoices]
ADD CONSTRAINT [PK_user_invoices]
    PRIMARY KEY CLUSTERED ([InvoiceId], [UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CatId] in table 'tblProducts'
ALTER TABLE [dbo].[tblProducts]
ADD CONSTRAINT [FK_tblProducts_tblCategories]
    FOREIGN KEY ([CatId])
    REFERENCES [dbo].[tblCategories]
        ([CatId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tblProducts_tblCategories'
CREATE INDEX [IX_FK_tblProducts_tblCategories]
ON [dbo].[tblProducts]
    ([CatId]);
GO

-- Creating foreign key on [UserId] in table 'tblInvoices'
ALTER TABLE [dbo].[tblInvoices]
ADD CONSTRAINT [FK__tblInvoic__UserI__1B0907CE]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[tblUsers]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblInvoic__UserI__1B0907CE'
CREATE INDEX [IX_FK__tblInvoic__UserI__1B0907CE]
ON [dbo].[tblInvoices]
    ([UserId]);
GO

-- Creating foreign key on [InvoiceId] in table 'tblOrders'
ALTER TABLE [dbo].[tblOrders]
ADD CONSTRAINT [FK__tblOrder__Invoic__21B6055D]
    FOREIGN KEY ([InvoiceId])
    REFERENCES [dbo].[tblInvoices]
        ([InvoiceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__tblOrder__Invoic__21B6055D'
CREATE INDEX [IX_FK__tblOrder__Invoic__21B6055D]
ON [dbo].[tblOrders]
    ([InvoiceId]);
GO

-- Creating foreign key on [ProID] in table 'tblOrders'
ALTER TABLE [dbo].[tblOrders]
ADD CONSTRAINT [FK_tblOrder_tblProducts]
    FOREIGN KEY ([ProID])
    REFERENCES [dbo].[tblProducts]
        ([ProID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tblOrder_tblProducts'
CREATE INDEX [IX_FK_tblOrder_tblProducts]
ON [dbo].[tblOrders]
    ([ProID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------