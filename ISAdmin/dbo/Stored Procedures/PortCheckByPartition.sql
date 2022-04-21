


CREATE PROCEDURE [dbo].[PortCheckByPartition]
	@iRun int,
	@DC int
AS
BEGIN

	declare @total_partitions int = isnull((select count(1) from [ISAdmin].[dbo].[PortCheckPartitions] where partDC=@DC),0)

	declare @iCount int = 0
	declare @rDCName varchar(50)
	declare @rTotal int
	declare @rGood int
	declare @rNoResp int
	declare @rRespond int
	declare @rRefuse int
	declare @partIp varchar(12)
	declare @partName varchar(50)

	DECLARE @myResults TABLE  
	(    
	  partName varchar(50) 
	 ,[partIp] varchar(12) 
	 ,[Total] int 
	 ,[Good] int
	 ,[NoResp] int  
	 ,[Respond] int  
	 ,[Refuse] int  
	)  

	while (@iCount <> (@total_partitions))
	BEGIN
		set @partIp = (select partJConnIp from [dbo].[PortCheckPartitions] where partDC = @DC order by partName offset @iCount rows fetch next 1 rows only)
		set @partName = (select partName from [dbo].[PortCheckPartitions] where partDC = @DC and partjConnIP = @partIp)
		set @rTotal = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter join [dbo].[portCheckPartitions] pp on r.pcHostIp=pp.partJConnIP,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcDataCenter = @DC and r.pcHostIp = @partIp)
		set @rGood = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter join [dbo].[portCheckPartitions] pp on r.pcHostIp=pp.partJConnIP,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcDataCenter = @DC and r.pcHostIp = @partIp and pcResults like '0000000%' )
		set @rNoResp = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter join [dbo].[portCheckPartitions] pp on r.pcHostIp=pp.partJConnIP,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcDataCenter = @DC and r.pcHostIp = @partIp and pcResults like '' )
		set @rRespond = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter join [dbo].[portCheckPartitions] pp on r.pcHostIp=pp.partJConnIP,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcDataCenter = @DC and r.pcHostIp = @partIp and pcResults like '%response%' )
		set @rRefuse = (select count(pcResults) from dbo.PortCheckResults r join dbo.PortCheckDC dc on dc.dcID=r.pcDataCenter join [dbo].[portCheckPartitions] pp on r.pcHostIp=pp.partJConnIP,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcDataCenter = @DC and r.pcHostIp = @partIp and pcResults like '%refused%' )	
		insert into @myResults ([partName],[partIp],[Total],[Good],[NoResp],[Respond],[Refuse]) values(@partName,@partIp,@rTotal,@rGood,@rNoResp,@rRespond,@rRefuse)
		set @iCount = @iCount +1
	END
	select * from @myResults
END