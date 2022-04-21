CREATE TABLE [dbo].[mgmtResources] (
    [resID]     INT           IDENTITY (1, 1) NOT NULL,
    [resDomain] INT           NOT NULL,
    [resName]   VARCHAR (25)  NOT NULL,
    [resValue]  VARCHAR (255) NOT NULL,
    [resNotes]  VARCHAR (255) NULL,
    CONSTRAINT [PK_mgmtResources] PRIMARY KEY CLUSTERED ([resID] ASC)
);

