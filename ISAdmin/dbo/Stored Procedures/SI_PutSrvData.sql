
-- =============================================
-- Author:		Nick Childers
-- Create date: 10/7/2015
-- Modify date: 12/1/2015 (added conditional inserts for subtables)
-- Modify date: 1/20/2016 (added SI_OS.tasks)
-- Modify date: 7/6/2016 (null-default parameters for passing by name instead of order)
-- Modify date: 4/10/2017 (added isdbsync which skips network update)
-- Modify date: 7/20/2017 (added sw.chefver and sw.octover)
-- Modify date: 9/26/2017 (added si.jSource and si.BuildStatus)
-- Description:	Accepts input from ServerInventory Powershell, inserts/updates records as needed
-- =============================================
CREATE PROCEDURE [dbo].[SI_PutSrvData]
	@site nvarchar(50),
	@srvname nvarchar(15),
	@type nvarchar(10) = NULL,
	@adpath nvarchar(255) = NULL,
	@maintwindow nvarchar(255) = NULL,
	@adnotes nvarchar(200) = NULL,
	@online nvarchar(50) = NULL,
	@lastseen nvarchar(50) = NULL,
	@jsource nvarchar(25) = NULL,
	@buildstatus nvarchar(50) = NULL,
	@ipaddr nvarchar(50) = NULL,
	@extraipaddr nvarchar(50) = NULL,
	@gateway nvarchar(50) = NULL,
	@macaddr nvarchar(50) = NULL,
	@dns1 nvarchar(50) = NULL,
	@dns2 nvarchar(50) = NULL,
	@cputype nvarchar(255) = NULL,
	@cpucount nvarchar(25) = NULL,
	@cpuspeed nvarchar(50) = NULL,
	@ram nvarchar(50) = NULL,
	@serialnumber nvarchar(50) = NULL,
	@osversion nvarchar(255) = NULL,
	@servicepack nvarchar(50) = NULL,
	@installdate nvarchar(50) = NULL,
	@lastboot nvarchar(50) = NULL,
	@oslicensed nvarchar(25) = NULL,
	@osarch nvarchar(10) = NULL,
	@ieversion nvarchar(50) = NULL,
	@vmtools nvarchar(50) = NULL,
	@dotnet nvarchar(50) = NULL,
	@pshell nvarchar(50) = NULL,
	@chefver nvarchar(15) = NULL,
	@octover nvarchar(15) = NULL,
	@tasks nvarchar(10) = NULL,
	@drvcused decimal(6, 1) = NULL,
	@drvctotal decimal(6, 1) = NULL,
	@drvdused decimal(6, 1) = NULL,
	@drvdtotal decimal(6, 1) = NULL,
	@drvlocal nvarchar(50) = NULL,
	@sccmsvc nvarchar(255) = NULL,
	@wwwsvc nvarchar(255) = NULL,
	@scomsvc nvarchar(255) = NULL,
	@scomapmsvc nvarchar(100) = NULL,
	@appdsvc nvarchar(25) = NULL,
	@filebeatsvc nvarchar(25) = NULL,
	@winlogbeatsvc nvarchar(25) = NULL,
	@snmpsvc nvarchar(25) = NULL,
	@username nvarchar(255) = NULL,
	@appdagentver nvarchar(25)  = NULL,
	@appdcontroller nvarchar(25)  = NULL,
	@appdport nvarchar(5)  = NULL,
	@appdssl nvarchar(5)  = NULL,
	@appdtls12 nvarchar(5)  = NULL,
	@appdperfct nvarchar(3)  = NULL,
	@appdapp nvarchar(50)  = NULL,
	@appduser nvarchar(25)  = NULL,
	@appdkey nvarchar(50)  = NULL,
	@appdiisappct nvarchar(2)  = NULL,
	@appdwinappct nvarchar(2)  = NULL,
	@error nvarchar(255) = '',
	@dsmwarn nvarchar(10) = NULL,
	@srvinactive int = 0,
	@isdbsync nvarchar(5) = NULL
