CREATE TABLE [dbo].[ServerInventory_Software] (
    [index]     SMALLINT      IDENTITY (1, 1) NOT NULL,
    [srvID]     SMALLINT      NOT NULL,
    [ieversion] NCHAR (50)    NULL,
    [dotnet]    NCHAR (50)    NULL,
    [pshell]    NCHAR (50)    NULL,
    [vmtools]   NVARCHAR (50) NULL,
    [chefver]   NVARCHAR (15) NULL,
    [octover]   NVARCHAR (15) NULL,
    CONSTRAINT [PK_ServerInventory_Software] PRIMARY KEY CLUSTERED ([index] ASC)
);

