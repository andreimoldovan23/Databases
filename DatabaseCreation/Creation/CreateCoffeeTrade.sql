create database CoffeeTrade
go
use [CoffeeTrade]
go

create table FairTrade(
session int primary key identity(1, 1),
area varchar(50) NOT NULL
constraint checkFairTrade check (len(area) >= 3)
)

create table Farmer(
socialSecurity int NOT NULL,
name varchar(50) NOT NULL,
age int constraint defaultFarmerAge default 18,
ftSession int,
constraint PK_Farmer Primary Key(socialSecurity),
constraint FK_Farmer_ftSession Foreign key (ftSession) references FairTrade(session)
	on delete set null
	on update cascade,
constraint checkFarmer check (socialSecurity > 1000 and len(name) >= 3)
)

create table Country(
country varchar(50) NOT NULL,
region varchar(50) NOT NULL, 
altitude int,
constraint PK_Country Primary Key(country, region),
constraint checkCountry check(len(country) >= 3 and len(region) >= 3)
)

create table Farm(
dunsNumber int NOT NULL,
countryName varchar(50) NOT NULL,
regionName varchar(50) NOT NULL,
constraint PK_Farm Primary Key(dunsNumber),
constraint FK_Farm_Country Foreign Key(countryName, regionName) references Country(country, region)
	on update cascade
	on delete cascade
)

create table OwnsFarm(
farmerSocialSecurity int NOT NULL,
farmDunsNumber int NOT NULL,
constraint FK_OwnsFarm_Farmer Foreign Key(farmerSocialSecurity) references Farmer(socialSecurity)
	on update cascade
	on delete cascade,
constraint FK_OwnsFarm_Farm Foreign Key(farmDunsNumber) references Farm(dunsNumber)
	on update cascade
	on delete cascade,
constraint PK_OwnsFarm Primary key (farmerSocialSecurity, farmDunsNumber)
)

create table Harvest(
lotNumber int NOT NULL,
farmDunsNumber int NOT NULL,
season varchar(50) constraint defaultHarvestSeason default 'FALL',
variety varchar(50) NOT NULL,
constraint FK_Harvest_FarmHarvest Foreign Key(farmDunsNumber) references Farm(dunsNumber)
	on update cascade
	on delete cascade,
constraint PK_Harvest Primary Key(lotNumber, farmDunsNumber),
constraint checkHarvest check(len(variety) >= 3),
)

create table Shop(
city varchar(50) NOT NULL,
name varchar(50) NOT NULL,
id int NOT NULL,
constraint PK_Shop Primary Key(id),
constraint checkShop check(len(city) >= 3 and id >= 1)
)

create table ShopBuys(
shopId int NOT NULL,
constraint FK_ShopBuys_Shop Foreign key(shopId) references Shop(id) 
	on delete cascade
	on update cascade,
harvestLot int NOT NULL,
harvestDuns int NOT NULL,
constraint Fk_ShopHarvest_Harvest foreign key (harvestLot, harvestDuns) references Harvest(lotNumber, farmDunsNumber)
	on delete cascade
	on update cascade,
constraint pk_ShopBuys primary key (shopId, harvestLot, harvestDuns)
)

create table SpecialtyRoast(
name varchar(50) NOT NULL,
constraint Pk_SpecialtyRoast Primary key(name),
roastingGrade int constraint defaultSpecialtyRoastGrade default 1,
price int constraint defaultSpecialtyRoastPrice default 5,
shopId int,
constraint FK_SpecialtyRoast foreign key (shopId) references Shop(id)
	on delete set null
	on update cascade,
constraint checkRoast check (roastingGrade BETWEEN 1 and 5 and price BETWEEN 1 and 1000 and len(name) >= 3)
)

create table Beverage(
name varchar(50) NOT NULL,
roastName varchar(50) NOT NULL,
constraint Fk_Beverage_SpecialtyRoast Foreign key(roastName) references SpecialtyRoast(name)
	on delete cascade
	on update cascade,
constraint Pk_BeverageRoast primary key (name, roastName),
price int constraint defaultBeveragePrice default 5,
milkUnits int constraint defaultBeverageMilk default 0,
constraint checkBeverage check (milkUnits <= 10 and price BETWEEN 1 and 1000)
)

create table Transactions(
idTrans int NOT NULL,
constraint Pk_Transactions Primary key(idTrans),
idFrom int NOT NULL,
idTo int NOT NULL
)

create table BeverageTransaction(
beverageName varchar(50),
beverageRoast varchar(50),
idTransaction int NOT NULL,
constraint Fk_BeverageTransaction_Transaction Foreign key(idTransaction) references Transactions(idTrans)
	on delete cascade
	on update cascade,
constraint Fk_BeverageTransaction_Beverage Foreign key (beverageName, beverageRoast) references Beverage(name, roastName)
	on delete cascade
	on update cascade,
constraint Pk_BeverageTransaction primary key (beverageName, beverageRoast, idTransaction)
)