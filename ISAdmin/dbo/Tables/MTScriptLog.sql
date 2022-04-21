CREATE TABLE [dbo].[MTScriptLog] (
    [eID]        INT            IDENTITY (1, 1) NOT NULL,
    [eTimeStamp] DATETIME2 (0)  NOT NULL,
    [eLog]       NVARCHAR (25)  NOT NULL,
    [eSource]    NVARCHAR (25)  NOT NULL,
    [eSessionID] INT            NOT NULL,
    [eType]      NVARCHAR (10)  NOT NULL,
    [eEventID]   INT            NOT NULL,
    [eMessage]   NVARCHAR (MAX) NOT NULL
);

