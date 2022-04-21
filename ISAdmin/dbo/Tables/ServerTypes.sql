CREATE TABLE [dbo].[ServerTypes] (
    [tID]          INT           IDENTITY (1, 1) NOT NULL,
    [tType]        NVARCHAR (50) NOT NULL,
    [tText]        NVARCHAR (50) NOT NULL,
    [tSearchOrder] INT           NULL,
    [tTier]        INT           NULL,
    CONSTRAINT [PK_ServerTypes] PRIMARY KEY CLUSTERED ([tID] ASC)
);

