
/*********************************
* 
*********************************/
CREATE PROC [dbo].[GetResource]    
	@alias varchar(25),
	@resname varchar(25)
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
SELECT resValue from [ISAdmin].[DBO].[MGMTRESOURCES] mr join [ISAdmin].[DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain where md.dAlias = @alias and mr.resName = @resname