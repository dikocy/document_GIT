DROP SCHEMA IF EXISTS clients;
CREATE SCHEMA clients;
USE clients;

CREATE TABLE utilisateur(
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
prenom VARCHAR(20),
nom VARCHAR(15),
email VARCHAR(30),
ville VARCHAR(20),
PRIMARY KEY(id)
);

CREATE TABLE commande(
utilisateur_id SMALLINT,
date_achat DATE,
num_facture VARCHAR(10) NOT NULL,
prix_total FLOAT,
PRIMARY KEY(num_facture)
);

INSERT INTO utilisateur(prenom, nom, email, ville) VALUES
('Aimée', 'Marechal', 'aime.marechal@example.com', 'Paris'),
('Esmée', 'Lefort', 'esmee.lefort@example.com', 'Lyon'),
('Marine', 'Prevost', 'm.prevost@example.com', 'Lille'),
('Luc', 'Rolland', 'lucrolland@example.com', 'Marseille');

INSERT INTO COMMANDE(utilisateur_id, date_achat, num_facture,prix_total) VALUES
(1, '2013-01-23', 'A00103', 203.14),
(1, '2013-02-14', 'A00104', 124.00),
(2, '2013-02-17', 'A00105', 149.45),
(2, '2013-02-21', 'A00106', 235.35),
(5, '2013-03-02', 'A00107', 47.58);

SELECT prenom, nom, num_facture, prix_total
FROM utilisateur
INNER JOIN commande
ON id = utilisateur_id;

SELECT id, prenom, nom, num_facture
FROM utilisateur, commande
WHERE id = utilisateur_id;