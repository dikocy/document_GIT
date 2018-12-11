show tables; --montre le nombre de table dans la DB

DESCRIBE actor;
DESCRIBE staff;
DESCRIBE address;
DESCRIBE payment;
DESCRIBE film;
DESCRIBE film_actor;
DESCRIBE inventory;
DESCRIBE customer; --affiche les différentes table et leur type

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
 