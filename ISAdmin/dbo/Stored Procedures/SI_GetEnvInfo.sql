

-- =============================================
-- Author:		Nick Childers
-- Create date: 6/21/2016
-- Modify date: 
-- Description:	Gets list of active Environments/Domains/NW Info/etc
-- =============================================
CREATE PROCEDURE [dbo].[SI_GetEnvInfo]
	@req nchar(25),
	@env nchar(25) = ''
AS
BEGIN
	IF @req = 'EnvList'
	BEGIN
		SELECT rtrim(dName),rtrim(dAlias) FROM ISAdmin.dbo.mgmtDomains
--			WHERE dAlias <> 'WWW-A2' AND dAlias <> 'MGMT' order by dAlias
			WHERE dAlias <> 'MGMT' order by dAlias
	END
	IF @req = 'EnvNetwork'
	BEGIN
		SELECT rtrim(dName),rtrim(dGateway),rtrim(dVLAN) FROM ISAdmin.dbo.mgmtDomains
			WHERE dAlias = @env
	END
	IF @req = 'EnvServers'
	BEGIN
		SELECT rtrim(dName),rtrim(dAlias),rtrim(dPDC),rtrim(dNTDB),rtrim(dEchoDB) FROM ISAdmin.dbo.mgmtDomains
--			WHERE dAlias <> 'WWW-A2' AND dAlias <> 'MGMT' order by dAlias
			WHERE dAlias <> 'MGMT' order by dAlias
	END
END