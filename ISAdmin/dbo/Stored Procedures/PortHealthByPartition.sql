


CREATE PROCEDURE [dbo].[PortHealthByPartition]
	@part int
AS
BEGIN

	select pcp.PartId,pcp.partName,pcr.pcHostIp,count(pcr.pcHostIp) as [total],
	sum(case when pcr.pcResults like '0000000%' then 1 else 0 end) as [Good]
	from isadmin.dbo.PortCheckResults pcr
	join isadmin.dbo.portcheckpartitions pcp on pcp.partJConnIP = pcr.pcHostIp
	where 
		(pcRunTime between (select runStart from isadmin.dbo.PortCheckRunTimes where runid = (select max(runId) from isadmin.dbo.PortCheckRunTimes)) 
		and (select runEnd from isadmin.dbo.PortCheckRunTimes where runid = (select max(runId) from isadmin.dbo.PortCheckRunTimes)))
		--and pcDataCenter = 1
		and pcp.partId=@part
	group by pcHostIp,pcp.PartName, pcp.PartId
	order by pcp.PartID
END