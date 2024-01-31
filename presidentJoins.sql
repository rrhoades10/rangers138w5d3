-- JOINS & SUBQUERIES -- 

select * 
from customer;

select * 
from order_;

-- Inner Join -- 
-- select from TABLE A
-- JOIN Table B
-- customer = Table A
-- order_ = Table B
-- we can select columns from both tables when using a join
-- inner join combines rows from two or more columns that have matching values between the, 
select customer.customer_id, first_name, last_name, order_date, amount
from customer -- table A
inner join order_ -- table b
on customer.customer_id = order_.customer_id;

-- LEFT Join
select first_name, last_name, order_date, amount
from customer
left join order_
on customer.customer_id = order_.customer_id;

--Right Join
select first_name, last_name, order_date, amount
from customer
right join order_
on customer.customer_id = order_.customer_id

-- FULL JOIN 
select first_name, last_name, order_date, amount
from customer
full join order_ 
on customer.customer_id = order_.customer_id;