AS
BEGIN
	declare @srvid int
	SELECT @srvid = srvid FROM dbo.ServerInventory
	WHERE site = @site AND srvname = @srvname
	IF NULLIF(@srvid, '') IS NULL
		BEGIN
			select @srvid = si.srvid from dbo.ServerInventory si
				join dbo.ServerInventory_Network nw on si.srvID=nw.srvID
			where nw.macaddr=@macaddr
		END

	UPDATE dbo.ServerInventory SET 
		site=coalesce(@site, site),
		srvname=coalesce(@srvname, srvname),
		type=coalesce(@type, type),
		adpath=coalesce(@adpath, adpath),
		online=coalesce(@online, online),
		lastseen=coalesce(@lastseen, lastseen),
		maintwindow=coalesce(@maintwindow, maintwindow),
		username=coalesce(@username, username),
		jsource=coalesce(@jsource, jsource),
		buildstatus=coalesce(@buildstatus, buildstatus),
		adnotes=coalesce(@adnotes, adnotes),
		error=coalesce(@error, error),
		dsmwarn=coalesce(@dsmwarn, dsmwarn)
	WHERE srvID=@srvid
	IF @@ROWCOUNT=0
		BEGIN
			INSERT INTO dbo.ServerInventory (site,srvname,type,adpath,online,lastseen,maintwindow,username,jsource,buildstatus,adnotes,error,dsmwarn,srvinactive) VALUES (@site,@srvname,@type,@adpath,@online,@lastseen,@maintwindow,@username,@jsource,@buildstatus,@adnotes,@error,@dsmwarn,@srvinactive)
			set @srvid = (SELECT SCOPE_IDENTITY())

			INSERT INTO dbo.ServerInventory_Network (srvid,ipaddr,extraipaddr,gateway,macaddr,dns1,dns2) VALUES (@srvid,@ipaddr,@extraipaddr,@gateway,@macaddr,@dns1,@dns2)
			INSERT INTO dbo.ServerInventory_Hardware (srvid,cputype,cpuspeed,cpucount,ram,drvlocal,serialnumber) VALUES (@srvid,@cputype,@cpuspeed,@cpucount,@ram,@drvlocal,@serialnumber)
			INSERT INTO dbo.ServerInventory_HWStats (srvid,drvcused,drvctotal,drvdused,drvdtotal) VALUES (@srvid,@drvcused,@drvctotal,@drvdused,@drvdtotal)
			INSERT INTO dbo.ServerInventory_OS (srvid,osversion,servicepack,osarch,installdate,lastboot,oslicensed,tasks) VALUES (@srvid,@osversion,@servicepack,@osarch,@installdate,@lastboot,@oslicensed,@tasks)
			INSERT INTO dbo.ServerInventory_Software (srvid,ieversion,vmtools,dotnet,pshell,chefver,octover) VALUES (@srvid,@ieversion,@vmtools,@dotnet,@pshell,@chefver,@octover)
			INSERT INTO dbo.ServerInventory_Services (srvid,sccmsvc,wwwsvc,scomsvc,appdsvc,scomapmsvc,filebeatsvc,winlogbeatsvc,snmpsvc) VALUES (@srvid,@sccmsvc,@wwwsvc,@scomsvc,@appdsvc,@scomapmsvc,@filebeatsvc,@winlogbeatsvc,@snmpsvc)
		END
	ELSE
		BEGIN
			IF NULLIF(@isdbsync, '') = 'TRUE'
				BEGIN
					SELECT srvID from dbo.ServerInventory_Network where srvid=@srvid
				END
			ELSE
				BEGIN
					UPDATE dbo.ServerInventory_Network SET 
						ipaddr=coalesce(@ipaddr, ipaddr),
						extraipaddr=coalesce(@extraipaddr, extraipaddr),
						gateway=coalesce(@gateway, gateway),
						macaddr=coalesce(@macaddr, macaddr),
						dns1=coalesce(@dns1, dns1),
						dns2=coalesce(@dns2, dns2)
					WHERE srvID=@srvid
				END
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_Network (srvid,ipaddr,extraipaddr,gateway,macaddr,dns1,dns2) VALUES (@srvid,@ipaddr,@extraipaddr,@gateway,@macaddr,@dns1,@dns2)
				END

			UPDATE dbo.ServerInventory_Hardware SET 
				cputype=coalesce(@cputype, cputype),
				cpuspeed=coalesce(@cpuspeed, cpuspeed),
				cpucount=coalesce(@cpucount, cpucount),
				ram=coalesce(@ram, ram),
				drvlocal=coalesce(@drvlocal, drvlocal),
				serialnumber=coalesce(@serialnumber, serialnumber)
			WHERE srvID=@srvid
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_Hardware (srvid,cputype,cpuspeed,cpucount,ram,drvlocal,serialnumber) VALUES (@srvid,@cputype,@cpuspeed,@cpucount,@ram,@drvlocal,@serialnumber)
				END

			UPDATE dbo.ServerInventory_HWStats SET 
				drvcused=coalesce(@drvcused, drvcused),
				drvctotal=coalesce(@drvctotal, drvctotal),
				drvdused=coalesce(@drvdused, drvdused),
				drvdtotal=coalesce(@drvdtotal, drvdtotal)
			WHERE srvID=@srvid
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_HWStats (srvid,drvcused,drvctotal,drvdused,drvdtotal) VALUES (@srvid,@drvcused,@drvctotal,@drvdused,@drvdtotal)
				END

			UPDATE dbo.ServerInventory_OS SET 
				osversion=coalesce(@osversion, osversion),
				servicepack=coalesce(@servicepack, servicepack),
				osarch=coalesce(@osarch, osarch),
				installdate=coalesce(@installdate, installdate),
				lastboot=coalesce(@lastboot, lastboot),
				oslicensed=coalesce(@oslicensed, oslicensed),
				tasks=coalesce(@tasks, tasks)
			WHERE srvID=@srvid
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_OS (srvid,osversion,servicepack,osarch,installdate,lastboot,oslicensed,tasks) VALUES (@srvid,@osversion,@servicepack,@osarch,@installdate,@lastboot,@oslicensed,@tasks)
				END

			UPDATE dbo.ServerInventory_Software SET 
				ieversion=coalesce(@ieversion, ieversion),
				vmtools=coalesce(@vmtools, vmtools),
				dotnet=coalesce(@dotnet, dotnet),
				pshell=coalesce(@pshell, pshell),
				chefver=coalesce(@chefver, chefver),
				octover=coalesce(@octover, octover)
			WHERE srvID=@srvid
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_Software (srvid,ieversion,vmtools,dotnet,pshell,chefver,octover) VALUES (@srvid,@ieversion,@vmtools,@dotnet,@pshell,@chefver,@octover)
				END

			UPDATE dbo.ServerInventory_Services SET 
				sccmsvc=coalesce(@sccmsvc, sccmsvc),
				wwwsvc=coalesce(@wwwsvc, wwwsvc),
				scomsvc=coalesce(@scomsvc, scomsvc),
				appdsvc=coalesce(@appdsvc, appdsvc),
				scomapmsvc=coalesce(@scomapmsvc, scomapmsvc),
				filebeatsvc=coalesce(@filebeatsvc, filebeatsvc),
				winlogbeatsvc=coalesce(@winlogbeatsvc, winlogbeatsvc),
				snmpsvc=coalesce(@snmpsvc, snmpsvc)
			WHERE srvID=@srvid
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_Services (srvid,sccmsvc,wwwsvc,scomsvc,appdsvc,scomapmsvc,filebeatsvc,winlogbeatsvc) VALUES (@srvid,@sccmsvc,@wwwsvc,@scomsvc,@appdsvc,@scomapmsvc,@filebeatsvc,@winlogbeatsvc)
				END

			UPDATE dbo.ServerInventory_AppD SET 
				appdagentver=coalesce(@appdagentver, appdagentver),
				appdcontroller=coalesce(@appdcontroller, appdcontroller),
				appdport=coalesce(@appdport, appdport),
				appdssl=coalesce(@appdssl, appdssl),
				appdtls12=coalesce(@appdtls12, appdtls12),
				appduser=coalesce(@appduser, appduser),
				appdkey=coalesce(@appdkey, appdkey),
				appdapp=coalesce(@appdapp, appdapp),
				appdperfct=coalesce(@appdperfct, appdperfct),
				appdiisappct=coalesce(@appdiisappct, appdiisappct),
				appdwinappct=coalesce(@appdwinappct, appdwinappct)
			WHERE srvID=@srvid
			IF @@ROWCOUNT=0
				BEGIN
					INSERT INTO dbo.ServerInventory_AppD (srvid,appdagentver,appdcontroller,appdport,appdssl,appdtls12,appduser,appdkey,appdapp,appdperfct,appdiisappct,appdwinappct) VALUES (@srvid,@appdagentver,@appdcontroller,@appdport,@appdssl,@appdtls12,@appduser,@appdkey,@appdapp,@appdperfct,@appdiisappct,@appdwinappct)
				END

		END

END