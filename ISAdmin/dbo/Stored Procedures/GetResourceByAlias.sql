
/*********************************
* Alias can be 'WWW-A','Prod',etc - whatever is in the mgmtDomains table
* Resource name is optional
*********************************/
CREATE PROC [dbo].[GetResourceByAlias]    
	@alias varchar(25),
	@resname varchar(25)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
IF @resname = '' SELECT md.dAlias, mr.resName, mr.resValue from [ISAdmin].[DBO].[MGMTRESOURCES] mr join [ISAdmin].[DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain where md.dAlias = @alias
ELSE SELECT md.dAlias, mr.resName, mr.resValue from [ISAdmin].[DBO].[MGMTRESOURCES] mr join [ISAdmin].[DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain where md.dAlias = @alias and mr.resName = @resname