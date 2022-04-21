CREATE TABLE [dbo].[IS_AuthMapping] (
    [aID]     INT           IDENTITY (1, 1) NOT NULL,
    [aSite]   NVARCHAR (50) NOT NULL,
    [aPath]   NVARCHAR (50) NOT NULL,
    [aPage]   NVARCHAR (50) NOT NULL,
    [aAccess] NVARCHAR (10) NOT NULL,
    [aGroup]  NVARCHAR (25) NOT NULL
);

