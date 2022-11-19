SELECT *
FROM farmers_market.customer as c
LEFT JOIN farmers_market.customer_purchases as cp
ON c.customer_id = cp.customer_id;

SELECT c.customer_id,c.customer_first_name,c.customer_last_name,cp.cost_to_customer_per_qty,
cp.cost_to_customer_per_qty*cp.quantity as tot_cost
FROM farmers_market.customer as c
LEFT JOIN farmers_market.customer_purchases as cp
ON c.customer_id = cp.customer_id;


SELECT p.product_name,pc.product_category_name
FROM farmers_market.product as p
left join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id;


SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
left join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id;



SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
left join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
where p.product_id > 8
order by p.product_name
limit 20;



SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
RIGHT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
where p.product_id > 8
order by p.product_name;


SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
LEFT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
UNION
SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
RIGHT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
;


-- OR

SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
LEFT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
UNION
SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product_category as pc
LEFT join farmers_market.product as p 
on p.product_category_id = pc.product_category_id
;


 
 
 --  UNION ALL Will repeat entries from both the table -> 
 --  UNION automatically remove duplicates 
 -- But if we use UNION ALL we will see entries repeated 
 SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
LEFT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
UNION ALL
SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product_category as pc
LEFT join farmers_market.product as p 
on p.product_category_id = pc.product_category_id
;


 
SELECT p.product_name,pc.product_category_name
FROM farmers_market.product as p
LEFT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
UNION
SELECT p.product_name,pc.product_category_name
FROM farmers_market.product_category as pc
LEFT join farmers_market.product as p 
on p.product_category_id = pc.product_category_id
;


SELECT p.product_name,pc.product_category_name
FROM farmers_market.product as p
LEFT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
UNION ALL
SELECT p.product_name,pc.product_category_name
FROM farmers_market.product_category as pc
LEFT join farmers_market.product as p 
on p.product_category_id = pc.product_category_id
;


 -- Left Anti Join 
SELECT c.* 
FROM farmers_market.customer as c
LEFT JOIN farmers_market.customer_purchases as cp 
ON c.customer_id = cp.customer_id
where cp.customer_id is null;

 -- INNER JOIN :
 
 SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
INNER join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id;

-- Secomd way to do inner join 
SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
LEFT join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id
where pc.product_category_id is not Null;


 -- third way to write Inner join 
 SELECT p.product_id,p.product_name,pc.product_category_id,pc.product_category_name
FROM farmers_market.product as p
join farmers_market.product_category as pc
on p.product_category_id = pc.product_category_id;



-- CROSS JOIN :- cartesian product combination of each row with every other row 

SELECT * 
FROM farmers_market.customer as c
cross join farmers_market.customer_purchases
order by c.customer_id;


