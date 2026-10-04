select * from suppliers;

alter table suppliers
rename column `ï»¿supplier_id` to supplier_id;

select supplier_name ,product_id , max(min_order_qty)as max_min_order_quentity
from suppliers
group by supplier_name ,product_id 
order by max_min_order_quentity desc;

select product_id , max(reliability_pct)as max_reliability_pct
from suppliers
group by product_id;

select supplier_id, supplier_name , min(lead_time_days)as min_lead_time_days
from suppliers
group by supplier_id, supplier_name