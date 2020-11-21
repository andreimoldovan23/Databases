use CoffeeTrade
go

--if you want to change which procedures correspond to which versions
--or if you want to add more versions and implicitly more procedures
--all you need to do is drop the versioningProceduresTrigger, modify the VersioningProcedures table
--and then add back the trigger

--also, if the number of versions is modified you
--must modify the validation in the ChangeVersion procedure


--version table--
create table Version(
currentVers int not null constraint defaultVersion default 0,
dateModified datetime not null,
constraint checkVersNumber check (currentVers between 0 and 7)
)
insert into Version (dateModified) values (GETDATE())


--log table for changing the version table--
create table VersioningLog(
oldVers int not null,
oldDate datetime not null,
newVers int not null,
newDate datetime not null
)


--table for storing the do and undo procedures--
create table VersioningProcedures(
versNo int,
do varchar(50),
undo varchar(50)
)
insert into VersioningProcedures (versNo, do, undo) values
	(1, 'ModifyColumnVarcharExtended', 'ModifyColumnVarcharReduced'),
	(2, 'RemoveCountryAltitude', 'AddCountryAltitude'),
	(3, 'RemoveAgeConstraintFarmer', 'AddAgeConstraintFarmer'),
	(4, 'RemovePrimaryBeverageTransactions', 'AddPrimaryBeverageTransactions'),
	(5, 'RemoveForeignFarmer', 'AddForeignFarmer'),
	(6, 'AddCandidateFairTrade', 'RemoveCandidateFairTrade'),
	(7, 'RemoveVersioningLog', 'AddVersioningLog')


--trigger on VersioningProcedures so no one is able to modify the values inside--
create trigger versioningProceduresTrigger on VersioningProcedures
instead of insert, delete, update
as
begin
	raiserror(N'You are not allowed to modify VersioningProcedures', 15, 1)
end


--trigger on Version so no one is able to insert or delete values--
create trigger versionTrigger on Version
instead of insert, delete
as
begin
	raiserror(N'You are not allowed to insert or delete values from Version', 15, 1)
end


--trigger on Version so the log is updated on delete--
create trigger logVersion on Version
for update
as
begin
	if OBJECT_ID(N'VersioningLog', N'U') is null
	begin
		raiserror(N'The versioning log does not exist anymore', 10, 1)
		return
	end
	declare @oldVers int
	declare @newVers int
	declare @oldDate datetime
	declare @newDate datetime

	select @oldVers = currentVers from deleted
	select @newVers = currentVers from inserted
	select @oldDate = dateModified from deleted
	select @newDate = dateModified from inserted

	insert into VersioningLog (oldVers, oldDate, newVers, newDate) values
		(@oldVers, @oldDate, @newVers, @newDate)
end


--main procedure for changing version--
create procedure ChangeVersion(@newVers int) as
begin
	set nocount on
	if @newVers is null or @newVers not between 0 and 7
	begin
		raiserror(N'Invalid parameters', 15, 1)
		return
	end

	declare @currentVers int
	select @currentVers = currentVers from Version

	if @newVers = @currentVers
	begin
		raiserror(N'Version %d is already in use', 15, 1, @currentVers)
		return
	end

	if @newVers > @currentVers
	begin
		exec doProc @currentVers, @newVers
	end
	else
	begin
		exec undoProc @currentVers, @newVers
	end

	update Version
	set currentVers = @newVers, dateModified = GETDATE()

	return
end
