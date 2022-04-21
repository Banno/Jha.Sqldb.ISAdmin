
-- =============================================
-- Author:		Bob
-- Create date: 4/25/2018
-- Description:	Add records to PortCheckResults table
-- =============================================
CREATE   PROCEDURE [dbo].[insPortCheckResults]
	@fiName varchar(50),
	@fiNumber int,
	@fiVersion int,
	@hostName varchar(50),
	@hostIP varchar(20),
	@hostPort int,
	@results varchar(254),
	@runInstance uniqueidentifier,
	@HBServer varchar(25)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @thisTime DateTime
	set @thisTime = GetDate()

	insert into [dbo].[PortCheckResults] ([pcRunTime], [pcFINum], [pcFIName], [pcVersion], [pcHostName], [pcHostIp], [pcHostPort], [pcResults], [pcHBServer], [pcDataCenter])
	values(@thisTime,@fiNumber,@fiName,@fiVersion,@hostName,@hostIP,@hostPort,@results,@HBServer, cast(@runInstance as varchar(36)))

END