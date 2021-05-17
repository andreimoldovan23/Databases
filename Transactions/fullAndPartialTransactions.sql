--validates shop data, performs logging, inserts into the Shop table
create or alter procedure InsertIntoShop @city VARCHAR(50), @name VARCHAR(50), @shopDuns INT, @newId INT OUTPUT as
BEGIN

set nocount on;
declare @id INT;
set @id = 0;

select @id = max(id) from Shop;

set @id = @id + 1;
set @newId = @id;

BEGIN TRY
	EXEC ValidateShopData @id, @city, @name, @shopDuns;

	INSERT INTO Shop (id, city, name, shopDuns) values (@id, @city, @name, @shopDuns);
	INSERT INTO LogTable (operation, tableName, operationDate) values ('INSERT', 'Shop', GETDATE());
END TRY
BEGIN CATCH
	declare @message VARCHAR(50) = ERROR_MESSAGE();
	declare @severity INT = ERROR_SEVERITY();
	declare @state INT = ERROR_STATE();
	RAISERROR(@message, @severity, @state);
END CATCH

RETURN
END

--validates Harvest data, performs logging, inserts into Harvest table
create or alter procedure InsertIntoHarvest @season VARCHAR(50), @variety VARCHAR(50), @farmDunsNumber INT, @newLotNumber INT OUTPUT as
BEGIN

set nocount on;
declare @lotNumber INT;
set @lotNumber = 0;

select @lotNumber = max(lotNumber) from Harvest;
set @lotNumber = @lotNumber + 1;
set @newLotNumber = @lotNumber;

BEGIN TRY
	EXEC ValidateHarvestData @lotNumber, @season, @variety, @farmDunsNumber;

	INSERT INTO Harvest (lotNumber, season, variety, farmDunsNumber) values (@lotNumber, @season, @variety, @farmDunsNumber);
	INSERT INTO LogTable (operation, tableName, operationDate) values ('INSERT', 'Harvest', GETDATE());
END TRY
BEGIN CATCH
	declare @message VARCHAR(50) = ERROR_MESSAGE();
	declare @severity INT = ERROR_SEVERITY();
	declare @state INT = ERROR_STATE();
	RAISERROR(@message, @severity, @state);
END CATCH
RETURN
END

--performs logging, inserts into ShopBuys table
create or alter procedure InsertIntoShopBuys @shopId INT, @harvestLot INT, @harvestDuns INT as
BEGIN
	set nocount on;
	INSERT INTO LogTable (operation, tableName, operationDate) values ('INSERT', 'ShopBuys', GETDATE());

	INSERT INTO ShopBuys (shopId, harvestLot, harvestDuns) values (@shopId, @harvestLot, @harvestDuns);
END

--performs an insert into all 3 m:n tables in one transaction, rollbacks if failure
create or alter procedure InsertShopHarvest @city VARCHAR(50), @name VARCHAR(50), @shopDuns INT, @season VARCHAR(50), @variety VARCHAR(50), @farmDunsNumber INT as
BEGIN
	set nocount on;
	declare @newShopId INT = 0;
	declare @newHarvestLot INT = 0;
	BEGIN TRANSACTION
	BEGIN TRY
			EXEC InsertIntoShop @city, @name, @shopDuns, @newId = @newShopId OUTPUT;
			EXEC InsertIntoHarvest @season, @variety, @farmDunsNumber, @newLotNumber = @newHarvestLot OUTPUT;
			EXEC InsertIntoShopBuys @newShopId, @newHarvestLot, @farmDunsNumber;
			COMMIT TRANSACTION
			PRINT 'TRANSACTION COMMITED'
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'TRANSACTION ROLLBACKED'
			declare @message VARCHAR(50) = ERROR_MESSAGE();
			INSERT INTO LogTable (operation, tableName, operationDate) VALUES (@message, 'Tables', GETDATE());
	END CATCH
END


--performs an insert into all 3 m:n tables in 3 transactions, rollbacks if failure
create or alter procedure InsertShopHarvestPartial @city VARCHAR(50), @name VARCHAR(50), @shopDuns INT, @season VARCHAR(50), @variety VARCHAR(50), @farmDunsNumber INT as
BEGIN
	set nocount on;
	declare @newShopId INT = 0;
	declare @newHarvestLot INT = 0;
	declare @message VARCHAR(50);
	
	BEGIN TRANSACTION
	BEGIN TRY
			EXEC InsertIntoShop @city, @name, @shopDuns, @newId = @newShopId OUTPUT;
			COMMIT TRANSACTION
			PRINT 'Shop TRANSACTION COMMITED'
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'Shop TRANSACTION ROLLBACKED'
			set @message = ERROR_MESSAGE();
			INSERT INTO LogTable (operation, tableName, operationDate) VALUES (@message, 'Shop', GETDATE());
	END CATCH

	BEGIN TRANSACTION
	BEGIN TRY
			EXEC InsertIntoHarvest @season, @variety, @farmDunsNumber, @newLotNumber = @newHarvestLot OUTPUT;
			COMMIT TRANSACTION
			PRINT 'Harvest TRANSACTION COMMITED'
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'Harvest TRANSACTION ROLLBACKED'
			set @message = ERROR_MESSAGE();
			INSERT INTO LogTable (operation, tableName, operationDate) VALUES (@message, 'Harvest', GETDATE());
	END CATCH

	BEGIN TRANSACTION
	BEGIN TRY
			EXEC InsertIntoShopBuys @newShopId, @newHarvestLot, @farmDunsNumber;
			COMMIT TRANSACTION
			PRINT 'ShopBuys TRANSACTION COMMITED'
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'ShopBuys TRANSACTION ROLLBACKED'
			set @message = ERROR_MESSAGE();
			INSERT INTO LogTable (operation, tableName, operationDate) VALUES (@message, 'Harvest', GETDATE());
	END CATCH
END



---show functionality
select * from LogTable

select * from shop

select * from harvest

select s.name, s.city, h.season, h.variety, f.countryName, f.regionName from shop s inner join ShopBuys sb on sb.shopId = s.id
inner join Harvest h on h.lotNumber = sb.harvestLot and h.farmDunsNumber = sb.harvestDuns
inner join Farm f on f.dunsNumber = h.farmDunsNumber

EXEC InsertShopHarvest 'Cluj', 'Meron', 400, 'SUMMER', 'honey', 34
EXEC InsertShopHarvest 'Cluj', 'Meron', 450, 'SUMMER', 'robusta', 120
EXEC InsertShopHarvest 'Cluj', 'Meron', 0, 'WINTER', 'robusta', 34

EXEC InsertShopHarvestPartial 'Cluj', 'Meron', 600, 'SPRING', 'arabica', 24
EXEC InsertShopHarvestPartial 'Cluj', 'Meron', 0, 'WINTER', 'robusta', 24
EXEC InsertShopHarvestPartial 'Cluj', 'Meron', 650, 'WINTER', 'robusta', 120


delete from LogTable
delete from ShopBuys where shopId >= 23
delete from Shop where id >= 23
delete from Harvest where lotNumber >= 25