
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/02/2021 11:16:43
-- Generated from EDMX file: C:\Users\buiph\Desktop\Topgun\ASP.NET_MVC\Librayry\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Library];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CategoryBook]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_CategoryBook];
GO
IF OBJECT_ID(N'[dbo].[FK_BookCallCardDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CallCardDetails] DROP CONSTRAINT [FK_BookCallCardDetail];
GO
IF OBJECT_ID(N'[dbo].[FK_CallCardCallCardDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CallCardDetails] DROP CONSTRAINT [FK_CallCardCallCardDetail];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCallCard]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CallCards] DROP CONSTRAINT [FK_UserCallCard];
GO
IF OBJECT_ID(N'[dbo].[FK_UserUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_UserUserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleUserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRoles] DROP CONSTRAINT [FK_RoleUserRole];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Books]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Books];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[CallCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CallCards];
GO
IF OBJECT_ID(N'[dbo].[CallCardDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CallCardDetails];
GO
IF OBJECT_ID(N'[dbo].[UserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [BookId] nvarchar(max)  NOT NULL,
    [BookName] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Language] nvarchar(max)  NOT NULL,
    [Author] nvarchar(max)  NOT NULL,
    [Publisher] nvarchar(max)  NOT NULL,
    [Quantity] int  NOT NULL,
    [RemainQuantity] int  NOT NULL,
    [DateAdd] datetime  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Passworld] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'CallCards'
CREATE TABLE [dbo].[CallCards] (
    [CallCardId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [BorrowDate] datetime  NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CallCardDetails'
CREATE TABLE [dbo].[CallCardDetails] (
    [CallCardDetailId] int IDENTITY(1,1) NOT NULL,
    [PaymentAppointmentDate] datetime  NOT NULL,
    [PaymentDate] datetime  NOT NULL,
    [CallCardId] int  NOT NULL,
    [BookId] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BookId] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([BookId] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [CallCardId] in table 'CallCards'
ALTER TABLE [dbo].[CallCards]
ADD CONSTRAINT [PK_CallCards]
    PRIMARY KEY CLUSTERED ([CallCardId] ASC);
GO

-- Creating primary key on [CallCardDetailId] in table 'CallCardDetails'
ALTER TABLE [dbo].[CallCardDetails]
ADD CONSTRAINT [PK_CallCardDetails]
    PRIMARY KEY CLUSTERED ([CallCardDetailId] ASC);
GO

-- Creating primary key on [Id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryId] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_CategoryBook]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoryBook'
CREATE INDEX [IX_FK_CategoryBook]
ON [dbo].[Books]
    ([CategoryId]);
GO

-- Creating foreign key on [BookId] in table 'CallCardDetails'
ALTER TABLE [dbo].[CallCardDetails]
ADD CONSTRAINT [FK_BookCallCardDetail]
    FOREIGN KEY ([BookId])
    REFERENCES [dbo].[Books]
        ([BookId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookCallCardDetail'
CREATE INDEX [IX_FK_BookCallCardDetail]
ON [dbo].[CallCardDetails]
    ([BookId]);
GO

-- Creating foreign key on [CallCardId] in table 'CallCardDetails'
ALTER TABLE [dbo].[CallCardDetails]
ADD CONSTRAINT [FK_CallCardCallCardDetail]
    FOREIGN KEY ([CallCardId])
    REFERENCES [dbo].[CallCards]
        ([CallCardId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CallCardCallCardDetail'
CREATE INDEX [IX_FK_CallCardCallCardDetail]
ON [dbo].[CallCardDetails]
    ([CallCardId]);
GO

-- Creating foreign key on [UserId] in table 'CallCards'
ALTER TABLE [dbo].[CallCards]
ADD CONSTRAINT [FK_UserCallCard]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCallCard'
CREATE INDEX [IX_FK_UserCallCard]
ON [dbo].[CallCards]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_UserUserRole]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserRole'
CREATE INDEX [IX_FK_UserUserRole]
ON [dbo].[UserRoles]
    ([UserId]);
GO

-- Creating foreign key on [RoleId] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [FK_RoleUserRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleUserRole'
CREATE INDEX [IX_FK_RoleUserRole]
ON [dbo].[UserRoles]
    ([RoleId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------