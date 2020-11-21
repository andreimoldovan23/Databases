use CoffeeTrade
go

delete from Farm
where countryName in 
	(select c.country from Country c
	where altitude > 2000)
	and regionName in
	(select c.region from Country c
	where altitude > 2000)

delete from Farmer
where age > 60

delete from Harvest
where season like 'S%'
