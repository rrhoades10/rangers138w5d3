SELECT *
FROM customer;

SELECT *
FROM order_;

-- TABLE A will be the table SELECTED FROM
-- TABLE B will be the table JOINED ON

-- INNER JOIN
-- Give data that matches in both tables
SELECT first_name, last_name, order_date, amount, customer.customer_id, order_id
FROM customer -- customer is TABLE A
INNER JOIN order_ -- _order is TABLE B
ON customer.customer_id = order_.customer_id;

-- LEFT JOIN
SELECT first_name, last_name, amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id;

-- LEFT JOIN where order_date is NOT NULL
SELECT first_name, last_name, order_date, amount
FROM customer
LEFT JOIN order_
ON customer.customer_id = order_.customer_id
WHERE order_date IS NOT NULL;

-- RIGHT JOIN 
SELECT first_name, last_name, order_date, amount, order_id
FROM customer
RIGHT JOIN order_
ON customer.customer_id = order_.customer_id;

-- FULL JOIN
SELECT first_name, last_name, order_date, amount
FROM customer
FULL JOIN order_
ON customer.customer_id = order_.customer_id;
