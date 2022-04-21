CREATE TABLE [dbo].[IS_F5_LTMs] (
    [f5ID]         INT           IDENTITY (1, 1) NOT NULL,
    [f5FQDN]       NVARCHAR (50) NOT NULL,
    [f5MgmtIP]     NVARCHAR (16) NOT NULL,
    [f5Silo]       NVARCHAR (50) NOT NULL,
    [f5Status]     NVARCHAR (50) NOT NULL,
    [f5DateTime]   DATETIME      NOT NULL,
    [f5DataCenter] NVARCHAR (50) NULL
);

