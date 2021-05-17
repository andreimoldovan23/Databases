alter database CoffeeTrade set allow_snapshot_isolation on

waitfor delay '00:00:10'
BEGIN TRANSACTION
UPDATE Shop SET shopDuns = 1000 WHERE city like 'NYC';
waitfor delay '00:00:10'
COMMIT TRAN

alter database CoffeeTrade set allow_snapshot_isolation off


UPDATE Shop SET shopDuns = 20 WHERE city like 'NYC';

select * from Shop
