
CREATE PROCedure [dbo].[GetServers]
@domain nvarchar(25)='ALL',
@type nvarchar(10)=''
as

declare @filter nvarchar(255)
declare @decomfilter nvarchar(255) = ' si.site not like ''%DECOM%'''
declare @tmpADdomain nvarchar(25)
declare @ADdomain nvarchar(50)
declare @query nvarchar(max)
if @domain='ALL' 
	begin
		set @ADdomain='' 
	end
else
	begin 
		set @tmpADdomain = dbo.GetSvcDomByRef(@domain)
		set @ADdomain = ' and si.site = ''' + @tmpADdomain + ''''
	end

set @filter = (select mr.resValue from dbo.mgmtDomains md join dbo.mgmtResources mr on md.dID=mr.resDomain where md.dAlias=@domain and mr.resName = 'ServerNameFilter' and mr.resValue is not null)
if COALESCE(@filter, '') = '' BEGIN set @filter = '' END else BEGIN set @filter = ' ' + @filter END

if @type=''
begin
	set @query = 'select rtrim(si.srvname) from dbo.ServerInventory si JOIN dbo.ServerInventory_Network nw ON si.srvID=nw.srvID join dbo.ServerTypes st on st.tType=si.type where ' + @decomfilter + @ADdomain + @filter + ' order by si.srvname'
	exec (@query)
end
else if @type='iis' 
begin
	set @query = 'select rtrim(si.srvname) from dbo.serverinventory si JOIN dbo.ServerInventory_Network nw ON si.srvID=nw.srvID join dbo.ServerInventory_Services sis on si.srvid=sis.srvID where sis.wwwsvc <> '''' and ' + @decomfilter + @ADdomain + @filter + ' order by si.srvname'
	exec (@query)
end
else if @type='dsm' 
begin
	set @query = 'Select distinct rtrim(si.srvname) as svr from dbo.services s join dbo.ServerTypes st on st.tID=s.srvType join dbo.ServerInventory si on si.type = st.tType join dbo.WinServiceRepo WSR on s.svcID = WSR.svcID where ' + @decomfilter + @ADdomain + @filter + ' and WSR.svcGroup like ''%Monitored%'' order by svr'
	exec (@query)
end
else if @type='tasks' 
begin
	set @query = 'select rtrim(si.srvname) from dbo.serverinventory si JOIN dbo.ServerInventory_Network nw ON si.srvID=nw.srvID join dbo.ServerInventory_OS os on si.srvid=os.srvID where os.tasks = ''TRUE'' and ' + @decomfilter + @ADdomain + @filter + ' order by si.srvname'
	exec (@query)
end
else if @type='msmq' 
begin
	set @query = 'select srvName, site from dbo.ServerInventory si join dbo.ServerInventory_Services sis on si.srvid=sis.srvid join dbo.mgmtDomains md on si.site = md.dName where ' + @decomfilter + @ADdomain + @filter + ' and (si.type like ''%BSL%'' or si.type like ''%SSAPP%'') order by si.srvname'
	exec (@query)
end
else if @type='blaster' 
begin
	set @query = 'select type, rtrim(si.srvname), srvinactive from dbo.ServerInventory si JOIN dbo.ServerInventory_Network nw ON si.srvID=nw.srvID join dbo.ServerTypes st on st.tType=si.type where ' + @decomfilter + @ADdomain + @filter + ' order by si.srvname'
	exec (@query)
end
else 
begin
	set @query = 'select rtrim(si.srvname) from dbo.ServerInventory si JOIN dbo.ServerInventory_Network nw ON si.srvID=nw.srvID join dbo.ServerTypes st on st.tType=si.type where ' + @decomfilter + @ADdomain + @filter + ' and si.type = ''' + @type + ''' order by si.srvname'
	exec (@query)
end