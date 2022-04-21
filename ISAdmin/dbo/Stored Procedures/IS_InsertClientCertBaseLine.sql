-- =============================================
-- Author:		Brian Whitacre
-- Create date: 9/29/2017
-- Description:	<Description,,>
-- Updated 09/18/18 - NC: Add cblCertWWWBinding
-- Updated 09/18/18 - BW: Add update conditional for servertype
-- Updated 03/29/18 - NC: Add SrvType, CertCase, CertDesc input
-- Updated 11/15/17 - NC: Add CertStore and BLOB File
-- Updated 10/24/17 - NC: Add CertFileName input
-- =============================================
CREATE PROCEDURE [dbo].[IS_InsertClientCertBaseLine]
	@cblCertThumbprint nvarchar(50),
	@cblCertSubject nvarchar(MAX),
	@cblSrvType nvarchar(10),
	@cblCertStore nvarchar(10),
	@cblCertExp datetime2(7),
	@cblCertIssuer nvarchar(MAX),
	@cblCertSN nvarchar(50),
	@cblCertPrivKeyYN bit,
	@cblCertPswd nvarchar(50),
	@cblCertFilename nvarchar(256),
	@cblCertFile varbinary(MAX),
	@cblCertCase nvarchar(25),
	@cblCertDescription nvarchar(512),
	@cblCertWWWBinding bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
UPDATE dbo.IS_ClientCertBaseline SET
	  cblCertThumbprint=coalesce(@cblCertThumbprint, cblCertThumbprint),
	  cblCertSubject=coalesce(@cblCertSubject, cblCertSubject),
	  cblSrvType=coalesce(@cblSrvType, cblSrvType),
	  cblCertStore=coalesce(@cblCertStore, cblCertStore),
	  cblCertExp=coalesce(@cblCertExp, cblCertExp),
	  cblCertIssuer=coalesce(@cblCertIssuer, cblCertIssuer),
	  cblCertSN=coalesce(@cblCertSN, cblCertSN),
	  cblCertPrivKeyYN=coalesce(@cblCertPrivKeyYN, cblCertPrivKeyYN),
	  cblCertPswd=coalesce(@cblCertPswd, cblCertPswd),
	  cblCertFilename=coalesce(@cblCertFilename, cblCertFilename),
	  cblCertFile=coalesce(@cblCertFile, cblCertFile),
	  cblCertCase=coalesce(@cblCertCase, cblCertCase),
	  cblCertDescription=coalesce(@cblCertDescription, cblCertDescription),
	  cblCertActive=1,
	  cblCertWWWBinding=coalesce(@cblCertWWWBinding, cblCertWWWBinding)
  WHERE cblCertThumbprint=@cblCertThumbprint
    and cblSrvType=@cblSrvType
  IF @@ROWCOUNT=0
  BEGIN
  INSERT INTO dbo.IS_ClientCertBaseline (cblCertThumbprint,cblCertSubject,cblSrvType,cblCertStore,cblCertExp,cblCertIssuer,cblCertSN,cblCertPrivKeyYN,cblCertPswd,cblCertFilename,cblCertFile,cblCertCase,cblCertDescription,cblCertActive,cblCertWWWBinding) VALUES (@cblCertThumbprint,@cblCertSubject,@cblSrvType,@cblCertStore,@cblCertExp,@cblCertIssuer,@cblCertSN,@cblCertPrivKeyYN,@cblCertPswd,@cblCertFilename,@cblCertFile,@cblCertCase,@cblCertDescription,1,@cblCertWWWBinding)
  END
END