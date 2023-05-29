IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE TABLE [Blogs] (
        [Id] int NOT NULL IDENTITY,
        [CreateDate] datetime2 NOT NULL,
        [Title] nvarchar(max) NOT NULL,
        [Content] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Blogs] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE TABLE [Events] (
        [Id] int NOT NULL IDENTITY,
        [CreateDate] datetime2 NULL,
        [StartDate] datetime2 NULL,
        [EndDate] datetime2 NULL,
        [ImageUrl] nvarchar(max) NULL,
        [Title] nvarchar(max) NULL,
        [Unit] nvarchar(max) NULL,
        [Time] nvarchar(max) NULL,
        [Location] nvarchar(max) NULL,
        [Header] nvarchar(max) NULL,
        [Content] nvarchar(max) NULL,
        CONSTRAINT [PK_Events] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE TABLE [Feedbacks] (
        [Id] int NOT NULL IDENTITY,
        [Ratings] int NOT NULL,
        [CreateDate] nvarchar(max) NOT NULL,
        [Content] nvarchar(max) NULL,
        CONSTRAINT [PK_Feedbacks] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE TABLE [Locations] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [XCoordinate] int NOT NULL,
        [YCoordinate] int NOT NULL,
        [XRenderValue] int NULL,
        [YRenderValue] int NULL,
        [Floor] int NULL,
        CONSTRAINT [PK_Locations] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE TABLE [LocationRoutes] (
        [Id] int NOT NULL IDENTITY,
        [FirstLocationId] int NOT NULL,
        [SecondLocationId] int NOT NULL,
        [CustomDistance] int NULL,
        CONSTRAINT [PK_LocationRoutes] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_LocationRoutes_Locations_FirstLocationId] FOREIGN KEY ([FirstLocationId]) REFERENCES [Locations] ([Id]),
        CONSTRAINT [FK_LocationRoutes_Locations_SecondLocationId] FOREIGN KEY ([SecondLocationId]) REFERENCES [Locations] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE TABLE [Room] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [SecondName] nvarchar(max) NULL,
        [Type] nvarchar(max) NULL,
        [ActiveTime] nvarchar(max) NULL,
        [LocationId] int NOT NULL,
        CONSTRAINT [PK_Room] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Room_Locations_LocationId] FOREIGN KEY ([LocationId]) REFERENCES [Locations] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE INDEX [IX_LocationRoutes_FirstLocationId] ON [LocationRoutes] ([FirstLocationId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE INDEX [IX_LocationRoutes_SecondLocationId] ON [LocationRoutes] ([SecondLocationId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    CREATE INDEX [IX_Room_LocationId] ON [Room] ([LocationId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230409134041_init-database')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230409134041_init-database', N'7.0.4');
END;
GO

COMMIT;
GO

