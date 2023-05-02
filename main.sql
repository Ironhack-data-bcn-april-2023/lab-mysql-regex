
#1. How many distinct (different) actors' last names are there?
USE sakila;
SELECT COUNT(DISTINCT last_name) AS distinct_last_names from actor;

#2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
SELECT COUNT(DISTINCT language_id) AS distinct_languages
FROM film;

#3. How many movies were released with `"PG-13"` rating?
SELECT COUNT(rating) AS rating_count FROM film 
	WHERE rating = "PG-13";
    
SELECT COUNT(rating) AS rating_count
FROM film
WHERE REGEXP_LIKE(rating, '^PG-13$');

#4. Get 10 the longest movies from 2006.
SELECT title, length FROM film
	WHERE release_year = 2006 
	ORDER BY length DESC
	LIMIT 10;
    
SELECT title, length FROM film
WHERE REGEXP_LIKE(release_year,'^2006')
ORDER BY length DESC
LIMIT 10;

#5. How many days has been the company operating (check `DATEDIFF()` function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS duration_in_days
FROM rental;

#6. Show rental info with additional columns month and weekday. Get 20.
SELECT rental_date, EXTRACT(MONTH FROM rental_date) as Month_extracted, EXTRACT(DAY FROM rental_date) as DAY_extracted FROM rental
LIMIT 20;

#7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_date, WEEKDAY(rental_date) as day_type,
	CASE 
		WHEN WEEKDAY(rental_date) IN (5,6) THEN 'Weekend'
		ELSE 'Workday'
	END AS rental_workday
from rental;

#8. How many rentals were in the last month of activity?

SELECT COUNT(rental_date) AS rental_count
FROM rental
WHERE YEAR(rental_date) = YEAR((SELECT MAX(rental_date) FROM rental))
  AND MONTH(rental_date) = MONTH((SELECT MAX(rental_date) FROM rental));

#9. Get film ratings.
SELECT rating from film;

#10. Get release years.
SELECT release_year FROM film;

#11. Get all films with ARMAGEDDON in the title.
SELECT title from film
WHERE title LIKE "%ARMAGEDDON";

#12. Get all films with APOLLO in the title
SELECT title from film
WHERE title LIKE "%APOLLO%";

#13. Get all films which title ends with APOLLO.
SELECT title FROM film
WHERE title LIKE '%APOLLO';

#14. Get all films with word DATE in the title.
SELECT title FROM film
WHERE title LIKE '%DATE%';

#15. Get 10 films with the longest title.
SELECT title FROM film
ORDER BY LENGTH(title) DESC
LIMIT 10;


#16. Get 10 the longest films.
SELECT length FROM film
ORDER BY length DESC;

#17. How many films include **Behind the Scenes** content?
SELECT COUNT(special_features) AS count_description FROM film
WHERE special_features LIKE '%Behind the Scenes';


#18. List films ordered by release year and title in alphabetical order.
SELECT title, release_year FROM film
ORDER BY release_year and title ASC;


#19. Drop column `picture` from `staff`.
#20. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#21. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
    #**Hint**: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need `customer_id` information as well. To get that you can use the following query:

    #```sql
    #select customer_id from sakila.customer
    #where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
    #```

    #Use similar method to get `inventory_id`, `film_id`, and `staff_id`.

#22. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

    #- Check if there are any non-active users
    #- Create a table _backup table_ as suggested
    #- Insert the non active users in the table _backup table_
    #- Delete the non active users from the table _customer_