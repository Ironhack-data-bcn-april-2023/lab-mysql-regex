USE sakila;

# How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM actor;

# In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT(language_id)) FROM language;

# How many movies were released with "PG-13" rating?
SELECT COUNT(film_id) FROM film
WHERE rating REGEXP "^PG-13$";

# Get 10 the longest movies from 2006.
SELECT title FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

# How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(NOW(),(SELECT payment_date FROM payment
ORDER BY payment_date DESC
LIMIT 1));	

# Show rental info with additional columns month and weekday. Get 20.
SELECT rental_id, rental_date, MONTH(return_date) AS month, WEEKDAY(return_date) FROM rental AS weekday
LIMIT 20;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.











SELECT rating FROM film;
