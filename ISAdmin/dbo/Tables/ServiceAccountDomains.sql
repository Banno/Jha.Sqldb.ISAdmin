CREATE TABLE [dbo].[ServiceAccountDomains] (
    [sdID]     INT           IDENTITY (29, 1) NOT NULL,
    [sdDomain] NVARCHAR (25) NOT NULL,
    [sdAlias]  NVARCHAR (25) NOT NULL,
    CONSTRAINT [PK_ServiceAccountDomains] PRIMARY KEY CLUSTERED ([sdID] ASC)
);

