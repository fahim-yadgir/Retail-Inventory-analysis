-- for all query combine
select * from inventory;
select * from product;
select * from sales;
select * from stores;
select * from suppliers;

select p.`name` ,p.unit_cost ,i.Dates 
from product p 
right join inventory i on p.product_id = i.product_id
where i.Dates between '2025-10-1' and '2025-11-30';