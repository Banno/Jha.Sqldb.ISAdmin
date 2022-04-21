-- =============================================
-- Author:		Brian Whitacre
-- Create date: 8/8/2017
-- Description:	Accepts input from NT module cmdlets that update code, sets the current IIS phy path baseline
-- =============================================
CREATE PROCEDURE [dbo].[IS_SetWebAppBaseLine] 
	-- ibTimeStamp,ibAppName,ibAppPhysPath,ibSrvType
	@ibTimeStamp datetime2(0),
    @ibAppName nvarchar(50),
	@ibSrvType nvarchar(50),
	@ibAppPhysPath nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
  SET NOCOUNT ON;
  UPDATE dbo.IS_WebAppBaseLine SET 
    ibTimeStamp=coalesce(@ibTimeStamp, ibTimeStamp),
	ibAppName=coalesce(@ibAppName, ibAppName),
	ibAppPhysPath=coalesce(@ibAppPhysPath, ibAppPhysPath)
  WHERE ibSrvType=@ibSrvType
    and ibAppName=@ibAppName
  IF @@ROWCOUNT=0
    BEGIN
	  INSERT INTO dbo.IS_WebAppBaseLine (ibTimeStamp, ibSrvType, ibAppName, ibAppPhysPath) VALUES (@ibTimeStamp, @ibSrvType, @ibAppName, @ibAppPhysPath);
	END
END