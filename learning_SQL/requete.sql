show tables; --montre le nombre de table dans la DB sakila


--Afficher le nombre de colonne dans la table actor, staff et address
SHOW columns FROM actor; 
SHOW columns FROM staff;
--ou bien
DESCRIBE actor;


--Combien y'a t'il d'acteurs, de staff de film...
SELECT count(*) from actor;
SELECT count(*) from staff;


--Afficher le contenu des tables actor et staff
SELECT * FROM actor;

SELECT staff_id, first_name, last_name
FROM staff;


--Afficher dans une nouvelle colonne 'Actor Name'
--le first_name et le last_name (ensemble) ?
SELECT CONCAT(first_name, last_name) as "Actor_name" 
FROM actor
LIMIT 10;

SELECT actor_id, CONCAT(first_name, last_name) as "Actor_name" 
FROM actor
LIMIT 10 OFFSET 20; --affiche a parti du 21éme


--Créer une nouvelle colonne middle_name
--positionné après first_name en lui attribuant les mêmes propriétés
--que la colonne first_name. La supp ?
ALTER TABLE actor 
ADD middle_name VARCHAR(45) NOT NULL AFTER first_name;
--Pour supprimer la colonnes middle_name
ALTER TABLE actor
DROP middle_name;


--Trouver l'actor_id et last_name d'un acteur dont on connaît
--que le prénom 'Scarlett' (aussi un autre acteur : 'Joe') ?
SELECT actor_id, last_name 
FROM actor WHERE first_name = 'Scarlett';

SELECT actor_id, last_name 
FROM actor WHERE first_name = 'joe' OR first_name = 'Scarlett';
--ou bien
SELECT actor_id, last_name 
FROM actor WHERE first_name IN ('joe', 'scarlett');


--Lister tous les acteurs dont le last_name contient les lettres 'GEN'
--(aussi un autre cas : '%LI%');
--trié par last_name d'abord et par first_name ensuite ?
SELECT * FROM actor WHERE last_name LIKE '%GEN%'

SELECT * 
FROM actor 
WHERE last_name 
LIKE '%GEN%' OR last_name LIKE '%LI%' 
ORDER BY last_name, first_name;


--A l'aide d'une seule et même Qry, trouver l'id des pays suivants
--l'Afghanistan, Bangladesh, and China ?
SELECT country_id 
FROM country 
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');


--Trouver les films qui commencent soit par la lettre K soit par la lettre Q ?
SELECT film_id, title, description 
FROM film 
WHERE title LIKE 'Q%' OR title LIKE 'k%';


--Combien y'a-t-il d'acteurs dont le nom de famille est 'JOHANSSON' ?
SELECT count(*) 
FROM actor 
WHERE last_name = 'JOHANSSON';


--Pourquoi si je tappe 'JoHansSon' dans la dernière Qry au lieu de 'JOHANSSON',
--j'obtiens les mêmes résultats ?
SELECT count(*) 
FROM actor 
WHERE last_name = 'JOHanSSon';


--Le vrai nom de l'acteur 'HARPO WILLIAMS' est GROUCHO WILLIAMS. 
--Corriger cette erreur de saisi dans la DB. 172

UPDATE actor 
SET first_name = 'HARPO' --la modif a apporter
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS'


--Quelles sont les acteurs qui portent le même nom de famille ? 
--N.B : Comme résultat, fournir un tableau qui indique
--le nbre de fois qu'un nom d'acteurs se répète 
--(sens de tri : nbr de répétition => ordre décroissant ; 
--last_name => ordre croissant) ? 
--Q : Quelle est le nom de famille qui se répète le plus ?
SELECT actor_id, first_name, last_name 
FROM actor
GROUP BY last_name
HAVING count(*)> 1;

--affiche un nombre rond
SELECT count(*) as nb
FROM (SELECT actor_id, last_name
		FROM actor
		GROUP BY last_name
		HAVING count(last_name) > 1) src;


--Requettes a améliorer: 
--SELECT last_name, count(last_name) 
--FROM actor 
--WHERE last_name IN (
--					SELECT actor_id, first_name, last_name 
--					FROM actor
--					GROUP BY last_name
--					HAVING count(last_name)> 1);


--Quelle est le nom de famille qui se répète le plus ?
SELECT actor_id, first_name, last_name, count(*)
FROM actor
GROUP BY last_name
HAVING count(*) > 4

--Tjrs, dans la table actor, combien de noms de famille d'acteurs distincts et les lister ?
SELECT count(*)
FROM(
	SELECT DISTINCT last_name
	from actor) AS src;

SELECT count(DISTINCT last_name)
from actor;

--Quelles sont les last_name qui sont partagés par au moins deux acteurs dans la DB ?
SELECT 	actor_id, last_name, count(*)
FROM actor
GROUP BY last_name
HAVING count(*) > 1


--On souhaite afficher l'ensemble des col de la table actor avec un Distinct sur last_name ? Pourquoi les 2 Qry suivantes ne marchent pas :
-- * SELECT actor_id, actor_name, DISTINCT last_name FROM actor ;
-- * SELECT Distinct * FROM actor ;



