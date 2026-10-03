select * from sales;

alter table sales
rename column `ï»¿date` to Dates;

SET SQL_SAFE_UPDATES = 0;

update sales
set
	Dates = str_to_date(Dates,"%Y-%m-%d");
    
select max(unit_price) as second_highest
from sales
where unit_price < (select max(unit_price)from sales);

select max(unit_price) highets
from sales;