CREATE TABLE [dbo].[ImageProviders] (
    [ProviderIndex] INT        IDENTITY (1, 1) NOT NULL,
    [ProviderName]  NCHAR (50) NOT NULL,
    CONSTRAINT [PK_ImageProviders] PRIMARY KEY CLUSTERED ([ProviderIndex] ASC),
    CONSTRAINT [UQ_ImageProviders] UNIQUE NONCLUSTERED ([ProviderName] ASC)
);

