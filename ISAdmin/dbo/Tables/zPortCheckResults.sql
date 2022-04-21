CREATE TABLE [dbo].[zPortCheckResults] (
    [pID]          INT           IDENTITY (1, 1) NOT NULL,
    [pRunInstance] VARCHAR (36)  NOT NULL,
    [pDateTime]    DATETIME      NOT NULL,
    [pFIName]      VARCHAR (50)  NULL,
    [pFINumber]    INT           NULL,
    [pFIVersion]   INT           NULL,
    [pHostName]    VARCHAR (50)  NOT NULL,
    [pHostIP]      VARCHAR (20)  NULL,
    [pHostPort]    INT           NULL,
    [pRespTime]    INT           NULL,
    [pResults]     VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_PortCheckResults] PRIMARY KEY CLUSTERED ([pID] ASC)
);

