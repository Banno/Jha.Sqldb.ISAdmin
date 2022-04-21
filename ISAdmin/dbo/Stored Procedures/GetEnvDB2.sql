

CREATE PROC [dbo].[GetEnvDB2]    
	@alias varchar(25),
	@dbtype int = 0,
	@dbname varchar(10)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
IF @dbtype > 0
	SELECT CASE 
		WHEN @dbtype = 1 THEN (select MGMT.dNTDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias)
		WHEN @dbtype = 2 THEN (select MGMT.dEchoDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		WHEN @dbtype = 3 THEN (select MGMT.dReportDB  + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		WHEN @dbtype = 4 THEN (select MGMT.dOFMDB  + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		WHEN @dbtype = 5 THEN (select MGMT.dOLMDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		ELSE (select 'invalid database')
	END
ELSE
	SELECT CASE 
		WHEN @dbname = 'NTDB' THEN (select MGMT.dNTDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias)
		WHEN @dbname = 'ECHO' THEN (select MGMT.dEchoDB+ '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		WHEN @dbname = 'RPT' THEN (select MGMT.dReportDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		WHEN @dbname = 'OFM' THEN (select MGMT.dOFMDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		WHEN @dbname = 'OLM' THEN (select MGMT.dOLMDB + '|' + sac.acctName + '|' + sac.acctPswd from [ISAdmin].[DBO].[MGMTDOMAINS] mgmt join ISAdmin.dbo.ServiceAccountDomains sad on sad.sdAlias = mgmt.dAlias join [ISAdmin].[dbo].[ServiceAccounts_New] sac on sac.acctDomain=sad.sdID where sac.acctGroups='DBRO' and MGMT.dAlias = @alias) 
		ELSE (select 'invalid database')
	END