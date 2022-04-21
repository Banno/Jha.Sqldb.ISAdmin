-- =============================================
-- Author:		Brian Whitacre
-- Create date: 4/10/2018
-- Description:	Queries for certificates in IS_ClientCertBaseline that are expired or 
--              will expire in the next 60 days
-- =============================================
CREATE PROCEDURE [dbo].[IS_ClientCertExpReport]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT ccbl.[cblCertSubject]
      ,ccbl.[cblCertExp]
      ,ccbl.[cblCertIssuer]
      ,ccbl.[cblCertDescription]
	  ,st.[tText]
  FROM [ISAdmin].[dbo].[IS_ClientCertBaseline] ccbl
  JOIN [ISAdmin].[dbo].[ServerTypes] st ON
    ccbl.cblSrvType = st.tType
  where ccbl.cblCertExp > DATEADD(DAY,-30,GETDATE()) AND ccbl.cblCertExp < DATEADD(DAY,+60,GETDATE())
  and ccbl.cblCertActive = 1
  order by ccbl.cblCertExp
END