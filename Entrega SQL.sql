--- Crear un esquema ---
create schema tania_baluja_garcia authorization dsxgwymb;

--- Tabla de modelos ---
create table tania_baluja_garcia.models(
				id_model integer not null, -- PK
				id_brand integer not null, -- FK -> brands
				model varchar(30) not null
				);

alter table tania_baluja_garcia.models
	add constraint pk_model primary key (id_model)
	
--- Tabla de marcas ---
create table tania_baluja_garcia.brands(
				id_brand integer not null, -- PK
				id_company integer not null, -- FK -> companies
				brand varchar(30) not null
				);

alter table tania_baluja_garcia.brands
	add constraint pk_brand primary key (id_brand);

--- Tabla empresas ---
create table tania_baluja_garcia.companies(
				id_company integer not null, -- PK
				company varchar(30) not null
				);

alter table tania_baluja_garcia.companies
	add constraint pk_company primary key (id_company);
	
--- Tabla seguros ---
create table tania_baluja_garcia.insurances(
				id_insurance integer not null, -- PK
				id_car integer not null, --FK -> car
				id_insurance_company integer not null, --FK -> insurance_companies
				insurance_number integer not null
				);

alter table tania_baluja_garcia.insurances
	add constraint pk_insurance primary key (id_insurance);

--- Tabla seguros empresas ---
create table tania_baluja_garcia.insurance_companies(
				id_insurance_company integer not null, -- PK
				insurance_company varchar(50) not null
				);

alter table tania_baluja_garcia.insurance_companies
	add constraint pk_insurance_company primary key (id_insurance_company);

--- Tabla moneda ---
create table tania_baluja_garcia.currencies(
				id_currency integer not null, -- PK
				currency varchar(30) not null,
				region varchar(30) null
				);

alter table tania_baluja_garcia.currencies
	add constraint pk_currency primary key (id_currency);

--- Tabla inspecciones ---
create table tania_baluja_garcia.inspections(
				km integer not null, --PK
				id_car integer not null, --PK, FK --> cars
				id_currency integer not null default '001', --FK --> currencies
				inspection_date date not null,
				price integer not null
				);

alter table tania_baluja_garcia.inspections
	add constraint pk_inspection primary key (km, id_car);

--- Tabla colores ---
create table tania_baluja_garcia.colors(
				id_color integer not null, -- PK
				color varchar(20) not null
				);

alter table tania_baluja_garcia.colors
	add constraint pk_color primary key (id_color);

--- Tabla coches ---
create table tania_baluja_garcia.cars(
				id_car integer not null, -- PK
				id_model integer not null, -- FK  --> models
				id_color integer not null, -- FK --> colors
				date_of_purchase date not null,
				license_plate varchar(10) not null,
				km_total integer not null
				);
			
alter table tania_baluja_garcia.cars
	add constraint pk_car primary key (id_car);

--- ---
alter table tania_baluja_garcia.brands
	add constraint brand_company foreign key (id_company)
	references tania_baluja_garcia.companies (id_company);

alter table tania_baluja_garcia.models
	add constraint model_brand foreign key (id_brand)
	references tania_baluja_garcia.brands (id_brand);

alter table tania_baluja_garcia.insurances
	add constraint which_company foreign key (id_insurance_company)
	references tania_baluja_garcia.insurance_companies (id_insurance_company);

alter table tania_baluja_garcia.insurances
	add constraint car foreign key (id_car)
	references tania_baluja_garcia.cars (id_car);

alter table tania_baluja_garcia.cars
	add constraint type_model foreign key (id_model)
	references tania_baluja_garcia.models (id_model);

alter table tania_baluja_garcia.cars
	add constraint car_color foreign key (id_color)
	references tania_baluja_garcia.colors (id_color);

alter table tania_baluja_garcia.inspections
	add constraint inspection_car foreign key (id_car)
	references tania_baluja_garcia.cars(id_car);

alter table tania_baluja_garcia.inspections
	add constraint type_currency foreign key (id_currency)
	references tania_baluja_garcia.currencies(id_currency);

--- ---

--- Monedas ---
insert into tania_baluja_garcia.currencies
	(id_currency, currency, region)
	values('001', 'euro', 'EU');

insert into tania_baluja_garcia.currencies
	(id_currency, currency, region)
	values('002', 'dolar', 'USA');

insert into tania_baluja_garcia.currencies
	(id_currency, currency, region)
	values('003', 'pound', 'UK');

--- Empresas ---
insert into tania_baluja_garcia.companies
	(id_company, company)
	values('001', 'company1');

insert into tania_baluja_garcia.companies
	(id_company, company)
	values('002', 'company2');

