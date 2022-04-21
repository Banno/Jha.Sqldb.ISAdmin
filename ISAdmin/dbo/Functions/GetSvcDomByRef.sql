
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetSvcDomByRef] 
(
	@strInput nvarchar(25)
)
RETURNS nvarchar(25)
AS
BEGIN
	declare @retDom nvarchar(25)

	SELECT @retDom = dName FROM dbo.mgmtDomains
	WHERE dName = @strInput
	IF @retDom IS NULL
		BEGIN
			SELECT @retDom = dName FROM dbo.mgmtDomains
			WHERE dAlias = @strInput
		END

--	SELECT @retDom = sdDomain FROM dbo.ServiceAccountDomains
--	WHERE sdDomain = @strInput
--	IF @retDom IS NULL
--		BEGIN
--			SELECT @retDom = sdDomain FROM dbo.ServiceAccountDomains
--			WHERE sdAlias = @strInput
--		END
	
	Return @retDom
END