
/*********************************
* returns recordset of domain alias and resource name for the selected resource
* E.g., pass 'NetTellerDB' as resName and get back all domain aliases and NetTellerDB resValues
* Intended for use populating sect boxes
*********************************/
Create PROC [dbo].[GetResourceByType]    
	@resname varchar(25)=''
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
SELECT md.dAlias, mr.resValue from [DBO].[MGMTRESOURCES] mr join [DBO].[MGMTDOMAINS] md on md.dID=mr.resDomain where mr.Resname=@resname order by md.dAlias