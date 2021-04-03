create procedure InsertTimes(@tableName nvarchar(50), @times int) as
begin
	if @tableName like 'FairTrade'
	begin
		exec InsertFairTrade @times
	end

	else if @tableName like 'Farmer'
	begin
		exec InsertFarmer @times
	end

	else
	begin
		exec InsertCountry @times
	end
end


create procedure DeleteTimes(@tableName nvarchar(50), @position int) as
begin
	if @tableName like 'FairTrade'
	begin
		exec DeleteFairTrade @position
	end

	else if @tableName like 'Farmer'
	begin
		exec DeleteFarmer @position
	end

	else
	begin
		exec DeleteCountry
	end
end


create procedure InsertFairTrade(@times int) as
begin
	while @times > 0
	begin
		insert into FairTrade values ('ABC')
		set @times = @times - 1
	end
end


create procedure InsertFarmer(@times int) as
begin
	declare @init int
	set @init = 5000
	while @times > 0
	begin
		insert into Farmer values (@init, 'ABC', 18, 5)
		set @times = @times - 1
		set @init = @init + 1
	end
end


create procedure InsertCountry(@times int) as
begin
	declare @init int
	set @init = 5000
	while @times > 0
	begin
		declare @initString varchar(50)
		set @initString = cast(@init as varchar(50))
		insert into Country values ('ZZZ', @initString, 1000)
		set @times = @times - 1
		set @init = @init + 1
	end
end


create procedure DeleteFairTrade(@position int) as
begin
	delete from FairTrade
	where session > @position
end


create procedure DeleteFarmer(@position int) as
begin
	declare @socialPosition int
	set @socialPosition = 1
	declare @socialNumber int

	declare getPosition cursor for
	select f.socialSecurity from Farmer f

	open getPosition
	fetch next from getPosition into @socialNumber

	while @socialPosition < @position
	begin
		fetch next from getPosition into @socialNumber
		set @socialPosition = @socialPosition + 1
	end

	close getPosition
	deallocate getPosition

	delete from Farmer
	where socialSecurity > @socialNumber
end


create procedure DeleteCountry as
begin
	delete from Country
	where country like 'ZZZ'
end


create procedure EvalView(@viewName nvarchar(50)) as
begin
	if @viewName like 'GetFarmersSellingInCluj'
	begin
		select * from GetFarmersSellingInCluj
	end

	else if @viewName like 'GetNumberFarmersSellingArabica'
	begin
		select * from GetNumberFarmersSellingArabica
	end

	else if @viewName like 'GetShopsFromCluj'
	begin
		select * from GetShopsFromCluj
	end
end


create procedure RunDataTests(@testRunId int, @testId int, @tableId int) as
begin
	declare @start datetime
	declare @end datetime

	declare @tableName nvarchar(50)
	declare @testName nvarchar(50)
	declare @times int
	declare @position int

	select @tableName = tab.Name from Tables tab
	where tab.TableID = @tableId

	select @testName = t.Name from Tests t
	where t.TestID = @testId

	select @times = ttab.NoOfRows, @position = ttab.Position from TestTables ttab
	where ttab.TableID = @tableId and ttab.TestID = @testId

	if @testName like 'Insert_%'
	begin
		set @start = getdate()
		exec InsertTimes @tableName, @times
		set @end = getdate()
	end

	else if @testName like 'Delete_%'
	begin
		set @start = getdate()
		exec DeleteTimes @tableName, @position
		set @end = getdate()
	end

	insert into TestRunTables values (@testRunId, @tableId, @start, @end)
end


create procedure RunViewTests(@testRunId int) as
begin
	declare @start datetime
	declare @end datetime
	declare @viewId int
	declare @viewName nvarchar(50)

	declare parseViewTest cursor for
	select * from Views

	open parseViewTest
	fetch next from parseViewTest into @viewId, @viewName

	while @@FETCH_STATUS = 0
	begin
		set @start = getdate()
		exec EvalView @viewName
		set @end = getdate()
		insert into TestRunViews values (@testRunId, @viewId, @start, @end)
		fetch next from parseViewTest into @viewId, @viewName
	end

	close parseViewTest
	deallocate parseViewTest
end


create procedure RunAllTests as
begin
	declare @testId int
	declare @tableId int
	declare @viewId int
	declare @testRunId int
	declare @start datetime
	declare @end datetime
	declare @description nvarchar(2000)
	declare @testName varchar(50)
	declare @tableName varchar(50)

	declare parseTests cursor for
	select t.TestID, tab.TableID, t.Name, tab.Name from Tests t
	inner join TestTables ttab on ttab.TestID = t.TestID
	inner join Tables tab on tab.TableID = ttab.TableID

	open parseTests
	fetch next from parseTests into @testId, @tableId, @testName, @tableName

	while @@FETCH_STATUS = 0
	begin
		set @description = 'Running test ' + @testName + ' on table ' + @tableName
		insert into TestRuns values (@description, NULL, NULL)
		select @testRunId = tr.id from
			(select top 1 TestRunId as id from TestRuns
			order by TestRunID desc) as tr

		set @start = getdate()
		exec RunDataTests @testRunId, @testId, @tableId
		exec RunViewTests @testRunId 
		set @end = getdate()

		update TestRuns
		set StartAt = @start, EndAt = @end
		where TestRunID = @testRunId
		
		fetch next from parseTests into @testId, @tableId, @testName, @tableName
	end

	close parseTests
	deallocate parseTests
end


select * from TestRuns
select * from TestRunTables
select * from TestRunViews

select * from Farmer
select * from Country
select * from FairTrade

exec RunAllTests