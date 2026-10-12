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
group by supplier_id, supplier_name;

drop view SUP10;

create view SUP01 as
(
select * from suppliers
where supplier_id = 'SUP01'
) ;

select * from SUP01;

create view SUP03 as
(
select * from suppliers
where supplier_id = 'SUP03'
) ;

select * from SUP03;

create view SUP05 as
(
select * from suppliers
where supplier_id = 'SUP05'
) ;

select * from SUP05;

create view SUP06 as
(
select * from suppliers
where supplier_id = 'SUP06'
) ;

select * from SUP06;

create view SUP08 as
(
select * from suppliers
where supplier_id = 'SUP08'
) ;

select * from SUP08;

create view SUP10 as
(
select * from suppliers
where supplier_id = 'SUP10'
) ;

select * from SUP10;

create view SUP11 as
(
select * from suppliers
where supplier_id = 'SUP11'
) ;

select * from SUP11;

create view SUP12 as
(
select * from suppliers
where supplier_id = 'SUP12'
) ;

select * from SUP12;