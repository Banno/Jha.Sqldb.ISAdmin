
CREATE PROC [dbo].[GetResourceList]    
	@domain varchar(25)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
IF @domain = '' SELECT DISTINCT [resName] FROM [ISAdmin].[DBO].[MGMTRESOURCES] ORDER BY [resName]
ELSE SELECT DISTINCT [resName] FROM [ISAdmin].[DBO].[MGMTRESOURCES] mr JOIN [ISAdmin].[DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain WHERE md.dname = @domain ORDER BY [resName]