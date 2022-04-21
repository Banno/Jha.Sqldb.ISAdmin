


CREATE PROCEDURE [dbo].[PortCheckByDC]
	@iRun int
AS
BEGIN

	declare @DC int = 0 --(select count(1) from dbo.PortCheckDC)
	declare @total int = isnull((select count(1) from dbo.PortCheckDC),0)
	declare @iCount int = 0
	declare @rDCName varchar(50)
	declare @rTotal int
	declare @rGood int
	declare @rNoResp int
	declare @rRespond int
	declare @rRefuse int

	DECLARE @myResults TABLE  
	(    
	  DCName varchar(50)  
	 ,[Total] int 
	 ,[Good] int
	 ,[NoResp] int  
	 ,[Respond] int  
	 ,[Refuse] int  
	)  

	while (@iCount <> (@total))
	BEGIN
		set @DC = (select dcID from dbo.PortCheckDC order by dcID offset @iCount rows fetch next 1 rows only)
		set @rDCName = (select dcName from dbo.PortCheckDC where dcID = @DC)
		set @rTotal = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter, PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcDataCenter = @DC)
		set @rGood = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter, PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and pcResults like '0000000%' and r.pcDataCenter = @DC)
		set @rNoResp = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter, PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and pcResults like '' and r.pcDataCenter = @DC)
		set @rRespond = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter, PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and pcResults like '%respond%' and r.pcDataCenter = @DC)
		set @rRefuse = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter, PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and pcResults like '%refused%' and r.pcDataCenter = @DC)
		--select @rDCName as [DataCenter],@rTotal as [Total],@rNoResp as [NoResp],@rRespond as [Respond],@rRefuse as [Refused]
		insert into @myResults (DCName,[Total],[Good],[NoResp],[Respond],[Refuse]) values(@rDCName,@rTotal,@rGood,@rNoResp,@rRespond,@rRefuse)
		set @iCount = @iCount +1
	END
	select * from @myResults
END