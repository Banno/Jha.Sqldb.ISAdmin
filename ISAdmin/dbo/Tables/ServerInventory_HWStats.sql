CREATE TABLE [dbo].[ServerInventory_HWStats] (
    [index]     SMALLINT       IDENTITY (1, 1) NOT NULL,
    [srvID]     SMALLINT       NOT NULL,
    [drvcused]  DECIMAL (6, 1) NULL,
    [drvctotal] DECIMAL (6, 1) NULL,
    [drvdused]  DECIMAL (6, 1) NULL,
    [drvdtotal] DECIMAL (6, 1) NULL,
    CONSTRAINT [PK_ServerInventory_HWStats] PRIMARY KEY CLUSTERED ([index] ASC)
);

