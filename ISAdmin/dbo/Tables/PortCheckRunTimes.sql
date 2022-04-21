CREATE TABLE [dbo].[PortCheckRunTimes] (
    [runId]    INT      IDENTITY (1, 1) NOT NULL,
    [runStart] DATETIME NOT NULL,
    [runEnd]   DATETIME NOT NULL,
    CONSTRAINT [PK_PortCheckRunTimes] PRIMARY KEY CLUSTERED ([runId] ASC)
);

