--union--
--select all farms from columbia or with an altitude higher than 1800 metres
select f.dunsNumber, f.countryName, f.regionName, c.altitude from Farm f
inner join Country c on f.countryName = c.country and f.regionName = c.region
where c.altitude > 1500 or f.countryName like 'Columbia'

--select all harvest from summer or from farms in Columbia
select * from Harvest
where season like 'S%'
union
select * from Harvest
where farmDunsNumber in
(select dunsNumber from Farm
where countryName like 'Columbia')


--intersect--
--select all beverages with a price greater than 5 and using roasts
--from shops in Cluj
select * from Beverage
where price > 5
intersect
select * from Beverage
where roastName in
	(select name from SpecialtyRoast
	 where shopId in 
		(select id from Shop
		 where city like 'Cluj'))

--select all harvests of arabica from columbian farms
select * from Harvest
where variety like 'arabica' and farmDunsNumber in
(select dunsNumber from Farm
where countryName like 'Columbia')


--except--
--select all harvests of arabica except those produced in the fall
select * from Harvest
where variety like 'arabica'
except
select * from Harvest
where season like 'FALL'

--select all farms from indonesia except those
--not owned by farmers
select * from Farm
where countryName like 'Indonesia' and dunsNumber not in
(select farmDunsNumber from OwnsFarm)


--joins
--select first 3 farmers and their farms who have sold harvests in Cluj
select top 3 f.name, fa.countryName, city.lotNumber, city.variety, city.city from Farmer f
inner join OwnsFarm o on o.farmerSocialSecurity = f.socialSecurity
inner join Farm fa on fa.dunsNumber = o.farmDunsNumber
inner join
	(select s.city, h.lotNumber, h.farmDunsNumber, h.variety from Shop s
	inner join ShopBuys sb on sb.shopId = s.id
	inner join Harvest h on h.farmDunsNumber = sb.harvestDuns and h.lotNumber = sb.harvestLot) city 
		on city.farmDunsNumber = fa.dunsNumber
where city.city like 'Cluj'

--select all farmers registred regardless if they already own farms
--or not
select * from Farmer f
left join OwnsFarm o on o.farmerSocialSecurity = f.socialSecurity

--select first 3 transactions regardless if they were for beverages or not
select top 3 b.name, b.roastName, t.idTrans from Beverage b
right join BeverageTransaction bt on bt.beverageName = b.name and bt.beverageRoast = b.roastName
full join Transactions t on t.idTrans = bt.idTransaction


--exists
--select all transactions if there exists at least one for buying a beverage
select * from Transactions
where exists (select * from BeverageTransaction)
order by idFrom

--select all specialty roasts if at least one is used by a beverage
select * from SpecialtyRoast
where exists 
	(select * from Beverage b
	inner join SpecialtyRoast sr on sr.name = b.roastName)
order By price


--from subquerry
--select all shops with an id smaller than 15 and whose name has at least 5 charachters
select * from
	(select name, city from Shop
	where id < 15) s
where s.name like '_____%'

--select all farmers partaking in a program with an even number
select f.name from 
	(select session from FairTrade
	where session % 2 = 0) ft
inner join Farmer f on f.ftSession = ft.session


--aggregate operators
--count all beverages with the same name
select name, count(name) as Number from Beverage
group by name
having count(name) > 1

--count all harvests coming with the same variety
select variety, count(variety) as Number from Harvest
group by variety
having count(variety) > 1

--display the average price of beverages of the same roast name
--having the average greater than the overall average
select roastName, avg(price) as Price from Beverage
group by roastName
having avg(price) > 
	(select avg(price) from Beverage)

--display the average roast grade of roast specialities of the same price
--having the average greater than the overall average
select price, avg(roastingGrade) as RoastGrade from SpecialtyRoast
group by price
having avg(roastingGrade) >
	(select avg(roastingGrade) from SpecialtyRoast)


--any and all
--display the beverages with the price smaller than
--the minimum price of beverages with more than 2 milk units
select * from Beverage
where price < ALL 
	(select price from Beverage
	where milkUnits > 2)

select * from Beverage
where price not in 
	(select price from Beverage
	where milkUnits > 2)

--display the farmers with a social security number
--smaller than the minimum age*100 number
select * from Farmer
where socialSecurity < ALL
	(select age*100 from Farmer)

select * from Farmer
where socialSecurity < (select min(age*100) from Farmer)

--display the farms whose altitude is smaller
--than the maximum farm altitude from columbia
select * from Farm f
inner join Country c on c.country = f.countryName and c.region = f.regionName
where c.altitude < ANY
	(select altitude from Country
	where country like 'Columbia')

select * from Farm f
inner join Country c on c.country = f.countryName and c.region = f.regionName
where c.altitude <
	(select MaxAlt from 
		(select country, max(altitude) as MaxAlt from Country
		group by country) altitudes
	where altitudes.country like 'Columbia')

--display the harvests whose lot number is greater
--than the minimum lot number from fall
select * from Harvest
where lotNumber > ANY
	(select lotNumber from Harvest
	where season like 'FALL')
