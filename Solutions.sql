USE sakila;

SELECT DISTINCT(last_name) FROM actor;
SELECT DISTINCT(language_id) FROM film;
SELECT COUNT(film_id) FROM film 
	WHERE rating = "PG-13";
SELECT title FROM film
	WHERE release_year = "2006" order by length DESC LIMIT 10;

-- SKIP Q5  COULDNT FIND A WAY =( DIDNT FIND A VALUE TO USE

SELECT weekday(rental_date), month(rental_date), rental.* FROM rental LIMIT 20;
SELECT *,
	CASE WHEN WEEKDAY(rental_date) <= "1" THEN "WEEKEND"
		 ELSE "WORKDAY"
         END AS day_type 
	FROM rental;
SELECT COUNT(rental_id) FROM rental
	WHERE month(rental_date) =
(SELECT month(rental_date) FROM rental ORDER BY rental_date DESC LIMIT 1)
AND year(rental_date) = (SELECT year(rental_date) FROM rental ORDER BY rental_date DESC LIMIT 1);

SELECT distinct(rating) FROM film;
SELECT DISTINCT(release_year) FROM film;
SELECT title FROM film WHERE title LIKE '%ARMAGEDDON%';
SELECT title FROM film WHERE title LIKE '%APOLLO%';
SELECT title FROM film WHERE title LIKE '%APOLLO';

-- SELECT title FROM film WHERE title LIKE ('%' + 'DATE' + '%'); COULDNT FIND A WAY =(

SELECT title, CHAR_LENGTH(title) as cump FROM film ORDER BY cump DESC LIMIT 10;
SELECT title FROM film ORDER BY length DESC LIMIT 10;
SELECT title, special_features FROM film WHERE special_features LIKE ('%Behind the Scenes%');
SELECT title FROM film ORDER BY release_year, title ASC; 
ALTER TABLE staff DROP COLUMN picture;

DROP table deleted_users;
SELECT customer_id, email, create_date FROM customer WHERE active = 0;
CREATE TABLE deleted_users (
	customer_id SMALLINT,
    email VARCHAR(50),
    create_date DATETIME);
    
INSERT INTO deleted_users (customer_id, email, create_date) SELECT customer_id, email, create_date FROM customer WHERE active = 0;
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer WHERE active = "0";
SET FOREIGN_KEY_CHECKS=1;
SET SQL_SAFE_UPDATES = 1;