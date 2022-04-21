CREATE TABLE [dbo].[NWInventory_LTMNodes] (
    [noID]           INT            IDENTITY (1, 1) NOT NULL,
    [noEnv]          NVARCHAR (25)  NOT NULL,
    [noName]         NVARCHAR (50)  NOT NULL,
    [noPartition]    INT            NOT NULL,
    [noDescription]  NVARCHAR (MAX) NOT NULL,
    [noIP]           NVARCHAR (15)  NOT NULL,
    [noSessionState] NVARCHAR (25)  NOT NULL,
    [noState]        NVARCHAR (25)  NOT NULL,
    [noIcon]         NVARCHAR (25)  NOT NULL,
    [noCurrent]      NVARCHAR (5)   NOT NULL,
    [noTimeStamp]    DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_NWInventory_LTMNodes] PRIMARY KEY CLUSTERED ([noID] ASC)
);

