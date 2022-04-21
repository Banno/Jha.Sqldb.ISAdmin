CREATE TABLE [dbo].[NWInventory_LTMPools] (
    [poID]          INT            IDENTITY (1, 1) NOT NULL,
    [poEnv]         NVARCHAR (25)  NOT NULL,
    [poName]        NVARCHAR (50)  NOT NULL,
    [poPartition]   INT            NOT NULL,
    [poDescription] NVARCHAR (MAX) NOT NULL,
    [poMode]        NVARCHAR (50)  NOT NULL,
    [poCurrent]     NVARCHAR (5)   NOT NULL,
    [poTimeStamp]   DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_NWInventory_LTMPools] PRIMARY KEY CLUSTERED ([poID] ASC)
);

