CREATE TABLE [dbo].[PortCheckPartitions] (
    [partID]      INT          IDENTITY (1, 1) NOT NULL,
    [partName]    VARCHAR (50) NOT NULL,
    [partDC]      INT          NOT NULL,
    [partJConnIP] VARCHAR (25) NOT NULL,
    [partStatus]  VARCHAR (12) NOT NULL,
    CONSTRAINT [PK_PortCheckPartitions] PRIMARY KEY CLUSTERED ([partID] ASC),
    CONSTRAINT [UC_partDC_partJConnIP] UNIQUE NONCLUSTERED ([partName] ASC, [partJConnIP] ASC)
);

