use CoffeeTrade
go


--modifies column type--
create procedure ModifyColumnVarcharExtended as
begin
	alter table FairTrade
	alter column area varchar(100)
end


--removes a column--
create procedure RemoveCountryAltitude as
begin
	alter table Country
	drop column altitude
end


--removes a default constraint--
create procedure RemoveAgeConstraintFarmer as
begin
	alter table Farmer
	drop constraint defaultFarmerAge
end


--removes a primary key--
create procedure RemovePrimaryBeverageTransactions as
begin
	alter table BeverageTransaction
	drop constraint Pk_BeverageTransaction
end


--removes a foreign key--
create procedure RemoveForeignFarmer as
begin
	alter table Farmer
	drop constraint FK_Farmer_ftSession
end


--adds a candidate key--
create procedure AddCandidateFairTrade as
begin
	alter table FairTrade
	add constraint Candidate_FairTrade unique(area)
end


--removes a table--
create procedure RemoveVersioningLog as
begin
	drop table VersioningLog
end


--procedure that changes the version forward--
create procedure doProc(@current int, @new int) as
begin
	declare @actual int
	set @actual = @current + 1

	while @actual <= @new
	begin
		declare @procName varchar(50)
		
		select @procName = do from VersioningProcedures
		where versNo = @actual

		exec @procName

		set @actual = @actual + 1
	end
end
