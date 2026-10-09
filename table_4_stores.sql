select * from stores;

select count(distinct city)as city_count
from stores;

select city , count(city)as city_count
from stores
where city = "Pune"
group by city;

select city , region , store_size,count(store_size)
from stores
group by city , region , store_size;

select store_id , city , store_size , count(region) as region_count 
from stores
group by store_id , city , store_size;

select store_size ,region, count(region)as region_count
from stores
group by store_size,region;

