CREATE TABLE [dbo].[ImageProviderDetail] (
    [DetailIndex]    INT        IDENTITY (1, 1) NOT NULL,
    [ProviderIndex]  INT        NOT NULL,
    [ProviderDetail] NCHAR (50) NOT NULL,
    CONSTRAINT [PK_ImageProviderDetail] PRIMARY KEY CLUSTERED ([DetailIndex] ASC),
    CONSTRAINT [UC_ProvDetail] UNIQUE NONCLUSTERED ([ProviderIndex] ASC, [ProviderDetail] ASC)
);

