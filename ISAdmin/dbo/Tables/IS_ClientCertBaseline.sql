CREATE TABLE [dbo].[IS_ClientCertBaseline] (
    [cblID]              INT             IDENTITY (1, 1) NOT NULL,
    [cblCertFilename]    NVARCHAR (256)  NOT NULL,
    [cblCertFile]        VARBINARY (MAX) NULL,
    [cblSrvType]         NVARCHAR (10)   NOT NULL,
    [cblCertStore]       VARCHAR (10)    NOT NULL,
    [cblCertThumbprint]  NVARCHAR (50)   NOT NULL,
    [cblCertSubject]     NVARCHAR (MAX)  NOT NULL,
    [cblCertExp]         DATETIME2 (0)   NOT NULL,
    [cblCertIssuer]      NVARCHAR (MAX)  NOT NULL,
    [cblCertSN]          NVARCHAR (50)   NOT NULL,
    [cblCertPrivKeyYN]   BIT             NOT NULL,
    [cblCertPswd]        NVARCHAR (50)   NOT NULL,
    [cblCertCase]        NVARCHAR (25)   NOT NULL,
    [cblCertDescription] NVARCHAR (512)  NOT NULL,
    [cblCertActive]      BIT             NOT NULL,
    [cblCertWWWBinding]  BIT             NULL
);

