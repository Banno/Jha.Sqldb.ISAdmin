CREATE TABLE [dbo].[LockOutLog] (
    [llID]          INT        IDENTITY (1, 1) NOT NULL,
    [llDomain]      NCHAR (10) NOT NULL,
    [llAcctID]      NCHAR (25) NOT NULL,
    [llDateTime]    DATETIME   NOT NULL,
    [llMachineName] NCHAR (40) NULL,
    CONSTRAINT [PK_LockOutLog] PRIMARY KEY CLUSTERED ([llID] ASC)
);

