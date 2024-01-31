-- query customer and order tables to view data
select * 
from customer;

select *
from order_;

-- DDL/DML
-- DDL
alter table customer
add phone_number VARCHAR(30);

-- DML
update customer
set phone_number = '630-852-8209'
where customer_id = 6;

select *
from customer;

-- RETURNING
update customer 
set phone_number = '456-987-6541'
where customer_id = 5
returning first_name, phone_number; -- returns the specified columns for the updated row

-- DELETING A SPECIFC ROW OF DATA
delete from customer
where customer_id = 6
returning *;

select *
from customer;


-- DDL
create table staff(
	staff_id SERIAL primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	order_id INTEGER,
	phone_number INTEGER,
	foreign key(order_id) references order_(order_id)
);

-- updating the data type for a specifc column
alter table staff
alter column phone_number type varchar(25);

-- drop (delete) a table from our database
drop table staff cascade -- cascade will drop any objects dependent on this table
