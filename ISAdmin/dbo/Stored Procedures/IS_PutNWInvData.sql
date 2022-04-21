
-- =============================================
-- Author:		Nick Childers
-- Create date: 8/4/2017
-- Modify date: 11/1/2019 - Added environment
-- Description:	Accepts input from NWInventory Powershell for F5/LTM, inserts/updates records as needed
-- =============================================
CREATE PROCEDURE [dbo].[IS_PutNWInvData]
	@datatype nvarchar(20),
	@env nvarchar(25),
	@name nvarchar(50),
	@timestamp datetime2(0),
	@description nvarchar(MAX) = '',
	@partition nvarchar(25) = '',
	@pool nvarchar(50) = '',
	@ipaddr nvarchar(15) = '',
	@port nvarchar(10) = '',
	@sessionstate nvarchar(25) = '',
	@state nvarchar(25) = '',
	@icon nvarchar(25) = '',
	@mode nvarchar(50) = ''
AS
BEGIN

	declare @paID int
	declare @poID int
	declare @vsID int
	declare @noID int
	declare @pmID int
	declare @ouID int

	IF @datatype = 'PARTITION'
		BEGIN
			select @paID = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@name
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.NWInventory_LTMPartitions (paEnv,paName,paCurrent,paTimeStamp) VALUES (@env,@name,'TRUE',@timestamp)
				END
			ELSE
				BEGIN
					UPDATE dbo.NWInventory_LTMPartitions SET
						paCurrent='TRUE',
						paTimeStamp=coalesce(@timestamp, paTimeStamp)
					WHERE paID=@paID
				END
		END
	ELSE IF @datatype = 'POOL'
		BEGIN
			select @paID = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@partition
			select @poID = poID from dbo.NWInventory_LTMPools where poEnv=@env and poName=@name and poPartition=@paID
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.NWInventory_LTMPools (poEnv,poName,poPartition,poDescription,poMode,poCurrent,poTimeStamp) VALUES (@env,@name,@paID,@description,@mode,'TRUE',@timestamp)
				END
			ELSE
				BEGIN
					UPDATE dbo.NWInventory_LTMPools SET 
						poDescription=coalesce(@description, poDescription),
						poMode=coalesce(@mode, poMode),
						poCurrent='TRUE',
						poTimeStamp=coalesce(@timestamp, poTimeStamp)
					WHERE poID=@poID
				END
		END
	ELSE IF @datatype = 'VIRTUALSERVER'
		BEGIN
			select @paID = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@partition
			select @poID = poID from dbo.NWInventory_LTMPools where poEnv=@env and poName=@pool and poPartition=@paID
			select @vsID = vsID from dbo.NWInventory_LTMVirtualServers where vsEnv=@env and vsName=@name and vsPartition=@paID
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.NWInventory_LTMVirtualServers (vsEnv,vsName,vsPartition,vsDescription,vsPool,vsIP,vsPort,vsCurrent,vsTimeStamp) VALUES (@env,@name,@paID,@description,@poID,@ipaddr,@port,'TRUE',@timestamp)
				END
			ELSE
				BEGIN
					UPDATE dbo.NWInventory_LTMVirtualServers SET 
						vsDescription=coalesce(@description, vsDescription),
						vsPool=coalesce(@poID, vsPool),
						vsIP=coalesce(@ipaddr, vsIP),
						vsPort=coalesce(@port, vsPort),
						vsCurrent='TRUE',
						vsTimeStamp=coalesce(@timestamp, vsTimeStamp)
					WHERE vsID=@vsID
				END
		END
	ELSE IF @datatype = 'NODE'
		BEGIN
			select @paID = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@partition
			select @noID = noID from dbo.NWInventory_LTMNodes where noEnv=@env and noName=@name and noPartition=@paID
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.NWInventory_LTMNodes (noEnv,noName,noPartition,noDescription,noIP,noSessionState,noState,noIcon,noCurrent,noTimeStamp) VALUES (@env,@name,@paID,@description,@ipaddr,@sessionstate,@state,@icon,'TRUE',@timestamp)
				END
			ELSE
				BEGIN
					UPDATE dbo.NWInventory_LTMNodes SET 
						noDescription=coalesce(@description, noDescription),
						noIP=coalesce(@ipaddr, noIP),
						noSessionState=coalesce(@sessionstate, noSessionState),
						noState=coalesce(@state, noState),
						noIcon=coalesce(@icon, noIcon),
						noCurrent='TRUE',
						noTimeStamp=coalesce(@timestamp, noTimeStamp)
					WHERE noID=@noID
				END
		END
	ELSE IF @datatype = 'POOLMEMBER'
		BEGIN
			select @paID = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@partition
			select @poID = poID from dbo.NWInventory_LTMPools where poEnv=@env and poName=@pool and poPartition=@paID
			select @noID = noID from dbo.NWInventory_LTMNodes where noEnv=@env and noName=@name and noPartition=@paID
			select @pmID = pmID from dbo.NWInventory_LTMPoolMembers where pmEnv=@env and pmName=@noID and pmPool=@poID and pmPort=@port and pmPartition=@paID
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.NWInventory_LTMPoolMembers (pmEnv,pmName,pmPartition,pmPool,pmIP,pmPort,pmSessionState,pmState,pmIcon,pmCurrent,pmTimeStamp) VALUES (@env,@noID,@paID,@poID,@ipaddr,@port,@sessionstate,@state,@icon,'TRUE',@timestamp)
				END
			ELSE
				BEGIN
					UPDATE dbo.NWInventory_LTMPoolMembers SET 
						pmIP=coalesce(@ipaddr, pmIP),
						pmPort=coalesce(@port, pmPort),
						pmSessionState=coalesce(@sessionstate, pmSessionState),
						pmState=coalesce(@state, pmState),
						pmIcon=coalesce(@icon, pmIcon),
						pmCurrent='TRUE',
						pmTimeStamp=coalesce(@timestamp, pmTimeStamp)
					WHERE pmID=@pmID
				END
		END
	ELSE IF @datatype = 'OUTLIER'
		BEGIN
			Declare @realpartname nvarchar(25)
			Declare @tmpNum int
			Declare @flip nvarchar(15)
			Declare @network nvarchar(15)
			Declare @envOU int
			
			set @flip = reverse(@ipaddr)
			set @network = reverse(SUBSTRING(@flip, (charindex('.',@flip,0)+1), (len(@flip) - charindex('.',@flip,0))))

			select @tmpNum = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@partition
			IF @@ROWCOUNT=0
				BEGIN
					select @envOU = md.dID from dbo.mgmtDomains md join dbo.mgmtResources mr on md.dID=mr.resDomain
						where mr.resValue=@network and (md.dName = @partition or md.dAlias = @partition)
					select top 1 @realpartname = mr.resValue from dbo.mgmtResources mr 
					join dbo.mgmtDomains md on mr.resDomain=md.dID
					where mr.resName='LTMPartition' and (md.dID = @envOU)
					--where mr.resName='LTMPartition' and (md.dName = @partition or md.dAlias = @partition)
				END
			ELSE
				BEGIN
					set @realpartname = @partition
				END
				
			select @paID = paID from dbo.NWInventory_LTMPartitions where paEnv=@env and paName=@realpartname
			select @ouID = ouID from dbo.NWInventory_Outliers where ouEnv=@env and ouName=@name and ouIP=@ipaddr and ouPartition=@paID
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.NWInventory_Outliers (ouEnv,ouName,ouPartition,ouIP,ouDescription,ouCurrent,ouTimeStamp) VALUES (@env,@name,@paID,@ipaddr,@description,'TRUE',@timestamp)
				END
			ELSE
				BEGIN
					UPDATE dbo.NWInventory_Outliers SET 
						ouIP=coalesce(@ipaddr, ouIP),
						ouDescription=coalesce(@description,ouDescription),
						ouCurrent='TRUE',
						ouTimeStamp=coalesce(@timestamp, ouTimeStamp)
					WHERE ouID=@ouID
				END
		END

END