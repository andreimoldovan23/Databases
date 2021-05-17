set transaction isolation level repeatable read
begin transaction
select * from shop
waitfor delay '00:00:15'
select * from shop
commit transaction

set transaction isolation level serializable
begin transaction
select * from shop
waitfor delay '00:00:15'
select * from shop
commit transaction