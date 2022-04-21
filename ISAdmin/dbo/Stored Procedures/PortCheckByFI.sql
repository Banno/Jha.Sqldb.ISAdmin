
Create PROCEDURE [dbo].[PortCheckByFI]
	@iRun int
	,@partIP varchar(12)
AS
BEGIN

	declare @total int = isnull((select count(distinct pcFINum) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp),0)
	declare @iCount int = 0
	declare @thisFI int

	declare @rFINum int
		,@rFIName varchar(50)
		,@rHostName varchar(25)
		,@rHostIp varchar(12)
		,@rTotalPorts int
		,@rGood int
		,@rNoResp int
		,@rRespond int
		,@rRefused int

	declare @myResults TABLE
		(
		 [FINum] int
		 ,[FIName] varchar(50)
		 ,[HostName] varchar(25)
		 ,[HostIp] varchar(12)
		 ,[TotalPorts] int
		 ,[Good] int
		 ,[NoResp] int
		 ,[Respond] int
		 ,[Refused] int
		)


	while(@iCount <> (@total))
	BEGIN
		set @thisFI = (select distinct(pcFINum) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp order by pcFINum  offset @iCount rows fetch next 1 rows only)
		set @rFINum = (select distinct(pcFINum) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcFINum = @thisFI )
		set @rFIName = (select distinct(pcFIName) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcFINum = @thisFI )
		set @rHostName = (select distinct(pcHostName) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcFINum = @thisFI )
		set @rHostIp = (select distinct(pcHostIp) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcFINum = @thisFI )
		set @rTotalPorts = (select Count(pcHostPort) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcFINum = @thisFI)
		set @rGood = (select Count(pcHostPort) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcResults like '00000%'  and pcFINum = @thisFI)
		set @rNoResp = (select Count(pcHostPort) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcResults like ''  and pcFINum = @thisFI)
		set @rRespond = (select Count(pcHostPort) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcResults like '%response%'  and pcFINum = @thisFI)
		set @rRefused = (select Count(pcHostPort) from dbo.PortCheckResults r,PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and r.pcHostIp = @partIp and pcResults like '%refused%'  and pcFINum = @thisFI)
		insert into @myResults values(@rFINum,@rFIName,@rHostName,@rHostIp,@rTotalPorts,@rGood,@rNoResp,@rRespond,@rRefused)
		set @iCount = @iCount +1
	END
	select * from @myResults

END