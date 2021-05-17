create or alter procedure ValidateShopData @id INT, @city VARCHAR(50), @name VARCHAR(50), @shopDuns INT AS
BEGIN

INSERT INTO LogTable(operation, tableName, operationDate) values ('VALIDATE', 'Shop', GETDATE());
IF (@id < 1)
BEGIN
	RAISERROR('Invalid shop id', 14, 1)
END

IF (len(@city) <= 3)
BEGIN
	RAISERROR('Invalid city name for shop', 14, 1)
END

IF (len(@name) <= 3)
BEGIN
	RAISERROR('Invalid shop name', 14, 1)
END

IF (@shopDuns < 1)
BEGIN
	RAISERROR('Invalid shop duns number', 14, 1)
END

END


create or alter procedure ValidateHarvestData @lotNumber INT, @season VARCHAR(50), @variety VARCHAR(50), @farmDunsNumber INT AS
BEGIN

INSERT INTO LogTable(operation, tableName, operationDate) values ('VALIDATE', 'Harvest', GETDATE());
IF (@lotNumber < 1)
BEGIN
	RAISERROR('Invalid harvest lot number', 14, 1)
END

IF (len(@season) <= 3 OR @season not in ('SPRING', 'SUMMER', 'FALL', 'AUTUMN', 'WINTER'))
BEGIN
	RAISERROR('Invalid harvest season', 14, 1)
END

IF (len(@variety) <= 3)
BEGIN
	RAISERROR('Invalid harvest variety', 14, 1)
END

IF (@farmDunsNumber not in (select dunsNumber from Farm))
BEGIN
	RAISERROR('Invalid farm duns number', 14, 1)
END

END