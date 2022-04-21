CREATE TABLE [dbo].[ServerInventory_Network] (
    [index]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [srvID]       SMALLINT      NOT NULL,
    [ipaddr]      NVARCHAR (50) NULL,
    [gateway]     NVARCHAR (50) NULL,
    [macaddr]     NVARCHAR (50) NULL,
    [dns1]        NVARCHAR (50) NULL,
    [dns2]        NVARCHAR (50) NULL,
    [extraipaddr] NVARCHAR (50) NULL,
    CONSTRAINT [PK_ServerInventory_Network] PRIMARY KEY CLUSTERED ([index] ASC)
);

