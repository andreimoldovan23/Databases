begin transaction
waitfor delay '00:00:10'
insert into shop (id, city, name, shopDuns) values (100, 'Tokyo', 'Geisha', 100)
commit transaction

delete from shop where city like 'Tokyo'