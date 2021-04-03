use CoffeeTrade
go

update Country
set altitude = 1300
where altitude is NULL

update FairTrade
set area = 'Florida'
where area like '%US%'

update SpecialtyRoast
set price = 7
where price > 10

update Beverage
set price = 6
where price between 0 and 4

update Harvest
set season = 'SPRING'
where variety like 'r%-a%'

update SpecialtyRoast
set name = 'LondonRoast'
where roastingGrade = 1

update Shop
set id = 22
where name like 'M_%O_%R_%'