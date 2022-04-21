

-- =============================================
-- Author:		Nick Childers
-- Create date: 10/14/2015
-- Description:	Returns ordered list of server types from ServerTypes table
-- =============================================
CREATE PROCEDURE [dbo].[SI_GetSrvTypes] 
AS
BEGIN
	SET NOCOUNT ON;

	Select rtrim(tType) as tType,tSearchOrder from dbo.ServerTypes
	WHERE tType <> 'Pending'
	ORDER BY tSearchOrder asc
END