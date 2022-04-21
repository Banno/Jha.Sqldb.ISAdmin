-- =============================================
-- Author:		Brian Whitacre
-- Create date: 8/31/2017
-- Description:	<Description,,>
-- Updated 10/24/17 - NC: Add ChainStatus input and CertCurrent monitor
-- =============================================
CREATE PROCEDURE [dbo].[IS_PutClientCertData]
	-- Add the parameters for the stored procedure here
    @cSrvName nvarchar(50),
	@cCertStore nvarchar(50),
	@cCertThumbprint nvarchar(50),
	@cCertSubject nvarchar(MAX),
	@cCertExp datetime2(7),
	@cCertIssuer nvarchar(MAX),
	@cCertSN nvarchar(50),
	@cCertPrivKeyYN bit,
	@cChainStatus nvarchar(256),
	@cTimeStamp datetime2(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE dbo.IS_ClientCertRepo SET
	  cCertStore=coalesce(@cCertStore, cCertStore),
	  cCertThumbprint=coalesce(@cCertThumbprint, cCertThumbprint),
	  cCertSubject=coalesce(@cCertSubject, cCertSubject),
	  cCertExp=coalesce(@cCertExp, cCertExp),
	  cCertIssuer=coalesce(@cCertIssuer, cCertIssuer),
	  cCertSN=coalesce(@cCertSN, cCertSN),
	  cCertPrivKeyYN=coalesce(@cCertPrivKeyYN, cCertPrivKeyYN),
	  cCurrent=1,
	  cTimeStamp=coalesce(@cTimeStamp, cTimeStamp),
	  cChainStatus=coalesce(@cChainStatus, cChainStatus)
	WHERE cSrvName=@cSrvName
	  and cCertThumbprint=@cCertThumbprint
	  and cCertStore=@cCertStore
    IF @@ROWCOUNT=0
	  BEGIN
	  INSERT INTO dbo.IS_ClientCertRepo (cSrvName, cCertStore, cCertThumbprint, cCertSubject, cCertExp, cCertIssuer, cCertSN, cCertPrivKeyYN, cCurrent, cChainStatus, cTimeStamp) VALUES (@cSrvName, @cCertStore, @cCertThumbprint, @cCertSubject, @cCertExp, @cCertIssuer, @cCertSN, @cCertPrivKeyYN, 1, @cChainStatus, @cTimeStamp)
    END
  END