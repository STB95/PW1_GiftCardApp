CREATE TABLE [dbo].[giftcard]
(
	[Id]               INT            IDENTITY (1, 1) NOT NULL,
    [CustomerId]       INT            NOT NULL,
    [Checksum]         INT            NULL,
    [ThemeId]          INT            NOT NULL,
    [Amount]           DECIMAL (8, 2) NOT NULL,
    [RemainingBalance] DECIMAL (8, 2) NOT NULL,
    [PurchaseDate]     DATETIME       NOT NULL,
    [ExpiryDate]       DATETIME       NOT NULL,
    [Code]             INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[customer] ([Id]),
    CONSTRAINT [FK__giftcard__theme___3E52440B] FOREIGN KEY ([ThemeId]) REFERENCES [dbo].[theme] ([Id])
)
