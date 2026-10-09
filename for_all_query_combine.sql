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

select t.store_id , t.city , t.store_size , round(sum(unit_price),2)as total_unit_price
from sales s
inner join stores t on s.store_id = t.store_id
group by t.store_id , t.city , t.store_size 
order by total_unit_price desc;

select p.product_id , p.`name` , p.category , p.unit_cost , s.unit_price ,s.discount ,round((s.unit_price - s.discount) - p.unit_cost ,2) as profit_after_discount
from product p
join sales s on p.product_id = s.product_id
where s.unit_price > 0;

select s.supplier_id , s.supplier_name , p.product_id,p.`name`,sum(p.unit_cost)as total_unit_cost
from product p
left join suppliers s on p.product_id = s.product_id
group by s.supplier_id , s.supplier_name ,p.product_id ,p.`name`
order by total_unit_cost desc;

select Dates ,store_id , units_received
from inventory 
where units_received = (select max(units_received)as max_units_received from inventory);

select max(units_received)as max_units_received from inventory;

select i.Dates , i.store_id , p.`name`,p.unit_cost ,round(sum(p.unit_cost) over(order by i.Dates ,p.`name`,i.store_id),2)as Runnig_unit_cost
from inventory i
left join product p on p.product_id = i.product_id;

select s.supplier_name , sum(p.unit_cost)as total_unit_cost
from product p
join suppliers s on p.product_id = s.product_id
group by s.supplier_name;

select 
		i.Dates , 
        s.city ,
        round(sum(p.unit_cost),2)as total_cost
from inventory i
right join stores s on i.store_id = s.store_id
join product p on i.product_id = p.product_id
where i.Dates between '2025-09-01' and '2025-09-31'
group by 
		i.Dates , 
        s.city ;