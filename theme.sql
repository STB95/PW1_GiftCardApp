CREATE TABLE [dbo].[theme]
(
	[Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (100) NOT NULL,
    /*[Icon]      NVARCHAR (100) NULL,*/
    [ColorCode] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK__theme__3213E83F9C58F555] PRIMARY KEY CLUSTERED ([Id] ASC)
    /*[style] NVARCHAR(100) NULL, */
)
