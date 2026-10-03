select * from inventory;

alter table inventory
rename column `ï»¿date` to Dates;

SET SQL_SAFE_UPDATES = 0;

update inventory
set
	Dates = str_to_date(Dates,"%Y-%m-%d");

select store_id , sum(units_received)
from inventory
group by store_id;

select Dates , product_id , sum(units_received)as unit_recive
from inventory
group by Dates , product_id 
order by unit_recive desc;

select store_id , max(units_received)as max_unit
from inventory
where store_id = 'S01'
group by store_id;
