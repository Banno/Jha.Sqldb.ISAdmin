

-- =============================================
-- Author:		Nick Childers
-- Create date: 7/31/2017
-- Description:	Accepts input from WinSvcReport Powershell, creates records in IS_WinSvcRepo
-- =============================================
CREATE PROCEDURE [dbo].[IS_PutWinSvcData]
--iTimeStamp,iSrvName,iRootSite,iAppName,iAppPhysPath,iAppPool,iAppPoolUser
	@iTimeStamp datetime2(0),
	@iSrvName nvarchar(25),
	@iSvcName nvarchar(50),
	@iSvcDispName nvarchar(50),
	@iSvcPath nvarchar(MAX),
	@iSvcUserName nvarchar(50),
	@iSvcStartType nvarchar(10)
AS
BEGIN
	declare @iSrvType nvarchar(50)
	SELECT top 1 @iSrvType = type FROM dbo.ServerInventory
	WHERE srvname = @iSrvName

	declare @iid int
	SELECT @iid = iID FROM dbo.IS_WinSvcRepo
	WHERE iSrvName = @iSrvName AND iSvcName = @iSvcName

	--INSERT INTO dbo.IS_WebAppRepoArchive (iTimeStamp,iSrvName,iSrvType,iRootSite,iAppName,iAppPhysPath,iAppPool,iAppPoolUser) VALUES (@iTimeStamp,@iSrvName,@iSrvType,@iRootSite,@iAppName,@iAppPhysPath,@iAppPool,@iAppPoolUser)

	UPDATE dbo.IS_WinSvcRepo SET 
		iTimeStamp=coalesce(@iTimeStamp, iTimeStamp),
		iSrvName=coalesce(@iSrvName, iSrvName),
		iSrvType=coalesce(@iSrvType, iSrvType),
		iSvcName=coalesce(@iSvcName, iSvcName),
		iSvcDispName=coalesce(@iSvcDispName, iSvcDispName),
		iSvcPath=coalesce(@iSvcPath, iSvcPath),
		iSvcUserName=coalesce(@iSvcUserName, iSvcUserName),
		iSvcStartType=coalesce(@iSvcStartType, iSvcStartType)
	WHERE iid=@iid
	IF @@ROWCOUNT=0
		BEGIN
			INSERT INTO dbo.IS_WinSvcRepo (iTimeStamp,iSrvName,iSrvType,iSvcName,iSvcDispName,iSvcPath,iSvcUserName,iSvcStartType) VALUES (@iTimeStamp,@iSrvName,@iSrvType,@iSvcName,@iSvcDispName,@iSvcPath,@iSvcUserName,@iSvcStartType)
		END

END