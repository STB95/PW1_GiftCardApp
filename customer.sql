CREATE TABLE [dbo].[customer]
(
	[Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Firstname] NVARCHAR (100) NULL,
    [Lastname]  NVARCHAR (100) NULL,
    [Email]     NVARCHAR (200) NOT NULL,
    [Password]  NVARCHAR (200) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
