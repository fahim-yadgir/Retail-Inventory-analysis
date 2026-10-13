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

select store_id , product_id , units_sold , unit_price , discount
from sales
where discount != 0;

select store_id , product_id , units_sold , unit_price , discount
from sales
where unit_price > 400
order by unit_price desc;

select Dates,store_id , product_id , units_sold , unit_price , discount
from sales
where Dates between '2025-09-01' and '2025-09-31' and units_sold > 25;