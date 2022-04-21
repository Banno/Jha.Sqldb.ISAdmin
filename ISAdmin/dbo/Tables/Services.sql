CREATE TABLE [dbo].[Services] (
    [svcIndex]    INT           IDENTITY (1, 1) NOT NULL,
    [svcID]       INT           NOT NULL,
    [srvType]     INT           NOT NULL,
    [svcStateISG] NVARCHAR (20) NULL,
    [svcStateB]   NVARCHAR (20) NULL,
    [svcStateC]   NVARCHAR (20) NULL,
    [svcStateD]   NVARCHAR (20) NULL,
    [svcStateE]   NVARCHAR (20) NULL,
    [svcStateF]   NVARCHAR (20) NULL,
    [svcStateG]   NVARCHAR (20) NULL,
    CONSTRAINT [PK_ServicesTmp] PRIMARY KEY CLUSTERED ([svcIndex] ASC)
);

