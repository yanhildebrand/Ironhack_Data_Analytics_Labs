use sakila;

#1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
select count(inventory_id) as "copies of Hunchback Impossible"
from inventory
where film_id in (select film_id from film
					where film.title = "Hunchback Impossible");

#2. List all films whose length is longer than the average length of all the films in the Sakila database.

/*
select count(film_id) as "longer than average" from film
where length > avg(length) from film;

select avg(length) as "longer than average" from film
where "longer than average"  in (select film_id from film
					where film.title = "Hunchback Impossible");
*/

#3. Use a subquery to display all actors who appear in the film "Alone Trip".
select first_name, last_name from actor
where actor_id in (select actor_id from film_actor
					where film_id in (select film_id from film
										where film.title = "Alone Trip")); 

#4. Sales have been lagging among young families, and you want to target family movies for a promotion. Identify all movies categorized as family films.
select title from film
where rating = "PG";

#5. Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins, you will need to identify the relevant tables and their primary and foreign keys.
# using only subquerries
select first_name, last_name, email from customer
where address_id in (select address_id from address
					where city_id in (select city_id from city
									where country_id in (select country_id from country
														where country = "Canada")));

# using using subquerries and joins
select first_name, last_name, email from customer
where address_id in (select address_id from address
					join city using (city_id)
					where country_id in (select country_id from country
										where country = "Canada"));
                    
#6. Determine which films were starred by the most prolific actor in the Sakila database. A prolific actor is defined as the actor who has acted in the most number of films. First, you will need to find the most prolific actor and then use that actor_id to find the different films that he or she starred in.                    
# obtaining ID of most prolific actor
SELECT actor_id, COUNT(*) AS film_count FROM film_actor
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;

# selecting movies in which the most prolific actor played.
SELECT title FROM film
where film_id in (select film_id from film_actor
				where actor_id = 107);

                    
/*
#7. Find the films rented by the most profitable customer in the Sakila database. You can use the customer and payment tables to find the most profitable customer, i.e., the customer who has made the largest sum of payments.
#8. Retrieve the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client. You can use subqueries to accomplish this
*/