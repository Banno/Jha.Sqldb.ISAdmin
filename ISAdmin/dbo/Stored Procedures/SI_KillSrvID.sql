

-- =============================================
-- Author:		NChilders
-- Create date: 12/21/15
-- Description:	Deletes specified srvID from all ServerInventory tables
-- =============================================
CREATE PROCEDURE [dbo].[SI_KillSrvID]
	@srvID int
AS
BEGIN
	SET NOCOUNT ON;

	declare @killID int
	SET @killID = @srvID
	delete from dbo.ServerInventory where srvID=@killID
	delete from dbo.ServerInventory_Hardware where srvID=@killID
	delete from dbo.ServerInventory_HWStats where srvID=@killID
	delete from dbo.ServerInventory_Network where srvID=@killID
	delete from dbo.ServerInventory_OS where srvID=@killID
	delete from dbo.ServerInventory_Services where srvID=@killID
	delete from dbo.ServerInventory_Software where srvID=@killID
END