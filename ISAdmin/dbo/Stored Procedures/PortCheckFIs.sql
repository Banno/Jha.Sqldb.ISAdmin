
CREATE PROCEDURE [dbo].[PortCheckFIs]
	@iRun int
	,@partIP varchar(12)
AS
BEGIN
	SELECT distinct pcFINum FROM [ISAdmin].[dbo].[PortCheckResults],PortCheckRunTimes rt where pcRunTime between rt.runStart and rt.runEnd and rt.runId=@iRun and pcHostIp=@partIP order by pcFINum 
END