--Récrire la dernière Qry avec un GROUP BY (au lieu DISTINCT) ?
SELECT actor_id, first_name, last_name
FROM actor
GROUP BY last_name;

--Quelles sont les noms de famille d'acteurs qui ne se répètent ; sens du tri => alphabétique sur last_name ?
SELECT actor_id, last_name, count(*)
	FROM actor
	GROUP BY last_name
	HAVING count(*) = 1);
	
--la même question mais renvoi un nombre rond.
SELECT count(*) AS nombre
FROM(
	SELECT actor_id, last_name, count(*)
	FROM actor
	GROUP BY last_name
	HAVING count(*) = 1) AS src;


--En utilisant un JOIN, afficher first_name, 
--last_name et address des membres du staff ?
SELECT first_name, last_name, address
FROM staff
INNER JOIN address
ON staff.address_id = address.address_id;


--En utilisant un JOIN et BETWEEN, afficher le amount touché
--par chaque membre du staff avant de partir en vacances : aôut 2005 ?
SELECT staff.staff_id, sum(amount)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
WHERE payment_date BETWEEN '2004-09-01' AND  '2005-08-01'
GROUP BY staff.staff_id;


SELECT payment_date, amount
FROM payment
WHERE payment_date like '%2005-08%'
GROUP BY payment_date;

 
--Combien d'acteurs ont joué dans chaque film ?
SELECT actor.actor_id, film.film_id, title, count(*)
FROM actor,
	film_actor,
	film
WHERE actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
GROUP BY title
LIMIT 45;


--Combien de copies de film Hunchback Impossible est dispo en inventory ?
SELECT inventory_id, film.film_id, title, count(*) AS 'Quantité disponible'
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
WHERE title = 'Hunchback Impossible'
GROUP BY title
LIMIT 20;


--Combien chaque client a payé au total ?
SELECT customer.customer_id, payment_id, sum(amount) AS 'Montant_total_payé'
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
GROUP BY customer_id
LIMIT 20;


--A l'aide d'une sous-requêtte subqueries, 
--afficher les title des films dont la langue est l'Anglais 
--et qui commencent soit par la lettre K soit par la lettre Q ?
SELECT film_id, title, name
FROM language
JOIN film
ON language.language_id = film.language_id
WHERE name = 'English' AND (title LIKE 'K%' OR title LIKE 'Q%')
LIMIT 35;


--A l'aide d'une sous-requêtte, 
--quelles sont les acteurs qui ont joué dans le film Alone Trip.
SELECT actor.actor_id, last_name, first_name, title
FROM actor,
	film,
	film_actor
WHERE actor.actor_id = film_actor.actor_id
	AND film.film_id = film_actor.film_id
	AND title = 'Alone Trip'
LIMIT 15;


--En utilisant un JOIN, créer un mailing list d'email de tous les clients canadiens
--pour les fins Marketing (ds la DB) ?	
SELECT customer_id, last_name, country.country_id, customer.email
FROM customer,
	address,
	city,
	country
WHERE customer.address_id = address.address_id
	AND address.city_id = city.city_id
	AND city.country_id = country.country_id
	AND country = 'Canada'
LIMIT 10;

--Quelles sont les films de type Familiy (Noël c'est très bientôt) ?
SELECT film.film_id, title
FROM film,
	film_category,
	category
WHERE film.film_id = film_category.film_id
	AND film_category.category_id = category.category_id
	AND category.name = 'Family'
LIMIT 10


--Quelles sont les films qui se louent le plus ?
SELECT film_id, title
FROM film,
	inventory,
	rental
WHERE film.film_id = inventory.film_id
	inventory.inventory_id = rental.rental_id
LIMIT 10;


SELECT COUNT(*) 
FROM actor; --Compte le nombre de ligne dans la table actor.

SELECT actor_id
FROM actor LIMIT 10; -- affiche le contenu da la table actor limité à 10

SHOW COLUMNS FROM staff; --Permet d'avoir une description compacte de la table staff

SELECT CONCAT(first_name,'',last_name) as Name FROM actor; --Concate le contenu de deux colonnes  et les met dans un alias

ALTER TABLE actor ADD middle_name VARCHAR(10) AFTER first_name; --Permet d'ajouter une colonne à la table actor après first_name.

ALTER TABLE actor DROP middle_name1; 

SELECT actor_id, last_name FROM actor WHERE first_name = 'Scarlett'; --Permet d'afficher l'id et le nom  dans la table actor ou le prenom est 'Scarlett'

SELECT actor_id, last_name FROM actor WHERE last_name LIKE '%GEN%';

SELECT µ FROM country Where conutry IN ('afg','bang','chi')

SELECT COUNT(*) FROM actor Where last_name = 'johansson';

UPDATE actor SET first_name = 'GROUTCHO' WHERE first_name = 'HARPO' AND last_name = 'williams';

SELECT last_name, count(last_name) FROM actor WHERE count_last_name > 1 GROUP BY 


SELECT COUNT(DISTINCT last_name)
FROM actor 
WHERE last_name IN (
    SELECT last_name 
    FROM actor
    GROUP BY last_name 
    HAVING COUNT(last_name) > 1
)
 