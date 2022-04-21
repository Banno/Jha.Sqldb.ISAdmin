CREATE TABLE [dbo].[IS_DREConfig] (
    [dID]           INT            IDENTITY (1, 1) NOT NULL,
    [dShortName]    NVARCHAR (10)  NOT NULL,
    [dFullName]     NVARCHAR (25)  NOT NULL,
    [dAdminBox]     NVARCHAR (50)  NOT NULL,
    [dPhysPath]     NVARCHAR (255) NOT NULL,
    [dScript]       NVARCHAR (100) NOT NULL,
    [dLastModified] DATETIME2 (0)  NOT NULL
);

