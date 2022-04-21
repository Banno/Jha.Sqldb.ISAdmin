CREATE TABLE [dbo].[ServerInventory_OS] (
    [index]       SMALLINT      IDENTITY (1, 1) NOT NULL,
    [srvID]       SMALLINT      NOT NULL,
    [osversion]   NCHAR (255)   NULL,
    [servicepack] NCHAR (50)    NULL,
    [installdate] NCHAR (50)    NULL,
    [lastboot]    NCHAR (50)    NULL,
    [osarch]      NCHAR (10)    NULL,
    [oslicensed]  NCHAR (25)    NULL,
    [tasks]       NVARCHAR (10) NULL,
    CONSTRAINT [PK_ServerInventory_OS] PRIMARY KEY CLUSTERED ([index] ASC)
);

