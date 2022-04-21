

-- =============================================
-- Author:		Nick Childers
-- Create date: 7/29/2019
-- Description:	Accepts input from ServerInventory Powershell, creates records in ServerInventory_InstalledApps
-- =============================================
CREATE PROCEDURE [dbo].[SI_PutIAData]
	@iaTimeStamp datetime2(0),
	@iaSrvName nvarchar(25),
	@iaSrvDomain nvarchar(25),
	@iaAppName nvarchar(500),
	@iaAppVersion nvarchar(50),
	@iaAppPublisher nvarchar(50),
	@iaAppInstallDate nvarchar(50)
AS
BEGIN
	declare @xSrvID int
	SELECT top 1 @xSrvID = srvID FROM dbo.ServerInventory
	WHERE srvname = @iaSrvName AND site = @iaSrvDomain

	declare @iaID int
	SELECT @iaID = iaID FROM dbo.ServerInventory_InstalledApps
	WHERE iaSrvID = @xSrvID AND iaAppName = @iaAppName AND iaAppVersion = @iaAppVersion

	UPDATE dbo.ServerInventory_InstalledApps SET 
		iaTimeStamp=coalesce(@iaTimeStamp, iaTimeStamp)
	WHERE iaID=@iaID
	IF @@ROWCOUNT=0
		BEGIN
			INSERT INTO dbo.ServerInventory_InstalledApps (iaSrvID,iaAppName,iaAppVersion,iaAppPublisher,iaAppInstallDate,iaFirstSeen,iaTimeStamp) VALUES (@xSrvID,@iaAppName,@iaAppVersion,@iaAppPublisher,@iaAppInstallDate,@iaTimeStamp,@iaTimeStamp)
		END

END