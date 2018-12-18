--Compte le nombre de client dans la table client
SELECT COUNT(*) as Nombre_client FROM dbo.Clients;

--Compte le nombre de Commerciaux dans la table Commerciaux
SELECT NomCommercial, COUNT(*) as Nombre_Commerciaux 
FROM dbo.Commerciaux;

--(option)Compte le nombre de Commerciaux dans la table Commerciaux ainsi que leur nom
SELECT NomCommercial, COUNT(*) as Nombre_Commerciaux 
FROM dbo.Commerciaux
GROUP BY NomCommercial;


--affiche les clients clients de chaque commerciale
SELECT dbo.Commerciaux.IcId, NomCommercial, ClientId, count(*)
FROM dbo.Clients 
JOIN dbo.Commerciaux
ON dbo.Clients.IcId = dbo.Commerciaux.IcId
GROUP BY dbo.Commerciaux.NomCommercial, dbo.Commerciaux.IcId, ClientId;

--Le nombre de client par commercial
SELECT NomCommercial, count(*) as Nombre_client
FROM dbo.Clients
JOIN dbo.Commerciaux
ON dbo.Clients.IcId = dbo.Commerciaux.IcId
GROUP BY NomCommercial; 

-- la répartition géographique des clients par ville
SELECT Ville, CodePostal, count(*) as Nombre_de_Client
FROM dbo.Clients
GROUP BY dbo.Clients.Ville, dbo.Clients.CodePostal
ORDER BY Ville;

--Aussi, ça ne se passe pas très bien dans la ville d’Annecy et le directeur commercial souhaite apporter une attention particulère à ce sujet.
--Il souhaite avoir la liste des clients d'Annecy, les commerciaux qui y sont en charge ?
SELECT Ville, ClientId as Clients, NomCommercial
FROM dbo.Clients
JOIN dbo.Commerciaux
ON dbo.Clients.IcId = dbo.Commerciaux.IcId
WHERE Ville = 'Annecy';

--Jointure sur trois tables : la liste des clients d'Annecy, les commerciaux qui y sont en charge et les factures passées
SELECT Ville, Clients.ClientId as Clients, NomCommercial, NumeroFacture
FROM dbo.Clients,
	dbo.Commerciaux co,
	dbo.LigneFacture lf
WHERE dbo.clients.IcId = co.IcId
	AND dbo.Clients.ClientId = lf.ClientId
	AND Ville = 'Annecy'
GROUP BY Ville, dbo.Clients.ClientId, NomCommercial, NumeroFacture;


--Dans la ville d'Annecy, je veux avoir l'id du client, le commercial en charge et le nombre de commande passée par ce client.

--Un même NumeroFacture peut se repéter plusieurs fois. exemple avec la facture 'FA201101100002'
SELECT Clients.ClientId as Clients, NomCommercial, NumeroFacture
FROM dbo.Clients,
	dbo.Commerciaux co,
	dbo.LigneFacture lf
WHERE Ville = 'Annecy' AND Clients.ClientId = 'C10005' AND NumeroFacture = 'FA201101100002' AND NomCommercial ='Sophie Morand';


SELECT Clients.ClientId as Clients, NomCommercial, NumeroFacture, count(*) as Nombre_facture
FROM dbo.Clients,
	dbo.Commerciaux co,
	dbo.LigneFacture lf
WHERE dbo.clients.IcId = co.IcId
	AND dbo.Clients.ClientId = lf.ClientId
	AND Ville = 'Annecy'
GROUP BY dbo.Clients.ClientId, NomCommercial, NumeroFacture;

--En version simplifiée
SELECT src.Clients, src.NomCommercial, count(*) as Nombre_facture
FROM( 
	SELECT Clients.ClientId as Clients, NomCommercial
	FROM dbo.Clients,
		dbo.Commerciaux co,
		dbo.LigneFacture lf
	WHERE dbo.clients.IcId = co.IcId
		AND dbo.Clients.ClientId = lf.ClientId
		AND Ville = 'Annecy'
	GROUP BY dbo.Clients.ClientId, NomCommercial, NumeroFacture) AS src
	GROUP BY Clients, NomCommercial;






