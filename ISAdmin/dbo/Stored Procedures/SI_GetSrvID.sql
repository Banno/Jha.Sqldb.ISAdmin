

-- =============================================
-- Author:		NChilders
-- Create date: ??/??/??
-- Description:	Gets "universal" SrvID for given server
-- =============================================
CREATE PROCEDURE [dbo].[SI_GetSrvID]
	@site varchar(50),
	@srvname varchar(15),
	@srvid int OUTPUT
AS
SELECT @srvid = srvid FROM ISAdmin.dbo.ServerInventory
WHERE site = @site AND srvname = @srvname