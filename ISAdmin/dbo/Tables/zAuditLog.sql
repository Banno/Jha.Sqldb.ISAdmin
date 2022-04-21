CREATE TABLE [dbo].[zAuditLog] (
    [aID]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [aUser]      NVARCHAR (30)  NOT NULL,
    [aTimeStamp] DATETIME       NOT NULL,
    [aEventID]   INT            NOT NULL,
    [aEvent]     VARCHAR (MAX)  NOT NULL,
    [aPage]      NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_AuditLog] PRIMARY KEY CLUSTERED ([aID] ASC)
);

