
-- =============================================
-- Author:		Nick Childers
-- Create date: 5/31/2016
-- Modify date: 11/25/16
-- Description:	Accepts input from ServerInventory Powershell, inserts/updates records as needed
-- Changes:		11/25/16 - Moved KILLDSMData call to this SP to improve webserver performance
-- =============================================
CREATE PROCEDURE [dbo].[SI_PutDSMData]
	@site nchar(50),
	@srvname nchar(15),
	@macaddr nchar(50),
	@dsmType nvarchar(15),
	@dsmID int,
	@dsmValue nvarchar(100),
	@dsmTime nvarchar(50),
	@dsmNotes nvarchar(255)
AS
BEGIN
	--EXEC dbo.SI_KillDSMData @site,@srvname,@macaddr

	declare @srvid int
	declare @srvinactive int
	SELECT @srvid = srvid, @srvinactive = srvinactive FROM dbo.ServerInventory
	WHERE site = @site AND srvname = @srvname
	IF NULLIF(@srvid, '') IS NULL
		BEGIN
			select @srvid = si.srvid, @srvinactive = si.srvinactive from dbo.ServerInventory si
				join dbo.ServerInventory_Network nw on si.srvID=nw.srvID
			where nw.macaddr=@macaddr
			--print N'Found on macaddr: ' +  CAST(@srvid as VARCHAR)
		END

	IF NULLIF(@srvid, '') IS NOT NULL and @srvinactive <> 1
		BEGIN
			UPDATE dbo.ServerInventory set dsmwarn='TRUE' where srvID=@srvid
			INSERT INTO dbo.ServerInventory_NTDSM (srvid,dtype,did,dvalue,dtime,dnotes) VALUES (@srvid,@dsmType,@dsmID,@dsmValue,@dsmTime,@dsmNotes)
		END
END