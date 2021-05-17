begin transaction
update shop set shopDuns = 1000 where city like 'NYC'
waitfor delay '00:00:10'
update harvest set season = 'FALL' where variety like 'honey'
commit transaction



select * from shop
select * from harvest

update harvest set season = 'FALL' where variety like 'honey'
update shop set shopDuns = 20 where city like 'NYC'