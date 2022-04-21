
-- =============================================
-- Author:		Nick Childers
-- Create date: 5/27/2016
-- Modify date: 
-- Description:	Accepts input from ServerInventory, purges DSM table entries for specified server
-- =============================================
CREATE PROCEDURE [dbo].[SI_KillDSMData]
	@site nchar(50),
	@srvname nchar(15),
	@macaddr nchar(50)
AS
BEGIN
	declare @srvid int
	SELECT @srvid = srvid FROM dbo.ServerInventory
	WHERE site = @site AND srvname = @srvname
	IF NULLIF(@srvid, '') IS NULL
		BEGIN
			select @srvid = si.srvid from dbo.ServerInventory si
				join dbo.ServerInventory_Network nw on si.srvID=nw.srvID
			where nw.macaddr=@macaddr
			--print N'Found on macaddr: ' +  CAST(@srvid as VARCHAR)
		END

	UPDATE dbo.ServerInventory SET dsmwarn='' WHERE srvID=@srvid
	DELETE FROM dbo.ServerInventory_NTDSM WHERE srvID=@srvid

END