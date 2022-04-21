
CREATE   PROCEDURE [dbo].[selPortResults]
	@RunID varchar(36),
	@hostIP varchar(20)
AS
BEGIN
	SET NOCOUNT ON;
	select distinct
	coalesce((select count(pcResults) FROM [dbo].[PortCheckResults] where pcDataCenter = @RunID and pcHostIP = @hostIP group by pcHostIP),0) as [Total],
	coalesce((select count(pcResults) FROM [dbo].[PortCheckResults] where pcDataCenter = @RunID and pcResults like 'Response = 0000%' and pcHostIP = @hostIP group by pcHostIP),0) as [Success],
	coalesce((select count(pcResults) FROM [dbo].[PortCheckResults] where pcDataCenter = @RunID and pcResults = 'No AS400Host record' and pcHostIP = @hostIP group by pcHostIP),0) as [NoAS400],
	coalesce((select count(pcResults) FROM [dbo].[PortCheckResults] where pcDataCenter = @RunID and pcResults like '%socket error%' and pcHostIP = @hostIP group by pcHostIP),0) as [SocketError],
	coalesce((select count(pcResults) FROM [dbo].[PortCheckResults] where pcDataCenter = @RunID and pcResults like 'No connection could be made%'  and pcHostIP = @hostIP group by pcHostIP),0) as [Refused]
	FROM [dbo].[PortCheckResults]
	where pcDataCenter = @RunID and pcHostIP = @hostIP
END