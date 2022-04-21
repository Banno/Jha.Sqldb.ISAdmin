
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSvcEnvByRef] 
(
	@strInput nvarchar(25)
)
RETURNS nvarchar(25)
AS
BEGIN
	declare @retEnv nvarchar(25)
	select @retEnv = resValue from dbo.mgmtResources mr
	join dbo.mgmtDomains md on md.dID=mr.resDomain
	where md.dName = @strInput and mr.resName = 'DomainCredAlias'
	IF @retEnv IS NULL
		BEGIN
			SELECT top 1 @retEnv = dAlias FROM dbo.mgmtDomains
			WHERE dAlias = @strInput
		END

--	SELECT @retEnv = dAlias FROM dbo.mgmtDomains
--	WHERE dName = @strInput
--	IF @retEnv IS NULL
--		BEGIN
--			SELECT @retEnv = dAlias FROM dbo.mgmtDomains
--			WHERE dAlias = @strInput
--		END



	Return @retEnv
END