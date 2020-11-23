use CoffeeTrade
go


--modifies column type--
create procedure ModifyColumnVarcharExtended as
begin
	print N'Modifying column to varchar(100)'
	alter table FairTrade
	alter column area varchar(100)
end


--removes a column--
create procedure RemoveCountryAltitude as
begin
	print N'Removing the altitude column of Country table'
	alter table Country
	drop column altitude
end


--removes a default constraint--
create procedure RemoveAgeConstraintFarmer as
begin
	print N'Removing the default age constraint from Farmer table'
	alter table Farmer
	drop constraint defaultFarmerAge
end


--removes a primary key--
create procedure RemovePrimaryBeverageTransactions as
begin
	print N'Removing the primary key from BeverageTransaction table'
	alter table BeverageTransaction
	drop constraint Pk_BeverageTransaction
end


--removes a foreign key--
create procedure RemoveForeignFarmer as
begin
	print N'Removing the foreign key from Farmer table'
	alter table Farmer
	drop constraint FK_Farmer_ftSession
end


--adds a candidate key--
create procedure AddCandidateFairTrade as
begin
	print N'Add candidate key to FairTrade table'
	alter table FairTrade
	add constraint Candidate_FairTrade unique(area)
end


--removes a table--
create procedure RemoveVersioningLog as
begin
	print N'Remove the VersioningLog table'
	drop table VersioningLog
end


--procedure that changes the version forward--
create procedure doProc(@current int, @new int) as
begin
	declare @format nvarchar(50)
	set @format = N'Changing from version ' + cast(@current as nvarchar(5)) + N' to ' + cast(@new as nvarchar(5))
	print @format

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
