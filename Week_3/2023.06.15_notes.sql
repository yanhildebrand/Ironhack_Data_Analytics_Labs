use sakila;

select first_name from actor
where actor_id = 1;

select first_name from actor
where actor_id in (1,2,3,4);

select first_name
from actor
where actor_id in (select actor_id from film_actor
					where film_id in (select film_id from film
										where film.title = "Alone Trip"));

/*
select first_name
where actor_id in 
*/

/*
select film
select  category_ID from category
where name = "Action"
*/

select first_name from actor
where actor_id in (select actor_id from film_actor
					where film_id in (select film_id from film_category
										where category_id = (select category_id from category
															where category ="Action")));
                                                            


select title, cou as count from film
group by title