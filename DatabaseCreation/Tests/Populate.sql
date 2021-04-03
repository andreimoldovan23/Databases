create view GetShopsFromCluj as
select s.name from Shop s
where s.city like 'Cluj'


create view GetFarmersSellingInCluj as
select f.name, fa.countryName from Farmer f
inner join OwnsFarm o on o.farmerSocialSecurity = f.socialSecurity
inner join Farm fa on fa.dunsNumber = o.farmDunsNumber
where fa.dunsNumber in
	(select h.farmDunsNumber from Harvest h
	inner join ShopBuys sb on sb.harvestLot = h.lotNumber and sb.harvestDuns = h.farmDunsNumber
	inner join Shop s on s.id = sb.shopId
	where s.city like 'Cluj')


create view GetNumberFarmersSellingArabica as
select fa.countryName, count(fa.countryName) as Number from Farm fa
inner join OwnsFarm o on fa.dunsNumber = o.farmDunsNumber
inner join Farmer f on f.socialSecurity = o.farmerSocialSecurity
group by fa.countryName
having fa.countryName in
	(select countryName from Farm f
	inner join Harvest h on h.farmDunsNumber = f.dunsNumber
	where h.variety like 'arabica')


insert into Tables (name) values ('FairTrade'), ('Farmer'), ('Country')
insert into Views (name) values ('GetShopsFromCluj'), ('GetFarmersSellingInCluj'), ('GetNumberFarmersSellingArabica')
insert into Tests (name) values ('Insert100'), ('Insert1000'), ('Insert10000'), ('Delete100'), ('Delete1000'), ('Delete10000'), ('EvalViews')


insert into TestViews (TestID, ViewID) values (7, 1), (7, 2), (7, 3)
insert into TestTables (TestID, TableID, NoOfRows, Position) values
	(1, 8, 100, 5), (1, 9, 100, 9), (1, 10, 100, 15), 
	(4, 8, 100, 5), (4, 9, 100, 9), (4, 10, 100, 15),
	(2, 8, 1000, 5), (2, 9, 1000, 9), (2, 10, 1000, 15),
	(5, 8, 1000, 5), (5, 9, 1000, 9), (5, 10, 1000, 15)
