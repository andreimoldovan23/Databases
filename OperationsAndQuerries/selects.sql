select * from FairTrade

select * from Farmer

select * from Country

select * from Farm

select * From Farm f
inner join OwnsFarm ownf on ownf.farmDunsNumber = f.dunsNumber
inner join Farmer fmr on fmr.socialSecurity = ownf.farmerSocialSecurity

select * from Harvest

select * from Shop

select * from Harvest h
inner join ShopBuys sb on sb.harvestDuns = h.farmDunsNumber and sb.harvestLot = h.lotNumber
inner join Shop s on s.id = sb.shopId

select * from SpecialtyRoast

select * from Beverage

select * from Transactions

select * from Transactions t
inner join BeverageTransaction bt on bt.idTransaction = t.idTrans
inner join Beverage b on b.name = bt.beverageName and b.roastName = bt.beverageRoast