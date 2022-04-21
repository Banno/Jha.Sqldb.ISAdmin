CREATE TABLE [dbo].[ServerInventory_Hardware] (
    [index]        SMALLINT    IDENTITY (1, 1) NOT NULL,
    [srvID]        SMALLINT    NOT NULL,
    [ram]          NCHAR (50)  NULL,
    [serialnumber] NCHAR (50)  NULL,
    [cputype]      NCHAR (255) NULL,
    [cpuspeed]     NCHAR (50)  NULL,
    [drvlocal]     NCHAR (50)  NULL,
    [cpucount]     NCHAR (25)  NULL,
    CONSTRAINT [PK_ServerInventory_Hardware] PRIMARY KEY CLUSTERED ([index] ASC)
);

