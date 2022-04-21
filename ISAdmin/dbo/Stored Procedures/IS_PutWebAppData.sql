
-- =============================================
-- Author:		Nick Childers
-- Create date: 5/11/2017
-- Description:	Accepts input from WebAppReport Powershell, creates records in IS_WebAppRepo
-- =============================================
CREATE PROCEDURE [dbo].[IS_PutWebAppData]
--iTimeStamp,iSrvName,iRootSite,iAppName,iAppPhysPath,iAppPool,iAppPoolUser
	@iTimeStamp datetime2(0),
	@iSrvName nvarchar(50),
	@iRootSite nvarchar(50),
	@iAppName nvarchar(50),
	@iAppPhysPath nvarchar(MAX),
	@iAppPool nvarchar(50),
	@iAppPoolUser nvarchar(50)
AS
BEGIN
	declare @iSrvType nvarchar(50)
	SELECT top 1 @iSrvType = type FROM dbo.ServerInventory
	WHERE srvname = @iSrvName

	declare @iid int
	SELECT @iid = iID FROM dbo.IS_WebAppRepo
	WHERE iSrvName = @iSrvName AND iRootSite = @iRootSite AND iAppName = @iAppName

	INSERT INTO dbo.IS_WebAppRepoArchive (iTimeStamp,iSrvName,iSrvType,iRootSite,iAppName,iAppPhysPath,iAppPool,iAppPoolUser) VALUES (@iTimeStamp,@iSrvName,@iSrvType,@iRootSite,@iAppName,@iAppPhysPath,@iAppPool,@iAppPoolUser)

	UPDATE dbo.IS_WebAppRepo SET 
		iTimeStamp=coalesce(@iTimeStamp, iTimeStamp),
		iSrvName=coalesce(@iSrvName, iSrvName),
		iSrvType=coalesce(@iSrvType, iSrvType),
		iRootSite=coalesce(@iRootSite, iRootSite),
		iAppName=coalesce(@iAppName, iAppName),
		iAppPhysPath=coalesce(@iAppPhysPath, iAppPhysPath),
		iAppPool=coalesce(@iAppPool, iAppPool),
		iAppPoolUser=coalesce(@iAppPoolUser, iAppPoolUser)
	WHERE iid=@iid
	IF @@ROWCOUNT=0
		BEGIN
			INSERT INTO dbo.IS_WebAppRepo (iTimeStamp,iSrvName,iSrvType,iRootSite,iAppName,iAppPhysPath,iAppPool,iAppPoolUser) VALUES (@iTimeStamp,@iSrvName,@iSrvType,@iRootSite,@iAppName,@iAppPhysPath,@iAppPool,@iAppPoolUser)
		END

END