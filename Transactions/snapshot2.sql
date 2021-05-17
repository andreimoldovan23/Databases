SET TRANSACTION ISOLATION LEVEL SNAPSHOT
BEGIN TRANSACTION
Select * from Shop where city like 'NYC'
Waitfor delay '00:00:10'
Update Shop set shopDuns = 2000 where city like 'NYC'
COMMIT TRANSACTION