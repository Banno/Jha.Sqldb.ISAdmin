CREATE TABLE [dbo].[IS_ESFTP_Accounts] (
    [esftpID]            INT            IDENTITY (1, 1) NOT NULL,
    [esftpJHAID]         INT            NOT NULL,
    [esftpPseudoName]    NVARCHAR (50)  NOT NULL,
    [esftpFtpUIUsername] NVARCHAR (50)  NOT NULL,
    [esftpFtpUIPassword] NVARCHAR (MAX) NOT NULL,
    [esftpActive]        BIT            NOT NULL,
    [esftpChangePass]    BIT            NOT NULL,
    [esftpAdded]         DATETIME2 (0)  NOT NULL,
    [esftpPassChangeReq] DATETIME2 (0)  NOT NULL,
    [esftpPassChanged]   DATETIME2 (0)  NOT NULL
);

