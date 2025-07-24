CREATE TABLE [dbo].[payment]
(
	[Id]              INT            IDENTITY (1, 1) NOT NULL,
    [GiftCardId]      INT            NOT NULL,
    [TransactionName] NVARCHAR (100) NOT NULL,
    /*[Paystatus]       BIT            DEFAULT ((0)) NOT NULL,*/
    [Amount]          DECIMAL (8, 2) NOT NULL,
    [ChargeId]        NVARCHAR(100)            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([GiftCardId]) REFERENCES [dbo].[giftcard] ([Id])
)
