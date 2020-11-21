use CoffeeTrade
go

--FairTrade
insert into FairTrade values ('SE-Asia'), ('NE-Africa'), ('CentralAmerica'), ('CentralSouthAmerica'), ('SE-US-Coast')

--Farmer
insert into Farmer (socialSecurity, name, ftSession) values 
	(1004, 'Ricardo Gomez', 3), 
	(1100, 'Ngambe Babam', 2), 
	(1220, 'Yusuf Al-Hazred', 2), 
	(2332, 'Xiao Ming', 1)
insert into	Farmer (socialSecurity, name, age, ftSession) values 
	(2000, 'Bolivar Colombo', 34, 4),
	(3000, 'Miguel Jose', 40, 3),
	(3500, 'Andres Jorge', 42, 3),
	(3250, 'Mark Gomez', 33, 5),
	(3330, 'Alexei Petrov', 34, 5),
	(3232, 'Marco Ritchie', 44, 5),
	(3311, 'Carlos Antonio', 21, 4),
	(2299, 'Pedro Lucas', 22, 4),
	(2988, 'Pablo Julio', 20, 4),
	(1500, 'Bo Mamba', 24, 2),
	(1400, 'Dewi Bayu', 26, 1),
	(1001, 'Sudono Salim', 62, 1)

--Country
insert into Country (country, region) values
	('Honduras', 'Tegucicalpa'),
	('Columbia', 'Montes de Maria'),
	('Brazil', 'Mato Groso'),
	('Salvador', 'Cuscatlan')
insert into Country (country, region, altitude) values
	('Columbia', 'La Libertad', 1800),
	('Nicaragua', 'Granada', 2200),
	('Burundi', 'Bubanza', 2100),
	('Rwanda', 'Gitarama', 1600),
	('Indonesia', 'Sumatra', 1500)

--Farm
insert into Farm (dunsNumber, regionName, countryName) values
	(2, 'Tegucicalpa', 'Honduras'),
	(12, 'Montes de Maria', 'Columbia'),
	(24, 'Mato Groso', 'Brazil'),
	(36, 'Cuscatlan', 'Salvador'),
	(34, 'La Libertad', 'Columbia'),
	(55, 'La Libertad', 'Columbia'),
	(66, 'Granada', 'Nicaragua'),
	(102, 'Bubanza', 'Burundi'),
	(104, 'Gitarama', 'Rwanda'),
	(220, 'Sumatra', 'Indonesia'),
	(260, 'Sumatra', 'Indonesia'),
	(112, 'Sumatra', 'Indonesia')

--OwnsFarm
insert into OwnsFarm (farmerSocialSecurity, farmDunsNumber) values
	(3000, 2),(2000, 12),(3311, 24),(2988, 34),
	(2299, 55),(3500, 66),(1004, 36),(1500, 102),
	(1100, 104),(1001, 220),(1400, 260),(2332, 112)

--Harvest
insert into Harvest (farmDunsNumber, lotNumber, variety) values (12, 1, 'honey'), (24, 15, 'arabica'), (34, 24, 'arabica')
insert into Harvest (farmDunsNumber, lotNumber, season, variety) values (220, 43, 'SUMMER', 'robusta'), (112, 121, 'SUMMER', 'robusta'),
		(260, 67, 'WINTER', 'robusta-arabica')

--Shop
insert into Shop (id, city, name) values (10, 'Chicago', 'BeardRoasters'), (11, 'Cluj', 'Meron'), (20, 'Vienna', 'FritzKaffee'),
		(12, 'NYC', 'MightyOakRoasters'), (15, 'Berlin', 'PrenzlauerKaffee')

--ShopBuys
insert into ShopBuys(shopId, harvestDuns, harvestLot) values (11, 12, 1), (20, 220, 43), (15, 112, 121), (12, 260, 67), (10, 34, 24),
	(10, 24, 15), (11, 24, 15), (11, 34, 24), (15, 260, 67), (20, 12, 1)

--SpecialtyRoast
insert into SpecialtyRoast (name, roastingGrade, shopId) values
	('BlondeRoast', 2, 11),
	('HeavyRoast', 5, 11),
	('MightyOakRoast', 4, 12),
	('BerlinerRoast', 3, 15)
insert into SpecialtyRoast (name, roastingGrade, shopId, price) values
	('AmadeusRoast', 3, 20, 10),
	('StreetRoast', 2, 10, 10),
	('FogRoast', 1, 12, 17)

--Beverage
insert into Beverage (name, roastName) values 
	('GoodMorning', 'BlondeRoast'),
	('Oakley', 'MightyOakRoast'),
	('Thinley', 'FogRoast'),
	('GoodMorning', 'HeavyRoast')
insert into Beverage (name, roastName, price, milkUnits) values
	('GoodLatteMorning', 'BlondeRoast', 7, 2),
	('Violin', 'AmadeusRoast', 10, 3),
	('Basketball', 'StreetRoast', 3, 1),
	('Brandenburg', 'BerlinerRoast', 8, 2),
	('StrongLatteMorning', 'HeavyRoast', 12, 3)

--Transactions
insert into Transactions (idFrom, idTo, idTrans) values
	(12, 100, 10050),
	(15, 100, 10060),
	(24, 100, 10100),
	(7, 9, 8000),
	(9, 7, 8002),
	(7, 100, 8007)
insert into Transactions (idFrom, idTo, idTrans) values (15, 16, 9000)

--BeverageTransactions
insert into BeverageTransaction (idTransaction, beverageName, beverageRoast) values
	(10050, 'GoodLatteMorning', 'BlondeRoast'),
	(10060, 'GoodMorning', 'BlondeRoast'),
	(10100, 'StrongLatteMorning', 'HeavyRoast'),
	(8000, 'Violin', 'AmadeusRoast'),
	(8002, 'Brandenburg', 'BerlinerRoast'),
	(8007, 'GoodMorning', 'HeavyRoast')