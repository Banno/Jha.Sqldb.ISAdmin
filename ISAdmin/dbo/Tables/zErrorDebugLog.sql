CREATE TABLE [dbo].[zErrorDebugLog] (
    [dID]        INT            IDENTITY (1, 1) NOT NULL,
    [dTimeStamp] DATETIME       NULL,
    [dServer]    NVARCHAR (15)  NULL,
    [dPage]      NVARCHAR (50)  NULL,
    [dMessage]   NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_ErrorDebugLog] PRIMARY KEY CLUSTERED ([dID] ASC)
);

