SELECT espece.description
FROM espece
INNER JOIN animal
ON espece.id = animal.espece_id
WHERE animal.nom = 'Cartouche'

-- Sous forme d'allias
SELECT e.id, a.nom, e.description
FROM espece as e
INNER JOIN animal as a
ON e.id = a.espece_id
WHERE a.nom LIKE 'ch%'

--Lorsque les colonnes qui servent à joindre deux table ont
--le même nom, ont peut utiliser la clause USING au lieu de la close ON

SELECT *
FROM table1
INNER | LEFT | RIGHT JOIN table2 USING (colonnej); --la colonne j est presente dans les deux tables

