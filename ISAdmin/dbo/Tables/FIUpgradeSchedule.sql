CREATE TABLE [dbo].[FIUpgradeSchedule] (
    [fiID]           INT          IDENTITY (1, 1) NOT NULL,
    [fiCaseNum]      NCHAR (25)   NOT NULL,
    [fiNumber]       NCHAR (50)   NULL,
    [fiVersion]      NCHAR (20)   NULL,
    [fiNotification] NCHAR (2048) NOT NULL,
    [fiDataFile]     NCHAR (1024) NULL,
    [fiSchedule]     DATETIME     NOT NULL,
    [fiComplete]     BIT          NOT NULL,
    CONSTRAINT [PK_FIUpgradeSchedule] PRIMARY KEY CLUSTERED ([fiID] ASC)
);

