

/*********************************
* 
*********************************/
CREATE PROC [dbo].[GetEnvDBRW]    
	@alias varchar(25),
	@dbtype int = 0,
	@dbname varchar(10)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
IF @dbtype > 0
	SELECT CASE 
		WHEN @dbtype = 1 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='NetTellerDB')
		WHEN @dbtype = 2 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='EchoDB')
		WHEN @dbtype = 3 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='ReportDB')
		WHEN @dbtype = 4 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='OFMDB')
		WHEN @dbtype = 5 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='OfflineDB')
		WHEN @dbtype = 6 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='TreasuryDB')
		WHEN @dbtype = 7 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='ESIDB')
		WHEN @dbtype = 8 THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='SlabDB')
		ELSE (select 'invalid database')
	END
ELSE
	SELECT CASE 
		WHEN @dbname = 'NTDB' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='NetTellerDB')
		WHEN @dbname = 'ECHO' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='EchoDB')
		WHEN @dbname = 'RPT' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='ReportDB')
		WHEN @dbname = 'OFM' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='OFMDB')
		WHEN @dbname = 'OLM' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='OfflineDB')
		WHEN @dbname = 'TRDB' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='TreasuryDB')
		WHEN @dbname = 'ESDB' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='ESIDB')
		WHEN @dbname = 'SLAB' THEN (select mr.resValue + '|' + sac.acctName + '|' + sac.acctPswd from [DBO].[MGMTDOMAINS] mgmt join [dbo].[mgmtResources] mr on mgmt.dID=mr.resDomain join [dbo].[ServiceAccounts_New] sac  on sac.acctDomain=mgmt.dID where  MGMT.dAlias = @alias and sac.acctName = 'QAMaster' and mr.resName='SlabDB')
		ELSE (select 'invalid database')
	END