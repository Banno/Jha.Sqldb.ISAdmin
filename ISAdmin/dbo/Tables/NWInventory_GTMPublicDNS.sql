CREATE TABLE [dbo].[NWInventory_GTMPublicDNS] (
    [gtmID]        INT           IDENTITY (1, 1) NOT NULL,
    [gtmZone]      NVARCHAR (50) NOT NULL,
    [gtmFQDN]      NVARCHAR (50) NOT NULL,
    [gtmIP]        NVARCHAR (15) NOT NULL,
    [gtmTTL]       INT           NOT NULL,
    [gtmCurrent]   NVARCHAR (5)  NOT NULL,
    [gtmTimeStamp] DATETIME2 (0) NOT NULL
);

