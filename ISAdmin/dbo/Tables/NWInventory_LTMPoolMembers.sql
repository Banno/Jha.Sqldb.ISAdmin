CREATE TABLE [dbo].[NWInventory_LTMPoolMembers] (
    [pmID]           INT           IDENTITY (1, 1) NOT NULL,
    [pmEnv]          NVARCHAR (25) NOT NULL,
    [pmName]         INT           NOT NULL,
    [pmPartition]    INT           NOT NULL,
    [pmPool]         INT           NOT NULL,
    [pmIP]           NVARCHAR (15) NOT NULL,
    [pmPort]         NVARCHAR (10) NOT NULL,
    [pmSessionState] NVARCHAR (25) NOT NULL,
    [pmState]        NVARCHAR (25) NOT NULL,
    [pmIcon]         NVARCHAR (25) NOT NULL,
    [pmCurrent]      NVARCHAR (5)  NOT NULL,
    [pmTimeStamp]    DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_NWInventory_LTMPoolMembers] PRIMARY KEY CLUSTERED ([pmID] ASC)
);

