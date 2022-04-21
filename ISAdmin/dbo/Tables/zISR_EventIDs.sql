CREATE TABLE [dbo].[zISR_EventIDs] (
    [evtID]          INT            IDENTITY (1, 1) NOT NULL,
    [evtNumber]      INT            NOT NULL,
    [evtOwner]       NVARCHAR (25)  NULL,
    [evtDescription] NVARCHAR (255) NULL,
    CONSTRAINT [PK_ISR_Events] PRIMARY KEY CLUSTERED ([evtID] ASC)
);

