
-- Q1
--  Write an SQL query to find for each date 
--    the number of different products sold seperated by comma
--    and their names
-- Solution :
SELECT sell_date,
		COUNT(DISTINCT(product)) AS num_sold, 
		GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date ASC;

-- Q2
-- Write an SQL query to fix the names 
-- so that only the first character is uppercase and the rest are lowercase.

-- Solution 1 : 
 SELECT user_id,CONCAT(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2,length(name)))) AS name
 FROM Users ORDER BY user_id;
-- SUBSTR(string_name , start_index ,end_index)

# Solution 2  #RIGHT(name_of_string, no_of_charachters) 

SELECT user_id, concat(upper(LEFT(name, 1)), lower(RIGHT(name, length(name)-1))) as name
FROM users
ORDER BY user_id;


-- Q3
-- Write an SQL query to swap all 'f' and 'm' values 
-- (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

-- Solution 1
update salary set sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));

-- Solution 2 
update Salary set sex= 
case
when sex='f' then 'm'
when sex='m' then 'f'
end;

-- Solution 3
update Salary set sex= if(sex='f','m','f');
