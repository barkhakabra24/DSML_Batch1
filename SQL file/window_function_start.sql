Select * from farmers_market.vendor_inventory;

Select * from 
(
SELECT *,rank () over (partition by vendor_id order by sales_sum DESC ) As ranker from
	(
	select yr , mon, vendor_id ,sum(sales) as sales_sum from 
	(
		Select 
        year(market_date) as yr,
        month(market_date) as mon,
        product_id,vendor_id,
        (quantity*original_price) as sales
        from farmers_market.vendor_inventory		
	) base
    group by 1,2,3
    order by vendor_id, yr, mon
	) base2 
    ) base3
    where ranker = 1
;





Select * from 
	(
	select yr , mon, vendor_id ,sum(sales) as sales_sum, rank () over (partition by vendor_id order by sum(sales) DESC ) As ranker from 
	(
		Select 
        year(market_date) as yr,
        month(market_date) as mon,
        product_id,vendor_id,
        (quantity*original_price) as sales
        from farmers_market.vendor_inventory		
	) base
    group by 1,2,3
    order by vendor_id, yr, mon
	) base2 
    where ranker = 1
;




Select * from 
(
SELECT *,rank () over (partition by vendor_id order by quantity DESC ) As ranker from
	farmers_market.vendor_inventory		
    ) base3
    where ranker = 1
;


-- Select employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id 
-- from (
--         SELECT *,rank () over (partition by employee_id order by salary DESC ) As ranker  from employees
--      )base WHERE ranker = 3;




-- #rank my product for every vendor on the basis of their of their cost
select * from (
select *, Rank() over ( partition by product_id order by cost desc) as ranker,
Dense_Rank() over ( partition by product_id order by cost desc) as dense_ranker,
row_number() over ( partition by product_id order by cost desc, product_id asc) as rower
from (
select vendor_id, product_id, (quantity*original_price) as cost
from farmers_market.vendor_inventory
where vendor_id=7
)abc
) mno;






select *, sum(cost) over ( partition by product_id order by cost desc) as sum,
avg(cost) over ( partition by product_id order by cost desc) as avg
from (
select vendor_id, product_id, (quantity*original_price) as cost
from farmers_market.vendor_inventory
where vendor_id=7
)abc
;
select * from farmers_market.vendor_inventory;

Select *,lag(original_price) over (order by original_price) from farmers_market.vendor_inventory; 






-- Moving Sum and Normal Sum
select *, sum(cost) over ( partition by product_id order by cost desc) as moving_sum,
sum(cost) over ( partition by product_id) as sum
from (
select distinct vendor_id, product_id, (quantity*original_price) as cost
from farmers_market.vendor_inventory
)abc
;



-- Moving Average and Normal avg
select *, avg(cost) over ( partition by product_id order by cost desc) as moving_avg,
avg(cost) over ( partition by product_id) as avg
from (
select distinct vendor_id, product_id, (quantity*original_price) as cost
from farmers_market.vendor_inventory
)abc;