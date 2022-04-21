CREATE TABLE [dbo].[ServerInventory_Infrastructure] (
    [vID]    INT            IDENTITY (1, 1) NOT NULL,
    [srvID]  INT            NULL,
    [vSite]  NVARCHAR (15)  NULL,
    [vDNS]   NVARCHAR (50)  NULL,
    [vIP]    NVARCHAR (15)  NOT NULL,
    [vNotes] NVARCHAR (250) NULL,
    CONSTRAINT [PK_ServerInventory_LoadBalancer] PRIMARY KEY CLUSTERED ([vID] ASC)
);

