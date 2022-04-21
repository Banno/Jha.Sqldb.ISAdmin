

CREATE PROCEDURE [dbo].[GetNTDB_from_Alias]
	@alias char(10)
AS
BEGIN
	select dNTDB from [ISAdmin].[dbo].[mgmtDomains] where dAlias = @alias
END