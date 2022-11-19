-- Command 1 : Get the Customer Tables -- 
SELECT * FROM farmers_market.customer;
-- Command 2 : Get all the products available in the market --
SELECT * FROM farmers_market.product;
-- Command 3 : Get 10 rows from Vendor booth assignment table --
SELECT * FROM farmers_market.vendor_booth_assignments Limit 10;
-- Command 3 : Alternative --
SELECT market_date, vendor_id, booth_number
 FROM farmers_market.vendor_booth_assignments
 LIMIT 10;
 
 /* Command 4 : In the customer purchases, we have quantity and cost per qty separate,
query the total amount that the customer has paid along with date, customer id,
vendor_id, qty, cost per qty and the total amt.?
*/

Select market_date, 
	   customer_id, 
       vendor_id, 
       quantity, 
       cost_to_customer_per_qty,
       quantity*cost_to_customer_per_qty as total_amt
FROM farmers_market.customer_purchases;

/* ROUNDING OFF */
SELECT
 market_date,
 customer_id,
 vendor_id,
 ROUND(quantity *
cost_to_customer_per_qty, 2) AS price
 FROM
farmers_market.customer_purchases
 LIMIT 10;
 
 
/* Class Queries */

SELECT ROUND(1234.5631, 2);
 -- fOR ROUNDNG DIGIT BEFORE DECIMAL --
SELECT ROUND(1234.5631, -1);
SELECT ROUND(1299,-1);
SELECT ROUND(1299,-2);
-- CEIL IS USED TO ROUND UP TO THE UPPER END --
SELECT CEIL(4.4);
SELECT FLOOR(4.4);
SELECT CEIL(-4.4);
SELECT FLOOR(-4.4);
SELECT *,concat(customer_first_name," ",customer_last_name) AS FULL_NAME 
FROM farmers_market.customer;

SELECT concat("HELLO","  ","WORLD");
SELECT *,
UPPER(concat(customer_first_name," ",customer_last_name)) AS FULL_NAME 
FROM farmers_market.customer;
SELECT concat(1,2);


SELECT * 
FROM farmers_market.customer_purchases
where customer_id = 4
ORDER BY market_date DESC, vendor_id;


SELECT *
FROM farmers_market.product
where ((product_id > 3 AND product_id < 8) or (product_id = 10));


SELECT *
FROM farmers_market.product
where (product_id between 3 and  8);



SELECT *
FROM farmers_market.product
where ((product_id = 10 or product_id > 3 )  AND product_id < 8 );

SELECT *
FROM farmers_market.customer
WHERE customer_first_name ='Carlos' or customer_last_name = 'Diaz';


SELECT *
FROM farmers_market.vendor_booth_assignments
WHERE (
	   vendor_id =7 AND
      market_date >= "2019-04-03"
      AND market_date <= "2019-05-16"
      )
ORDER BY market_date DESC; 

SELECT *
FROM farmers_market.customer
WHERE customer_last_name = 'Diaz' or customer_last_name = 'Edwards' or customer_last_name = "Wilson";


SELECT *
FROM farmers_market.customer
WHERE customer_last_name in ('Diaz', 'Edwards', "Wilson");


SELECT *
FROM farmers_market.customer
WHERE customer_last_name in ('Diaz', 'Edwards', "Wilson","Patil");

SELECT *
FROM farmers_market.customer
WHERE customer_first_name like 'Jer%';

/* 
like: it doesn't matter is upper case or lower
	a% start with a and has zero or more char
    %a ends with a
    a_n single char between a and n 
    %am% any number of character before am or any characters after am or just am
    
*/  

SELECT *
FROM farmers_market.customer
WHERE customer_first_name like '%IA%';

SELECT *
FROM farmers_market.customer
WHERE customer_last_name like '%E' or customer_last_name like '%A';

SELECT *
FROM farmers_market.product
WHERE 
      product_size is NULL or
      product_size = " "
	;
    
    
SELECT *
FROM farmers_market.product
WHERE 
      product_size is NULL or
      TRIM(product_size) = "";
      
SELECT * 
FROM farmers_market.customer_purchases
where market_date in (
						SELECT market_date from farmers_market.market_date_info
                        where market_rain_flag =  1
					)
LIMIT 5;
    


SELECT * 
FROM farmers_market.product
where product_category_id in (
						SELECT product_category_id from farmers_market.product_category
                        where product_category_name like "%FRESH%"
					)
LIMIT 5;
    


SELECT * 
FROM farmers_market.vendor
where vendor_id  in (
						SELECT distinct vendor_id from farmers_market.vendor_inventory
                        where quantity in (
											Select max(quantity) from farmers_market.vendor_inventory
                                            )
					)
LIMIT 5;


SELECT *
FROM farmers_market.vendor
;

SELECT vendor_name,
case when vendor_type like "%fresh%" then 1 else 0 end as fresh_cat_vendor_type,
case when vendor_type like "%Arts%" then 1 else 0 end as Arts_cat_vendor_type 
FROM farmers_market.vendor;


SELECT vendor_name,
case when vendor_type like "%fresh%" then 'fresh_cat_vendor_type'
     when vendor_type like "%Arts%" then 'fresh_cat_vendor_type'
     else 0
     End as cat
FROM farmers_market.vendor;


Select sqrt(4);
Select power(4,2);