CREATE TABLE [dbo].[ServiceAccounts_New] (
    [acctID]      INT            IDENTITY (1, 1) NOT NULL,
    [acctDomain]  INT            NOT NULL,
    [acctName]    NVARCHAR (50)  NOT NULL,
    [acctPswd]    NVARCHAR (50)  NOT NULL,
    [acctService] NVARCHAR (200) NOT NULL,
    [acctGroups]  NVARCHAR (200) NOT NULL,
    CONSTRAINT [PK_ServiceAccounts_New] PRIMARY KEY CLUSTERED ([acctID] ASC)
);

