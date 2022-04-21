CREATE TABLE [dbo].[PortCheckDC] (
    [dcID]     INT           IDENTITY (1, 1) NOT NULL,
    [dcName]   VARCHAR (50)  NOT NULL,
    [dcLocale] VARCHAR (250) NULL,
    CONSTRAINT [PK_PortCheckDC] PRIMARY KEY CLUSTERED ([dcID] ASC)
);

