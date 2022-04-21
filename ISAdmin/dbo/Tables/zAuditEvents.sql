CREATE TABLE [dbo].[zAuditEvents] (
    [aeID]          INT            IDENTITY (1, 1) NOT NULL,
    [aeApplication] NCHAR (100)    NULL,
    [aeEventID]     INT            NOT NULL,
    [aeEventDesc]   NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_AuditEvents] PRIMARY KEY CLUSTERED ([aeID] ASC)
);

