--harvest
--shop
--shopBuys

--clustered index scan
select * from Harvest

--clustered index seek
select * from Harvest
where lotNumber > 15

--nonclustered scan
create nonclustered index [HarvestScan] on Harvest(variety)
select variety from Harvest

--nonclustered seek
select variety from Harvest
where variety like 'arabica'

--key lookup
select * from Harvest
with(index = HarvestScan)
where farmDunsNumber > 10


--normal querry
--estimated operator cost = 0.0032875
--estimated subtree cost = 0.0032875
select shopDuns from Shop
where shopDuns = 12

--with nonclustered index
--estimated operator cost = 0.0032831
--estimated subtree cost = 0.0032831
create nonclustered index [IdxShopDuns] on Shop(shopDuns)
drop index IdxShopDuns on Shop
select shopDuns from Shop
where shopDuns = 12

--assessing view performance
create view GetVarietiesSoldInCluj as 
select h.variety from Harvest h
inner join ShopBuys sb on sb.harvestLot = h.lotNumber and sb.harvestDuns = h.farmDunsNumber
inner join Shop s on s.id = sb.shopId
where s.city like 'Cluj'

create nonclustered index [IdxShopCity] on Shop(city)
drop index IdxShopCity on Shop