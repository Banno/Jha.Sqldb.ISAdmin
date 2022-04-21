CREATE TABLE [dbo].[mgmtVLANMap] (
    [vID]              INT            IDENTITY (1, 1) NOT NULL,
    [vLegacyPortGroup] NVARCHAR (100) NOT NULL,
    [vLegacyVLAN]      SMALLINT       NOT NULL,
    [vACIPortGroup]    NVARCHAR (100) NOT NULL,
    [vACIVLAN]         SMALLINT       NOT NULL,
    [vIPScope]         NVARCHAR (20)  NOT NULL
);

