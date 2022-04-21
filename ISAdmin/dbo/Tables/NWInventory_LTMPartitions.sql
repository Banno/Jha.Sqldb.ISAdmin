CREATE TABLE [dbo].[NWInventory_LTMPartitions] (
    [paID]        INT           IDENTITY (1, 1) NOT NULL,
    [paEnv]       NVARCHAR (25) NOT NULL,
    [paName]      NVARCHAR (50) NOT NULL,
    [paCurrent]   NVARCHAR (5)  NOT NULL,
    [paTimeStamp] DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_NWInventory_LTMPartitions] PRIMARY KEY CLUSTERED ([paID] ASC)
);

