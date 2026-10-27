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

select `name` , count(*)as total_product_count
from product
group by `name`;

drop procedure update_unit_cost;

delimiter $$
create procedure update_unit_cost 
(
in p_id text,
in unit_costs double
)
begin
update product
set unit_cost = 
				 unit_costs + unit_cost
where product_id = p_id;
select * from product;
end $$

delimiter ;

start transaction;
call update_unit_cost('P024',3.57);