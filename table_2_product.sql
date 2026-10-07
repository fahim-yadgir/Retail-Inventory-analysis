select * from product;

alter table product
rename column `ï»¿product_id` to product_id;

select avg(unit_cost)from product;

select product_id , `name` , category , unit_cost , round(sum(unit_cost) over(order by product_id),2 )as runnig_unit_cost
from product
where unit_cost > (select avg(unit_cost)from product);


select product_id , `name` , category , unit_cost , round(sum(unit_cost) over(order by product_id),2 )as runnig_unit_cost
from product
where unit_cost < (select avg(unit_cost)from product);

select product_id , `name` , category , unit_cost 
from product
where unit_cost = (select max(unit_cost)from product);

select category ,sum(unit_cost)as total_unit_cost
from product
group by category
order by total_unit_cost desc;

select * from product
where category = "Fresh Produce";