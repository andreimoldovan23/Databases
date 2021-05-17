insert into shop (id, city, name, shopDuns) values (100, 'Tokyo', 'Geisha', 100)
begin transaction
waitfor delay '00:00:10'
update shop set shopDuns = 1000 where city like 'Tokyo'
commit transaction

delete from shop where city like 'Tokyo'