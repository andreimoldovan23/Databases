begin transaction
update harvest set season = 'WINTER' where variety like 'honey'
waitfor delay '00:00:10'
update shop set shopDuns = 20 where city like 'NYC'
commit transaction

set deadlock_priority high
begin transaction
update harvest set season = 'WINTER' where variety like 'honey'
waitfor delay '00:00:10'
update shop set shopDuns = 20 where city like 'NYC'
commit transaction