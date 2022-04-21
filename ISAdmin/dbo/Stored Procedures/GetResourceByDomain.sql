
/*********************************
* Alias can be 'LXQNT','ISG',etc - whatever is in the mgmtDomains table
* Resource name is optional
*********************************/
CREATE PROC [dbo].[GetResourceByDomain]    
	@domain varchar(25)='',
	@resname varchar(25)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
IF @domain='' set @domain = 'All'
DECLARE @dstring varchar(50)
DECLARE @qString varchar(500)
IF @domain = 'All' set @dstring = ' where md.dName LIKE ''%%'' ' ELSE set @dstring = ' where md.dName = ''' + @domain + ''' '
IF @resname = '' set @qString = 'SELECT md.dname, md.dAlias, mr.resName, mr.resValue from [ISAdmin].[DBO].[MGMTRESOURCES] mr join [ISAdmin].[DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain ' +  @dstring + ' ORDER BY mr.resName,md.dAlias'
ELSE set @qString = 'SELECT md.dname, md.dAlias, mr.resName, mr.resValue from [ISAdmin].[DBO].[MGMTRESOURCES] mr join [ISAdmin].[DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain ' + @dstring + ' and mr.resName = ''' + @resname + ''' ORDER BY mr.resName,md.dAlias'

EXEC (@qString)