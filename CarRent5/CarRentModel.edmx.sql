
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/06/2017 12:01:39
-- Generated from EDMX file: c:\users\asus\documents\visual studio 2017\Projects\CarRent5\CarRent5\CarRentModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CR5];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cars'
CREATE TABLE [dbo].[Cars] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CarName] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [License] nvarchar(max)  NOT NULL,
    [StoreId] int  NOT NULL,
    [TypeId] int  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [LName] nvarchar(max)  NOT NULL,
    [Tel] nvarchar(max)  NOT NULL,
    [Credit] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CarTypes'
CREATE TABLE [dbo].[CarTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TypeName] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rentals'
CREATE TABLE [dbo].[Rentals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Pickup_date] nvarchar(max)  NOT NULL,
    [Dropoff_date] nvarchar(max)  NOT NULL,
    [CustomerId] int  NOT NULL,
    [CarId] int  NOT NULL,
    [StoreId] int  NOT NULL
);
GO

-- Creating table 'Stores'
CREATE TABLE [dbo].[Stores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StoreName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Tel] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [PK_Cars]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CarTypes'
ALTER TABLE [dbo].[CarTypes]
ADD CONSTRAINT [PK_CarTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [PK_Rentals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Stores'
ALTER TABLE [dbo].[Stores]
ADD CONSTRAINT [PK_Stores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [FK_RentBy]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RentBy'
CREATE INDEX [IX_FK_RentBy]
ON [dbo].[Rentals]
    ([CustomerId]);
GO

-- Creating foreign key on [CarId] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [FK_Rent]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Cars]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Rent'
CREATE INDEX [IX_FK_Rent]
ON [dbo].[Rentals]
    ([CarId]);
GO

-- Creating foreign key on [StoreId] in table 'Rentals'
ALTER TABLE [dbo].[Rentals]
ADD CONSTRAINT [FK_RentFrom]
    FOREIGN KEY ([StoreId])
    REFERENCES [dbo].[Stores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RentFrom'
CREATE INDEX [IX_FK_RentFrom]
ON [dbo].[Rentals]
    ([StoreId]);
GO

-- Creating foreign key on [StoreId] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [FK_CarIn]
    FOREIGN KEY ([StoreId])
    REFERENCES [dbo].[Stores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarIn'
CREATE INDEX [IX_FK_CarIn]
ON [dbo].[Cars]
    ([StoreId]);
GO

-- Creating foreign key on [TypeId] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [FK_CarType]
    FOREIGN KEY ([TypeId])
    REFERENCES [dbo].[CarTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarType'
CREATE INDEX [IX_FK_CarType]
ON [dbo].[Cars]
    ([TypeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------