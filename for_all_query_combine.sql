-- for all query combine
select * from inventory;
select * from product;
select * from sales;
select * from stores;
select * from suppliers;

select p.`name` ,round(sum(p.unit_cost),2),count(*) ,i.Dates 
from product p 
right join inventory i on p.product_id = i.product_id
where i.Dates between '2025-10-1' and '2025-11-30'
group by p.`name`,i.Dates;

select p.`name` , round(sum(i.units_received),2)as total_unit_received , count(*)as total_product_count
from inventory i
join product p on p.product_id = i.product_id
group by p.`name`
order by total_unit_received desc;

