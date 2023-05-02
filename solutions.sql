USE sakila;



-- 01.How many distinct (different) actors' last names are there?
SELECT * FROM actor;

SELECT COUNT(DISTINCT(last_name)) AS dist_last_name
FROM actor;

-- 02.In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT * FROM film;

SELECT COUNT(DISTINCT language_id) AS num_lang
FROM film;


-- 03.How many movies were released with "PG-13" rating?

SELECT COUNT(*) as num_films
FROM film
WHERE film.rating REGEXP "^PG-13$";

-- 04.Get 10 the longest movies from 2006.

SELECT * FROM film;

SELECT film.title, AVG(film.length) as avg_length
FROM film
WHERE film.release_year = "2006"
GROUP BY film.title
ORDER BY avg_length DESC
LIMIT 10;



-- 05.How many days has been the company operating (check DATEDIFF() function)?
SELECT * FROM rental;

SELECT rental_date
FROM rental
WHERE rental_date = (SELECT MIN(rental_date) FROM rental);


SELECT DATEDIFF(CURDATE(), '2005-05-24') AS days_operating;





