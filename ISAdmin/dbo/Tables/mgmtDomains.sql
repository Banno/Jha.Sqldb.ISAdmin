CREATE TABLE [dbo].[mgmtDomains] (
    [dID]       INT          IDENTITY (1, 1) NOT NULL,
    [dName]     VARCHAR (25) NOT NULL,
    [dAlias]    VARCHAR (25) NOT NULL,
    [dType]     INT          NULL,
    [dPDC]      VARCHAR (25) NULL,
    [dGateway]  VARCHAR (15) NULL,
    [dVLAN]     VARCHAR (50) NULL,
    [dIPRange]  VARCHAR (15) NULL,
    [dNTDB]     VARCHAR (25) NULL,
    [dEchoDB]   VARCHAR (25) NULL,
    [dReportDB] VARCHAR (25) NULL,
    [dOFMDB]    VARCHAR (25) NULL,
    [dOLMDB]    VARCHAR (25) NULL,
    CONSTRAINT [PK_mgmtDomains] PRIMARY KEY CLUSTERED ([dID] ASC)
);

