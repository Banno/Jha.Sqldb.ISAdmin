CREATE TABLE [dbo].[ServerInventory_AppD] (
    [index]          SMALLINT      IDENTITY (1, 1) NOT NULL,
    [srvID]          SMALLINT      NOT NULL,
    [appdagentver]   NVARCHAR (25) NULL,
    [appdcontroller] NVARCHAR (25) NULL,
    [appdport]       NVARCHAR (5)  NULL,
    [appdssl]        NVARCHAR (5)  NULL,
    [appdtls12]      NVARCHAR (5)  NULL,
    [appduser]       NVARCHAR (25) NULL,
    [appdkey]        NVARCHAR (50) NULL,
    [appdapp]        NVARCHAR (50) NULL,
    [appdperfct]     NVARCHAR (3)  NULL,
    [appdiisappct]   NVARCHAR (2)  NULL,
    [appdwinappct]   NVARCHAR (2)  NULL,
    CONSTRAINT [PK_ServerInventory_AppD] PRIMARY KEY CLUSTERED ([index] ASC)
);

