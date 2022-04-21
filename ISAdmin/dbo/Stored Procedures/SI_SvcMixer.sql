

-- =============================================
-- Author:		NChilders
-- Create date: 12/21/15
-- Description:	Receives Windows Service names and updates/adds new as needed
-- =============================================
CREATE PROCEDURE [dbo].[SI_SvcMixer]
	@svcName nchar(100),
	@svcDispName nchar(100)
AS
BEGIN
	SET NOCOUNT ON;

	declare @svcID int
	SELECT @svcID = svcID FROM ISAdmin.dbo.WinServiceRepo
	WHERE svcName = @svcName

	IF NULLIF(@svcID, '') IS NULL
		BEGIN
			INSERT INTO ISAdmin.dbo.WinServiceRepo (svcName,svcDispName,svcGroup) VALUES (@svcName,@svcDispName,'')
		END
END