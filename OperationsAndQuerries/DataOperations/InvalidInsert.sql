--FairTrade
insert into FairTrade (session, area) values (7, 'SE-Asia')
insert into FairTrade values (7, 'SE-Asia')
insert into FairTrade values ('SE')

--Farmer
insert into Farmer (socialSecurity, name, age, ftSession) values (200, 'Ricardo', 19, 4)
insert into Farmer (socialSecurity, name, age, ftSession) values (1200, 'RD', 19, 4)
insert into Farmer (socialSecurity, name, age, ftSession) values (1200, 'Ricardo', 19, 4)
insert into Farmer (socialSecurity, ftSession) values (1200, 4)

--Farm
insert into Farm(dunsNumber, region, country, altitude) values (1, 'SE', 'MD', 1400)
insert into Farm(dunsNumber) values (4)
insert into Farm(dunsNumber, country) values (4, 'MD')

--OwnsFarm
insert into OwnsFarm(farmerSocialSecurity, farmDunsNumber) values (4, 2)

--Harvest
insert into Harvest(farmDunsNumber, lotNumber, season, variety) values (3, 4, 'SPRING', 'ARABICA')
insert into Harvest(farmDunsNumber, season, variety) values (5, 'SPRING', 'ARABICA')
insert into Harvest(farmDunsNumber, variety) values (4, 'AB')

--Shop
insert into Shop(id, city, name) values (0, 'Chicago', 'BeardRoasters')
insert into Shop(city, name) values ('Chicago', 'BeardRoasters')
insert into Shop(id) values (4)
insert into Shop(id, city, name) values (4, 'CJ', 'Meron')

--ShopBuys
insert into ShopBuys(shopId, harvestDuns, harvestLot) values (4, 3, 2)

--SpecialtyRoast
insert into SpecialtyRoast(name, roastingGrade, price, shopId) values ('MD', 3, 4, 4)
insert into SpecialtyRoast(name, roastingGrade, price, shopId) values ('MDD', 8, 4, 4)
insert into SpecialtyRoast(name, roastingGrade, price, shopId) values ('MDD', 3, 2000, 4)
insert into SpecialtyRoast(name, roastingGrade, price, shopId) values ('MDD', 3, 4, 4)

--Beverage
insert into Beverage(name, roastName, price, milkUnits) values ('this', 'arabica', 4000, 2)
insert into Beverage(name, roastName, price, milkUnits) values ('this', 'arabica', 4, 100)
insert into Beverage(name, roastName, price, milkUnits) values ('this', 'arabica', 4, 2)

--Transactions
insert into Transactions(idTrans) values (4)

--BeverageTransactions
insert into BeverageTransaction(idTransaction, beverageName, beverageRoast) values (4, 4, 4)