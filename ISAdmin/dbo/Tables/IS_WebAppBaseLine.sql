CREATE TABLE [dbo].[IS_WebAppBaseLine] (
    [ibID]          INT            IDENTITY (1, 1) NOT NULL,
    [ibTimeStamp]   DATETIME2 (7)  NOT NULL,
    [ibSrvType]     NVARCHAR (50)  NOT NULL,
    [ibAppName]     NVARCHAR (50)  NOT NULL,
    [ibAppPhysPath] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_IS_WebAppBaseLine] PRIMARY KEY CLUSTERED ([ibID] ASC)
);

