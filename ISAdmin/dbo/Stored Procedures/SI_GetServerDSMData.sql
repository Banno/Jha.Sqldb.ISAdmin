

-- =============================================
-- Author:		Nick Childers
-- Create date: 6/20/2016
-- Modify date: 
-- Description:	Accepts input from ServerInventory Powershell, retrieves DSM records as needed
-- =============================================
CREATE PROCEDURE [dbo].[SI_GetServerDSMData]
	@site nchar(50),
	@srvname nchar(15),
	@macaddr nchar(50)
AS
BEGIN
	declare @srvid int
	declare @type nvarchar(10)
	SELECT @srvid = srvid, @type = rtrim(type) FROM ISAdmin.dbo.ServerInventory
	WHERE site = @site AND srvname = @srvname
	IF NULLIF(@srvid, '') IS NULL
		BEGIN
			select @srvid = si.srvid, @type = rtrim(si.type) from ISAdmin.dbo.ServerInventory si
				join ISAdmin.dbo.ServerInventory_Network nw on si.srvID=nw.srvID
			where nw.macaddr=@macaddr
			--print N'Found on macaddr: ' +  CAST(@srvid as VARCHAR)
		END

	IF NULLIF(@srvid, '') IS NOT NULL
		BEGIN

			declare @env as nvarchar(5)
			declare @sqlstring as nvarchar(max)
			if right(rtrim(@srvname),1) = 'A'
				BEGIN
					set @env = 'A'
				END
			ELSE
				BEGIN
					select @env = replace(dAlias, 'WWW-', '') from ISAdmin.dbo.mgmtDomains where dname=@site
				END

			set @sqlstring = N'select wsr.svcdispname,dsm.dvalue,dsm.dtype from ISAdmin.dbo.serverinventory_ntdsm dsm
				join ISAdmin.dbo.winservicerepo wsr on wsr.svcid=dsm.did
				where dsm.srvid = ' + cast(@srvid as nvarchar(max)) + ' and dsm.dtype = ''SVC''
			union
			select wsr.svcdispname,svc.[svcstate' + @env +'],wsr.svcgroup from ISAdmin.dbo.services svc
				join ISAdmin.dbo.winservicerepo wsr on wsr.svcid=svc.svcid
				where svc.srvtype = (select tid from ISAdmin.dbo.servertypes where ttype=''' + @type + ''') OR
				svc.srvtype = (select tid from ISAdmin.dbo.servertypes where ttype=''ALL'')
			order by svcdispname asc'

			execute sp_executesql @sqlstring
		END
END