--- Marcas ---
insert into tania_baluja_garcia.brands
	(id_brand, id_company, brand)
	values('001', '001', 'brand1');

insert into tania_baluja_garcia.brands
	(id_brand, id_company, brand)
	values('002', '001', 'brand2');

insert into tania_baluja_garcia.brands
	(id_brand, id_company, brand)
	values('003', '002', 'brand3');

--- Modelos ---
insert into tania_baluja_garcia.models
	(id_model, id_brand, model)
	values('001', '001', 'model1');

insert into tania_baluja_garcia.models
	(id_model, id_brand, model)
	values('002', '002', 'model2');

insert into tania_baluja_garcia.models
	(id_model, id_brand, model)
	values('003', '002', 'model3');

insert into tania_baluja_garcia.models
	(id_model, id_brand, model)
	values('004', '003', 'model4');

insert into tania_baluja_garcia.models
	(id_model, id_brand, model)
	values('005', '003', 'model5');

insert into tania_baluja_garcia.models
	(id_model, id_brand, model)
	values('006', '003', 'model6');

--- Seguros compañias ---
insert into tania_baluja_garcia.insurance_companies
	(id_insurance_company, insurance_company)
	values('001', 'IC1');

insert into tania_baluja_garcia.insurance_companies
	(id_insurance_company, insurance_company)
	values('002', 'IC2');

insert into tania_baluja_garcia.insurance_companies
	(id_insurance_company, insurance_company)
	values('003', 'IC3');

--- Colores ---
insert into tania_baluja_garcia.colors
	(id_color, color)
	values('001', 'white');

insert into tania_baluja_garcia.colors
	(id_color, color)
	values('002', 'black');

insert into tania_baluja_garcia.colors
	(id_color, color)
	values('003', 'gray');

insert into tania_baluja_garcia.colors
	(id_color, color)
	values('004', 'red');

--- Coches ---
insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('001', '001', '003', '2018-01-22', 'AAA0101', 12000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('002', '001', '004', '2018-04-22', 'AAA0131', 13000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('003', '001', '002', '2018-01-22', 'ABA0101', 500);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('004', '001', '001', '2019-01-22', 'ACA0101', 8000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('005', '002', '001', '2018-06-22', 'AAG0401', 11500);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('006', '002', '002', '2018-11-22', 'BBA0101', 5500);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('007', '003', '001', '2019-01-22', 'ATU0101', 7800);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('008', '003', '002', '2020-11-22', 'AAD3101', 12000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('009', '003', '002', '2020-01-22', 'BHT0101', 13000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('010', '004', '001', '2019-01-22', 'AAA7101', 2000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('011', '005', '004', '2019-04-22', 'ACA7101', 12000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('012', '005', '001', '2019-03-22', 'FCA7101', 10000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('013', '005', '001', '2019-05-22', 'ADT7101', 2000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('014', '006', '003', '2019-05-22', 'AWX7101', 12000);

insert into tania_baluja_garcia.cars
	(id_car, id_model, id_color, date_of_purchase, license_plate, km_total)
	values('015', '006', '001', '2020-05-22', 'QWX7101', 7600);

--- Seguros ---
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('201', '001', '001', '90141501');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('202', '002', '001', '90141502');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('203', '003', '001', '90141503');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('204', '004', '001', '90141504');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('205', '005', '002', '90141505');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('206', '006', '002', '90141506');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('207', '007', '002', '90141507');

insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('208', '008', '002', '90141508');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('209', '009', '002', '90141509');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('210', '010', '002', '90141510');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('211', '011', '002', '90141511');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('212', '012', '003', '90141512');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('213', '013', '003', '90141513');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('214', '014', '003', '90141514');
	
insert into tania_baluja_garcia.insurances
	(id_insurance, id_car, id_insurance_company, insurance_number)
	values ('215', '015', '003', '90141515');

--- Inspecciones ---

insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '001', '001', '2021-01-22', 20);

insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (3000, '001', '001', '2021-08-22', 23);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '002', '001', '2021-01-22', 20);

insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (4000, '002', '001', '2022-01-22', 27);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '003', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '004', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '005', '002', '2021-01-22', 25);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '006', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '007', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '008', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '009', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (4000, '009', '001', '2021-08-22', 30);

insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (7000, '009', '001', '2022-02-22', 28);

insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '010', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '011', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '012', '003', '2021-01-22', 15);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '013', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (6500, '013', '001', '2021-09-22', 28);

insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '014', '001', '2021-01-22', 20);
	
insert into tania_baluja_garcia.inspections
	(km, id_car, id_currency, inspection_date, price)
	values (1000, '015', '001', '2021-01-22', 20);