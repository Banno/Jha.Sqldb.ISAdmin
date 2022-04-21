CREATE TABLE [dbo].[IS_ESFTP_Log] (
    [ftpLogID]              INT            IDENTITY (1, 1) NOT NULL,
    [ftpLogSessionID]       NVARCHAR (15)  NOT NULL,
    [ftpLogServer]          NVARCHAR (25)  NOT NULL,
    [ftpLogServerIsPrimary] BIT            NOT NULL,
    [ftpLogMsgDepth]        INT            NOT NULL,
    [ftpLogType]            NVARCHAR (15)  NOT NULL,
    [ftpLogMessage]         NVARCHAR (MAX) NOT NULL,
    [ftpLogTimeStamp]       DATETIME2 (0)  NOT NULL
);

