CREATE TABLE [dbo].[IS_ClientCertRepo] (
    [cID]             INT            IDENTITY (1, 1) NOT NULL,
    [cSrvName]        NVARCHAR (50)  NOT NULL,
    [cCertStore]      NVARCHAR (50)  NOT NULL,
    [cCertThumbprint] NVARCHAR (50)  NOT NULL,
    [cCertSubject]    NVARCHAR (MAX) NOT NULL,
    [cCertExp]        DATE           NOT NULL,
    [cCertIssuer]     NVARCHAR (MAX) NOT NULL,
    [cCertSN]         NVARCHAR (50)  NOT NULL,
    [cCertPrivKeyYN]  BIT            NOT NULL,
    [cChainStatus]    NVARCHAR (256) NULL,
    [cCurrent]        BIT            NULL,
    [cTimeStamp]      DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_IS_ClientCertRepo] PRIMARY KEY CLUSTERED ([cID] ASC)
);

