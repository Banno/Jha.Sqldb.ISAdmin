CREATE TABLE [dbo].[NWInventory_LTMVirtualServers] (
    [vsID]          INT            IDENTITY (1, 1) NOT NULL,
    [vsEnv]         NVARCHAR (25)  NOT NULL,
    [vsName]        NVARCHAR (50)  NOT NULL,
    [vsPartition]   INT            NOT NULL,
    [vsDescription] NVARCHAR (MAX) NOT NULL,
    [vsPool]        INT            NOT NULL,
    [vsIP]          NVARCHAR (15)  NOT NULL,
    [vsPort]        NVARCHAR (10)  NOT NULL,
    [vsCurrent]     NVARCHAR (5)   NOT NULL,
    [vsTimeStamp]   DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_NWInventory_LTMVirtualServers] PRIMARY KEY CLUSTERED ([vsID] ASC)
);

