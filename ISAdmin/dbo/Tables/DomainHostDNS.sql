CREATE TABLE [dbo].[DomainHostDNS] (
    [dID]   INT           IDENTITY (1, 1) NOT NULL,
    [dDom]  NVARCHAR (15) NOT NULL,
    [dName] NVARCHAR (25) NOT NULL,
    [dIP]   NVARCHAR (15) NOT NULL,
    CONSTRAINT [PK_DomainHostDNS] PRIMARY KEY CLUSTERED ([dID] ASC)
);

