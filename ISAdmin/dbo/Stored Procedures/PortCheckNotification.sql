CREATE PROCEDURE [dbo].[PortCheckNotification]
	@startTime datetime
	,@endTime datetime
	,@pDC int
AS
BEGIN
	declare @total numeric
		,@good as numeric



	--select @total = (Select count(pcResults) from isadmin.dbo.PortCheckResults pcr where pcr.pcRunTime between @startTime and @endTime and pcr.pcDataCenter=@pDC)
	select @total = (Select count(pcResults) from isadmin.dbo.PortCheckResults pcr where pcr.pcRunTime between @startTime and @endTime and pcr.pcDataCenter=@pDC and pcr.pcResults not like 'Error: Connecting to remote server%')
		,@good =(select count(pcResults) from isadmin.dbo.PortCheckResults pcr where pcr.pcRunTime between @startTime and @endTime and pcr.pcDataCenter=@pDC  and pcr.pcResults like '00000%')


	IF (@total > 0)
	BEGIN
		select cast((@good/@total)*100 as decimal(18,2))
	END
	ELSE
	BEGIN
		select 9999
	END
END