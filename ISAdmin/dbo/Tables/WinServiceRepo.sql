CREATE TABLE [dbo].[WinServiceRepo] (
    [svcID]       INT           IDENTITY (1, 1) NOT NULL,
    [svcName]     VARCHAR (100) NOT NULL,
    [svcDispName] VARCHAR (100) NOT NULL,
    [svcGroup]    VARCHAR (50)  NULL,
    CONSTRAINT [PK_WinServiceRepo] PRIMARY KEY CLUSTERED ([svcID] ASC)
);

