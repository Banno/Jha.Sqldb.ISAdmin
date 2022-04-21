CREATE TABLE [dbo].[ServerInventory_InstalledApps] (
    [iaID]             INT            IDENTITY (1, 1) NOT NULL,
    [iaSrvID]          INT            NOT NULL,
    [iaAppName]        NVARCHAR (500) NOT NULL,
    [iaAppVersion]     NVARCHAR (50)  NOT NULL,
    [iaAppPublisher]   NVARCHAR (50)  NOT NULL,
    [iaAppInstallDate] NVARCHAR (50)  NOT NULL,
    [iaFirstSeen]      DATETIME2 (0)  NOT NULL,
    [iaTimeStamp]      DATETIME2 (0)  NOT NULL
);

