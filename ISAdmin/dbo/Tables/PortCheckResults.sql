CREATE TABLE [dbo].[PortCheckResults] (
    [pcId]         INT           IDENTITY (1, 1) NOT NULL,
    [pcRunTime]    DATETIME      NOT NULL,
    [pcFINum]      VARCHAR (5)   NOT NULL,
    [pcFIName]     VARCHAR (50)  NOT NULL,
    [pcVersion]    VARCHAR (5)   NOT NULL,
    [pcHostName]   VARCHAR (50)  NOT NULL,
    [pcHostIp]     VARCHAR (12)  NOT NULL,
    [pcHostPort]   VARCHAR (4)   NOT NULL,
    [pcResults]    VARCHAR (MAX) NOT NULL,
    [pcHBServer]   VARCHAR (25)  NOT NULL,
    [pcDataCenter] INT           NOT NULL,
    CONSTRAINT [PK_PortCheckResults_1] PRIMARY KEY CLUSTERED ([pcId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [ncResultIndex2]
    ON [dbo].[PortCheckResults]([pcHostIp] ASC, [pcRunTime] ASC)
    INCLUDE([pcFINum]);


GO
CREATE NONCLUSTERED INDEX [ncResultIndex]
    ON [dbo].[PortCheckResults]([pcHostIp] ASC)
    INCLUDE([pcRunTime], [pcFINum]);

