CREATE TABLE [dbo].[address]
(
	[Id]         INT            NOT NULL IDENTITY,
    [CustomerId] INT            NOT NULL,
    [Street]     NVARCHAR (100) NOT NULL,
    [Number]     NVARCHAR (50)  NOT NULL,
    [ZipCode]    INT            NOT NULL,
    [City]       NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[customer] ([Id])
)
