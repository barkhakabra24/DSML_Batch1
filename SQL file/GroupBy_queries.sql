Select customer_id ,
market_date,
sum(quantity) as tot_qty,
count(distinct product_id) as diff_product
from farmers_market.customer_purchases
group by customer_id, market_date;



Select customer_id,market_date,
sum(cost_to_customer_per_qty*quantity) as tot_price
from farmers_market.customer_purchases
where  customer_id = 3
group by customer_id, market_date
ORDER BY market_date DESC;

--  We should not use having for columns that is not having the agg values
-- Select customer_id,market_date,
-- sum(cost_to_customer_per_qty*quantity) as tot_price
-- from farmers_market.customer_purchases
-- group by customer_id, market_date
-- having customer_id = 3


-- ORDER BY market_date DESC;



Select customer_id ,
market_date,
sum(quantity) as tot_qty,
count(distinct product_id) as diff_product
from farmers_market.customer_purchases;


Select customer_id ,
market_date,
sum(quantity) as tot_qty,
count(distinct product_id) as diff_product
from farmers_market.customer_purchases
group by customer_id, market_date
having sum(quantity) > 4;


Select customer_id ,
market_date,
sum(quantity) as tot_qty,
count(distinct product_id) as diff_product
from farmers_market.customer_purchases
group by customer_id, market_date
having tot_qty > 4;



Select p.product_category_id,
min(cost_to_customer_per_qty) as min_price,
max(cost_to_customer_per_qty) as min_price
from farmers_market.customer_purchases as cp
join farmers_market.product as p
on cp.product_id = p.product_id
group by p.product_category_id
having max(cost_to_customer_per_qty)> 9 ;


select distinct customer_id, market_date,count(customer_id)
from farmers_market.customer_purchases;

-- select customer_id,market_date,count(*)
-- from farmers_market.customer_purchases
-- group by customer_id,market_date;




Create table farmers_market.Sal_Avg as (
		Select product_id, avg(cost_to_customer_per_qty) as averager
        From farmers_market.customer_purchases 
        Group by 1);
        


