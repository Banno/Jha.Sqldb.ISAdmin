CREATE TABLE [dbo].[IS_PortalLinks] (
    [pID]        INT            IDENTITY (1, 1) NOT NULL,
    [pURL]       NVARCHAR (MAX) NOT NULL,
    [pDispDesc]  NVARCHAR (255) NOT NULL,
    [pIcon]      NVARCHAR (255) NOT NULL,
    [pCat]       INT            NOT NULL,
    [pSubCat]    INT            NOT NULL,
    [pStatus]    SMALLINT       NOT NULL,
    [pTimeStamp] DATETIME       NOT NULL
);

