


Create PROCEDURE [dbo].[PortHealthByFI]
	@part int
AS
BEGIN
	select 
	pcr.pcFINum,pcr.pcFIName,pcr.pcHostIp,
	count(pcr.pcHostIp) as [total],
	sum(case when pcr.pcResults like '0000000%' then 1 else 0 end) as [Good],
	sum(case when pcr.pcResults like '' then 1 else 0 end) as [NoResp],
	sum(case when pcr.pcResults like '%response%' then 1 else 0 end) as [TimeOut],
	sum(case when pcr.pcResults like '%refused%' then 1 else 0 end) as [Refused],
	sum(case when pcr.pcResults like '%closed%' then 1 else 0 end) as [Closed]
	from isadmin.dbo.PortCheckResults pcr
	join isadmin.dbo.portcheckpartitions pcp on pcp.partJConnIP = pcr.pcHostIp
	where 
		(pcRunTime between (select runStart from isadmin.dbo.PortCheckRunTimes where runid = (select max(runId) from isadmin.dbo.PortCheckRunTimes)) 
		and (select runEnd from isadmin.dbo.PortCheckRunTimes where runid = (select max(runId) from isadmin.dbo.PortCheckRunTimes)))
		and pcp.partId=@part
	group by pcr.pcFINum,pcr.pcFIName,pcHostIp
	order by pcr.pcFINum
END