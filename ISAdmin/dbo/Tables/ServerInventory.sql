CREATE TABLE [dbo].[ServerInventory] (
    [srvID]       SMALLINT       IDENTITY (1, 1) NOT NULL,
    [site]        NVARCHAR (50)  NULL,
    [type]        NVARCHAR (50)  NOT NULL,
    [srvname]     NVARCHAR (50)  NOT NULL,
    [adpath]      NVARCHAR (255) NOT NULL,
    [online]      NVARCHAR (50)  NULL,
    [lastseen]    NVARCHAR (50)  NULL,
    [dsmwarn]     NVARCHAR (10)  NULL,
    [username]    NVARCHAR (255) NULL,
    [maintwindow] NVARCHAR (255) NULL,
    [jsource]     NVARCHAR (25)  NULL,
    [buildstatus] NVARCHAR (50)  NULL,
    [srvinactive] SMALLINT       CONSTRAINT [DF_ServerInventory_blockdeploy] DEFAULT ((0)) NOT NULL,
    [notes]       NVARCHAR (MAX) NULL,
    [adnotes]     NVARCHAR (200) NULL,
    [error]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_ServerInventory] PRIMARY KEY CLUSTERED ([srvID] ASC)
);

