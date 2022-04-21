CREATE TABLE [dbo].[IS_LTM_VirtualServersArchive] (
    [ltmID]            INT           IDENTITY (1, 1) NOT NULL,
    [ltmVirtualServer] NVARCHAR (50) NULL,
    [ltmPool]          NVARCHAR (50) NULL,
    [ltmAppStack]      NVARCHAR (1)  NULL,
    [ltmTimeStamp]     DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_IS_LTM_VirtualServersArchive] PRIMARY KEY CLUSTERED ([ltmID] ASC)
);

