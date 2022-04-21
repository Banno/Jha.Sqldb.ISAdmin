




-- =============================================
-- Author:		Nick Childers
-- Create date: 5/31/2016
-- Modify date: 
-- Description:	Accepts input from ServerInventory Powershell, retrieves records as needed
-- =============================================
CREATE PROCEDURE [dbo].[SI_GetDSMData]
	@site nchar(50),
	@srvname nchar(15),
	@macaddr nchar(50)
AS
BEGIN
	declare @srvid int
	SELECT @srvid = srvid FROM ISAdmin.dbo.ServerInventory
	WHERE site = @site AND srvname = @srvname
	IF NULLIF(@srvid, '') IS NULL
		BEGIN
			select @srvid = si.srvid from ISAdmin.dbo.ServerInventory si
				join ISAdmin.dbo.ServerInventory_Network nw on si.srvID=nw.srvID
			where nw.macaddr=@macaddr
			--print N'Found on macaddr: ' +  CAST(@srvid as VARCHAR)
		END

	IF NULLIF(@srvid, '') IS NOT NULL
		BEGIN
			SELECT dsm.dType,wsr.svcName,dsm.dValue FROM [ISAdmin].[dbo].[ServerInventory_NTDSM] dsm
			join ISAdmin.dbo.ServerInventory si on si.srvID=dsm.srvID
			join ISAdmin.dbo.WinServiceRepo wsr on wsr.svcID=dsm.dID
			where si.srvID = @srvid
		END
END