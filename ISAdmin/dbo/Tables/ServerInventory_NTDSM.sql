CREATE TABLE [dbo].[ServerInventory_NTDSM] (
    [index]  INT            IDENTITY (1, 1) NOT NULL,
    [srvID]  SMALLINT       NOT NULL,
    [dType]  NVARCHAR (15)  NOT NULL,
    [dID]    INT            NOT NULL,
    [dValue] NVARCHAR (100) NOT NULL,
    [dTime]  NVARCHAR (50)  NOT NULL,
    [dNotes] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_ServerInventory_NTDSM] PRIMARY KEY CLUSTERED ([index] ASC)
);

