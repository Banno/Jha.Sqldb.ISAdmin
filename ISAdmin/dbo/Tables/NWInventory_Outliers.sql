CREATE TABLE [dbo].[NWInventory_Outliers] (
    [ouID]          INT            IDENTITY (1, 1) NOT NULL,
    [ouEnv]         NVARCHAR (25)  NOT NULL,
    [ouName]        NVARCHAR (50)  NOT NULL,
    [ouPartition]   INT            NOT NULL,
    [ouDescription] NVARCHAR (MAX) NOT NULL,
    [ouIP]          NVARCHAR (15)  NOT NULL,
    [ouCurrent]     NVARCHAR (5)   NOT NULL,
    [ouTimeStamp]   DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_NWInventory_Outliers] PRIMARY KEY CLUSTERED ([ouID] ASC)
);

