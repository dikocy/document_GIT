--Compte le nombre de client dans la table client
SELECT COUNT(*) as Nombre_client FROM dbo.Clients;

--Compte le nombre de Commerciaux dans la table Commerciaux
SELECT COUNT(*) as Nombre_Commerciaux FROM dbo.Commerciaux;


--le nombre de client par commerciale
SELECT ClientId, Ville 
FROM dbo.Clients 
JOIN dbo.Commerciaux
ON dbo.Clients.IcId = dbo.Commerciaux.IcId;


