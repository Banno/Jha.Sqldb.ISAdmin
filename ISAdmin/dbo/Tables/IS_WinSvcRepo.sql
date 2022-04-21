CREATE TABLE [dbo].[IS_WinSvcRepo] (
    [iID]           INT            IDENTITY (1, 1) NOT NULL,
    [iTimeStamp]    DATETIME2 (0)  NOT NULL,
    [iSrvName]      NVARCHAR (25)  NOT NULL,
    [iSrvType]      NVARCHAR (10)  NOT NULL,
    [iSvcName]      NVARCHAR (50)  NOT NULL,
    [iSvcDispName]  NVARCHAR (50)  NOT NULL,
    [iSvcPath]      NVARCHAR (MAX) NOT NULL,
    [iSvcUserName]  NVARCHAR (50)  NOT NULL,
    [iSvcStartType] NVARCHAR (10)  NOT NULL,
    CONSTRAINT [PK_IS_WinSvcRepo] PRIMARY KEY CLUSTERED ([iID] ASC)
);

