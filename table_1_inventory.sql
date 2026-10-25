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
where Dates between '2025-09-01' and '2025-09-31'
group by Dates , product_id 
order by unit_recive desc;

select store_id , max(units_received)as max_unit
from inventory
where store_id = 'S01'
group by store_id;

select Dates ,store_id , product_id ,closing_stock,dense_rank() over(order by closing_stock desc)as top_rank
from inventory
where closing_stock != 0;

select Dates ,store_id , product_id ,closing_stock,rank() over(order by closing_stock desc)as top_rank
from inventory
where closing_stock != 0;

select  Dates, store_id , product_id , closing_stock,sum(closing_stock) over(partition by store_id order by Dates desc)as total_closing_stock_perday
from inventory;

select * from
inventory
order by store_id asc;

drop view September_date;

create view September_data as(
select * from 
inventory
where Dates between '2025-09-01' and '2025-09-31'
);

select * from September_data;

create view store_S01_data as 
(
select * from 
inventory
where store_id = 'S01'
);

select * from store_S01_data;
