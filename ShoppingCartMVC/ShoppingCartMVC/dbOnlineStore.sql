
==== Database : dbOnlineStore =====

Create Database dbOnlineStore
use dbOnlineStore

=== Users ====
CREATE TABLE [dbo].[tblUser] (
    [UserId]   INT          IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (50) NULL,
    [Email]    VARCHAR (50) NULL,
    [Password] VARCHAR (50) NULL,
    [RoleType] INT          NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);




=== Categories ====
CREATE TABLE [dbo].[tblCategories] (
    [CatId] INT          IDENTITY (1, 1) NOT NULL,
    [Name]  VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([CatId] ASC)
);




=== Products ====
CREATE TABLE [dbo].[tblProducts] (
    [ProID]       INT            IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)   NULL,
    [Description] VARCHAR (50)   NULL,
    [Unit]        INT            NULL,
    [Image]       VARCHAR (1000) NULL,
    [CatId]       INT            NULL,
    PRIMARY KEY CLUSTERED ([ProID] ASC),
    CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY ([CatId]) REFERENCES [dbo].[tblCategories] ([CatId])
);


=== Order ====
CREATE TABLE [dbo].[tblOrder] (
    [OrderId]   INT           IDENTITY (1, 1) NOT NULL,
    [ProID]     INT           NULL,
    [Contact]   VARCHAR (50)  NULL,
    [Address]   VARCHAR (100) NULL,
    [Unit]      INT           NULL,
    [Qty]       INT           NULL,
    [Total]     INT           NULL,
    [OrderDate] DATE          NULL,
    [InvoiceId] INT           NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC),
    FOREIGN KEY ([InvoiceId]) REFERENCES [dbo].[tblInvoice] ([InvoiceId]),
    CONSTRAINT [FK_tblOrder_tblProducts] FOREIGN KEY ([ProID]) REFERENCES [dbo].[tblProducts] ([ProID])
);



--=== Invoice ====
CREATE TABLE [dbo].[tblInvoice] (
    [InvoiceId]   INT          IDENTITY (1, 1) NOT NULL,
    [UserId]      INT          NULL,
    [Bill]        INT          NULL,
    [Payment]     VARCHAR (50) NULL,
    [InvoiceDate] DATE         NULL,
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[tblUser] ([UserId])
);
