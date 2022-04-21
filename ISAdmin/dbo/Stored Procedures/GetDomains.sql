
Create PROC [dbo].[GetDomains]    
as
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED   
SELECT dName,dAlias from [ISAdmin].[DBO].[MGMTDOMAINS] order by dAlias