CREATE TABLE [dbo].[PortNotificationAddresses] (
    [notID]      INT         IDENTITY (1, 1) NOT NULL,
    [notDC]      NCHAR (25)  NOT NULL,
    [notAddress] NCHAR (100) NOT NULL,
    CONSTRAINT [PK_PortNotificationAddresses] PRIMARY KEY CLUSTERED ([notID] ASC)
);

