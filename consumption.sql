CREATE TABLE [dbo].[consumption]
(
	[Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Date]       DATETIME       NOT NULL,
    [Location]   NVARCHAR (200) NOT NULL,
    [Amount]     DECIMAL (8, 2) NOT NULL,
    [GiftcardId] INT            NOT NULL,
    [Reason]     NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([GiftcardId]) REFERENCES [dbo].[giftcard] ([Id])
)
