CREATE TABLE [dbo].[ServerInventory_Services] (
    [index]         SMALLINT      IDENTITY (1, 1) NOT NULL,
    [srvID]         SMALLINT      NOT NULL,
    [sccmsvc]       NCHAR (255)   NULL,
    [wwwsvc]        NCHAR (255)   NULL,
    [scomsvc]       NCHAR (255)   NULL,
    [appdsvc]       NCHAR (25)    NULL,
    [scomapmsvc]    NCHAR (100)   NULL,
    [filebeatsvc]   NVARCHAR (25) NULL,
    [winlogbeatsvc] NVARCHAR (25) NULL,
    [snmpsvc]       NVARCHAR (25) NULL,
    CONSTRAINT [PK_ServerInventory_Services] PRIMARY KEY CLUSTERED ([index] ASC)
);

