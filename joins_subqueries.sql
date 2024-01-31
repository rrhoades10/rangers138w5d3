-- JOINS & SUBQUERIES FOR REAL -- 
select *
from staff; 

select *
from rental;

select staff_id, count(rental_id)
from rental
group by staff_id;

--     staff          staff    staff             staff
select first_name, last_name, staff.staff_id, count(staff.staff_id)
from staff
full join rental -- table B
on staff.staff_id = rental.staff_id -- we match records from table a to table b, to get the number of rental ids associated with each staff id
group by staff.staff_id; -- this glues the count of the staff_ids where they match a rental_id to a specific staff member

-- JOIN BETWEEN THE ACTOR AND FILM_ACTOR TABLE
select *
from actor;

select *
from film_actor;

select *
from film;

--       actor           actor       actor     film_actor
select actor.actor_id, first_name, last_name, film_id
from actor
inner join film_actor
on actor.actor_id = film_actor.actor_id

-- triple join bonanza from the actor table to the film_actor table to the film table
select actor.actor_id, first_name, last_name, film.film_id, title, description
from actor
inner join film_actor
on actor.actor_id = film_actor.actor_id
inner join film
on film.film_id = film_actor.film_id;


-- Create an inner join to see which customers live in angola
-- Join that will produce info about a customer
-- From the country of Angola
-- address to city to country
select customer.customer_id, first_name, last_name, country
from customer
inner join country 
on customer.customer_id  = country.country_id
where country = 'Angola';

select *
from country;

select *
from customer;

select customer.first_name, customer.last_name, country 
from customer
inner join address
on customer.address_id = address.address_id
inner join city 
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id
where country = 'Angola';

-- SUBQUERIES -- 
-- using the AVG()
-- subquerying within the same table
select avg(amount)
from payment;

select payment_id, amount
from payment
where amount > 4.20;

select *
from payment
where amount > (
	select avg(amount) 
	from payment
	);

-- Find everyone who lives in dallas
select first_name, last_name
from customer
where address_id in (
	select address_id
	from address
	where city_id in (
		select city_id
		from city
		where city = 'Dallas'
	)
);

-- subquery broken down into regular schmegular queries
select * 
from city
where city = 'Dallas';

select *
from address
where city_id = 135

select *
from customer
where address_id = 405

-- grab all movies of the action category
select title, film_id, description
from film
where film_id in (
	select film_id 
	from film_category
	where category_id in (
		select category_id
		from category
		where name = 'Action'
	)
);

-- getting all customers who paid over $175
select * 
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

-- example of the subquery as a query to see amounts for each customer_id
select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) > 175
order by sum(amount);




