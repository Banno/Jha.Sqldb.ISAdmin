CREATE TABLE [dbo].[IS_WebAppRepoArchive] (
    [iID]          INT            IDENTITY (1, 1) NOT NULL,
    [iTimeStamp]   DATETIME2 (0)  NOT NULL,
    [iSrvName]     NVARCHAR (50)  NOT NULL,
    [iSrvType]     NVARCHAR (50)  NOT NULL,
    [iRootSite]    NVARCHAR (50)  NOT NULL,
    [iAppName]     NVARCHAR (50)  NOT NULL,
    [iAppPhysPath] NVARCHAR (MAX) NOT NULL,
    [iAppPool]     NVARCHAR (50)  NOT NULL,
    [iAppPoolUser] NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_IS_WebAppRepoArchive] PRIMARY KEY CLUSTERED ([iID] ASC)
);

