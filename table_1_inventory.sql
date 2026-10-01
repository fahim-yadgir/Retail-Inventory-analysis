select * from inventory;

alter table inventory
rename column `ï»¿date` to Dates;

SET SQL_SAFE_UPDATES = 0;

update inventory
set
	Dates = str_to_date(Dates,"%Y-%m-%d");