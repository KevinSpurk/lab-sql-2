use sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.
select *
from actor
where first_name = 'Scarlett';

-- 2. Select all the actors with the last name ‘Johansson’.
select *
from actor
where last_name = 'Johansson';

-- 3. How many films (movies) are available for rent? (Total amount of movies)
-- for individual movies
select count(*)
from film;
-- for all available physical copies 
select count(*)
from inventory;

-- 4. How many films have been rented?
select count(rental_id)
from rental;

-- 5. What is the shortest and longest rental period?
select min(timediff(convert(return_date, datetime), convert(rental_date, datetime))) as shortest_rental, 
	max(timediff(convert(return_date, datetime), convert(rental_date, datetime))) as longest_rental
from rental;
-- alternative
SELECT MAX(rental_duration), MIN(rental_duration) 
FROM film;

-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration
from film;

-- 7. What's the average movie duration?
select round(avg(length)) as avg_duration
from film;

-- 8. What's the average movie duration expressed in format (hours, minutes)?
select sec_to_time(round(avg(length)*60)) as avg_duration
from film;

-- 9. How many movies longer than 3 hours?
select count(film_id)
from film
where length > 180;

-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat(left(first_name, 1),lower(substr(first_name, 2))) as firstname_formated, last_name,  lower(email) as email_formated
from customer
limit 20;

-- 11. What's the length of the longest film title?
select max(length(title)) as title_length
from film;
-- alternative
select title, length(title) as title_length
from film
order by length(title) desc
limit 1;

select title, max(length(title)) as title_length
from film
where length(title) = (select max(length(title)) from film);
