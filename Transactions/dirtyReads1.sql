begin transaction
update Shop set shopDuns = 32
where city like 'NYC'
waitfor delay '00:00:10'
rollback transaction