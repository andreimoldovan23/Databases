use CoffeeTrade
go


--modifies a column type--
create procedure ModifyColumnVarcharReduced as
begin
	alter table FairTrade
	alter column area varchar(50)
end


--adds a column--
create procedure AddCountryAltitude as
begin
	alter table Country
	add altitude int
end


--adds a default constraint--
create procedure AddAgeConstraintFarmer as
begin
	alter table Farmer
	add constraint defaultFarmerAge default 18 for age
end


--adds a primary key--
create procedure AddPrimaryBeverageTransactions as
begin
	alter table BeverageTransaction
	add constraint Pk_BeverageTransaction Primary Key(beverageName, beverageRoast, idTransaction)
end


--adds a foreign key--
create procedure AddForeignFarmer as
begin
	alter table Farmer
	add constraint FK_Farmer_ftSession Foreign Key(ftSession) references FairTrade(session)
end


--removes a candidate key--
create procedure RemoveCandidateFairTrade as
begin
	alter table FairTrade
	drop constraint Candidate_FairTrade
end


--removes a table--
create procedure AddVersioningLog as
begin
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