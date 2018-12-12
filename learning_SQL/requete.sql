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
 
SELECT count() 
FROM actor 
WHERE last_name IN (
					SELECT actor_id, first_name, last_name 
					FROM actor
					GROUP BY last_name
					HAVING count(*)> 1);

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
 