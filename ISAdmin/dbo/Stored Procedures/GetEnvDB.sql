

CREATE PROC [dbo].[GetEnvDB]    
	@alias varchar(25),
	@dbtype int = 0,
	@dbname varchar(10)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
IF @dbtype > 0
	SELECT CASE 
		WHEN @dbtype = 1 THEN (select dNTDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias)
		WHEN @dbtype = 2 THEN (select dEchoDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		WHEN @dbtype = 3 THEN (select dReportDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		WHEN @dbtype = 4 THEN (select dOFMDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		WHEN @dbtype = 5 THEN (select dOLMDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		ELSE (select 'invalid database')
	END
ELSE
	SELECT CASE 
		WHEN @dbname = 'NTDB' THEN (select dNTDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias)
		WHEN @dbname = 'ECHO' THEN (select dEchoDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		WHEN @dbname = 'RPT' THEN (select dReportDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		WHEN @dbname = 'OFM' THEN (select dOFMDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		WHEN @dbname = 'OLM' THEN (select dOLMDB from [ISAdmin].[DBO].[MGMTDOMAINS] where dAlias = @alias) 
		ELSE (select 'invalid database')
	END