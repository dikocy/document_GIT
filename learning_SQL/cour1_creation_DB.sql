 CREATE DATABASE nom_de_la_base_donnée CHARACTER SET 'utf8'; --syntaxe creation d'une base de donnée"
 
 DROPE DATABASE nom_de_la_base_donnée --Permet d'effacer une base de données"
 
 USE nom_de_la_base_donnée  --permet de selectionner une base de donnée afin de travailler dessus"
 
 --Cette suite de commande crée une table"  
 CREATE TABLE Animal (
	id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	espece VARCHAR(40) NOT NULL,
	sexe CHAR(1),
	date_naissance DATETIME NOT NULL,
	nom VARCHAR(30),
	commentaire TEXT,
	PRIMARY KEY (id)
	)
	Engine = INNODB;

	
SHOW TABLES; -- permet de lister les tables d'une base de donnée
DESCRIBE nom_table; --liste les colonnes de la table avec leurs caractéristiques

################# MODIFICATION DE TABLE ##################

ALTER TABLE nom_table 
ADD ... --Permet d'ajouter quelques chose à la table (une colonne par exemple)


ALTER TABLE nom_table 
DROP ... --Permet de retirer quelque chose


ALTER TABLE nom_table 
CHANGE ancien_nom nouveau_nom nouvelle_description; --permet de le nom et la description d'une colonnes


ALTER TABLE nom_table 
MODIFY nom_colonne nouvelle_description --Permet de modifier une colonne


CREATE TABLE test_tuto (
	id int NOT NULL,
	nom VARCHAR(10) NOT NULL,
	PRIMARY KEY (id)
	);
	
