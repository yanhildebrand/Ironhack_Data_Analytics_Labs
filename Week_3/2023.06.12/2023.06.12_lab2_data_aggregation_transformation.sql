USE sakila;

show tables;

### Challenge 1
# 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
select max(length) as max_duration from sakila.film;
select min(length) as min_duration from sakila.film;

# 1.2. Express the average movie duration in hours and minutes. Don't use decimals. Hint: look for floor and round functions.
select floor(avg(length)) as average_duration from sakila.film;
select round(avg(length)) as average_duration from sakila.film;
select concat(floor(avg(length)/60),'h ', mod(floor(avg(length)),60),'m') as average_duration from sakila.film;

# 2.1 Calculate the number of days that the company has been operating. Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.
select * from sakila.rental;
select DATEDIFF(max(rental_date), min(rental_date)) as days_active from sakila.rental;

# 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT *, monthname(rental_date) as Month, dayname(rental_date) as Day from sakila.rental limit 20;

# 2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week. Hint: use a conditional expression.
SELECT *,
	CASE WHEN weekday(rental_date) IN (0, 4) THEN 'workday'
		ELSE 'weekend'
	END AS DAY_TYPE
from sakila.rental;

# 3. We need to ensure that our customers can easily access information about our movie collection. To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results by the film title in ascending order. Please note that even if there are currently no null values in the rental duration column, the query should still be written to handle such cases in the future.
SELECT title,
	CASE WHEN DATEDIFF(return_date, rental_date) > 0 then DATEDIFF(return_date, rental_date)
		else 'not available'
	END as rental_duration_days
	FROM rental
	inner join inventory ON rental.inventory_id = inventory.inventory_id
	inner join film ON inventory.film_id = film.film_id;
    
# 4. As a marketing team for a movie rental company, we need to create a personalized email campaign for our customers. To achieve this, we want to retrieve the concatenated first and last names of our customers, along with the first 3 characters of their email address, so that we can address them by their first name and use their email address to send personalized recommendations. The results should be ordered by last name in ascending order to make it easier for us to use the data.
SELECT first_name, last_name, email as email_1 from sakila.customer;

# Challenge 2
