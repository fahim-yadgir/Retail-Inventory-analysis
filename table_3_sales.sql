select * from sales;

alter table sales
rename column `ï»¿date` to Dates;

SET SQL_SAFE_UPDATES = 0;

update sales
set
	Dates = str_to_date(Dates,"%Y-%m-%d");