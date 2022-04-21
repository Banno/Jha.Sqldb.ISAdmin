CREATE TABLE [dbo].[zISR_Events] (
    [eventID]     INT            IDENTITY (1, 1) NOT NULL,
    [evtNumber]   INT            NOT NULL,
    [evtGUID]     NVARCHAR (24)  NULL,
    [evtServer]   NVARCHAR (15)  NULL,
    [evtDateTime] DATETIME       NOT NULL,
    [evtDesc]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_ISR_Events1] PRIMARY KEY CLUSTERED ([eventID] ASC)
);

