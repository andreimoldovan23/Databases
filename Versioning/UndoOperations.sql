use CoffeeTrade
go


--modifies a column type--
create procedure ModifyColumnVarcharReduced as
begin
	print N'Modifying column to varchar(50)'
	alter table FairTrade
	alter column area varchar(50)
end


--adds a column--
create procedure AddCountryAltitude as
begin
	print N'Adding altitude column to Country Table'
	alter table Country
	add altitude int
end


--adds a default constraint--
create procedure AddAgeConstraintFarmer as
begin
	print N'Adding default age constraint to Farmer table'
	alter table Farmer
	add constraint defaultFarmerAge default 18 for age
end


--adds a primary key--
create procedure AddPrimaryBeverageTransactions as
begin
	print N'Adding primary key to BeverageTransaction table'
	alter table BeverageTransaction
	add constraint Pk_BeverageTransaction Primary Key(beverageName, beverageRoast, idTransaction)
end


--adds a foreign key--
create procedure AddForeignFarmer as
begin
	print N'Adding foreign key to Farmer table'
	alter table Farmer
	add constraint FK_Farmer_ftSession Foreign Key(ftSession) references FairTrade(session)
end


--removes a candidate key--
create procedure RemoveCandidateFairTrade as
begin
	print N'Removing candidate key from FairTrade table'
	alter table FairTrade
	drop constraint Candidate_FairTrade
end


--removes a table--
create procedure AddVersioningLog as
begin
	print N'Adding VersioningLog'
	create table VersioningLog(
	oldVers int not null,
	oldDate datetime not null,
	newVers int not null,
	newDate datetime not null	
	)
end

--the procedure taking the program to an older version--
create procedure undoProc(@current int, @new int) as
begin
	declare @format nvarchar(50)
	set @format = N'Changing from version ' + cast(@current as nvarchar(5)) + N' to ' + cast(@new as nvarchar(5))
	print @format

	declare @actual int
	set @actual = @current

	while @actual > @new
	begin
		declare @procName varchar(50)
		
		select @procName = undo from VersioningProcedures
		where versNo = @actual

		exec @procName

		set @actual = @actual - 1
	end
end