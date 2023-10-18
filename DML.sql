USE MAXI;

-- Déclaration des variables pour les requêtes 
DECLARE @Date_Livraison DATE = '2023-04-04'; 
DECLARE @Quart_Travail VARCHAR(50) = 'Jour'; -- Quart de travail ('jour' ou 'soir') 


-------------------------------------------------------------------------------------------------------------------
---REQUETE 1 Commandes d'un client (liste des produits) 
-------------------------------------------------------------------------------------------------------------------
WITH CommandesDeJournee 
AS ( 
SELECT  
Commande.ID_Commande 
FROM Livraison 
INNER JOIN Commande ON Livraison.ID_Commande = Commande.ID_Commande 
INNER JOIN Equipe ON Livraison.ID_Equipe = Equipe.ID_Equipe 
WHERE Livraison.Date_Livraison = @Date_Livraison 
AND Equipe.Horaire = @Quart_Travail
)

SELECT
CommandesDeJournee.ID_Commande, 
Article.Nom, 
Article.Prix, 
Article.Poids_Grammes, 
Commande_Article.Quantite 
FROM CommandesDeJournee 
INNER JOIN Commande_Article ON CommandesDeJournee.ID_Commande = Commande_Article.ID_Commande 
INNER JOIN Article ON Commande_Article.ID_Article = Article.ID_Article 
ORDER BY CommandesDeJournee.ID_Commande, Article.Nom; 




-------------------------------------------------------------------------------------------------------------------
---REQUETE 2 Liste des livraisons d'une equipe de courisers pour une date precise 
-------------------------------------------------------------------------------------------------------------------
SELECT
Commande.ID_Commande, 
Client.NoCiv, 
Client.Rue, 
Client.CP, 
Livraison.Date_Livraison 
FROM Livraison 
INNER JOIN Commande ON Livraison.ID_Commande = Commande.ID_Commande 
INNER JOIN Client ON Commande.ID_Client = Client.ID_Client 
INNER JOIN Equipe ON Livraison.ID_Equipe = Equipe.ID_Equipe 
WHERE Livraison.Date_Livraison = @Date_Livraison 
AND Equipe.Horaire = @Quart_Travail 
ORDER BY Commande.ID_Commande; 


-------------------------------------------------------------------------------------------------------------------
---REQUETE 3 Liste des camions occupés pour la date et le magasin donnés
-------------------------------------------------------------------------------------------------------------------
-- Déclaration de la variable pour la recherche d'épicerie 
DECLARE @ID_Epicerie_Recherche VARCHAR(10) = 'M007'; -- ID du magasin recherché 

-- 3. Liste des camions occupés pour la date et le magasin donnés
WITH Camions_Occupes AS 
( 
SELECT Camion.ID_Camion
FROM Livraison 
INNER JOIN Camion ON Livraison.ID_Camion = Camion.ID_Camion 
WHERE Livraison.Date_Livraison = @Date_Livraison
AND Camion.ID_Epicerie = @ID_Epicerie_Recherche 
)

-------------------------------------------------------------------------------------------------------------------
---REQUETE 4 Liste des camions disponibles pour la date et le magasin donnés
-------------------------------------------------------------------------------------------------------------------
SELECT  
Camion.ID_Camion, 
Camion.Modele, 
Camion.Annee, 
Camion.Immatriculation
FROM Camion 
WHERE Camion.ID_Epicerie = @ID_Epicerie_Recherche
AND Camion.ID_Camion NOT IN (SELECT ID_Camion FROM Camions_Occupes); 

-------------------------------------------------------------------------------------------------------------------
-- REQUETE 5 Liste des clients ayant un montant total de commandes supérieur à 150 
-------------------------------------------------------------------------------------------------------------------
WITH Total_Commandes AS ( 
SELECT  
Commande.ID_Client, 
SUM(Article.Prix * Commande_Article.Quantite) AS Montant_Commande 
FROM Commande 
INNER JOIN Commande_Article ON Commande.ID_Commande = Commande_Article.ID_Commande 
INNER JOIN Article ON Commande_Article.ID_Article = Article.ID_Article 
GROUP BY Commande.ID_Client 
HAVING SUM(Article.Prix * Commande_Article.Quantite) > 150 
) 

SELECT
Client.ID_Client, 
Client.Nom, 
Client.Prenom, 
Client.NoCiv,
Client.NoAppt, 
Client.Rue, 
Client.CP
FROM Client 
INNER JOIN Total_Commandes ON Client.ID_Client = Total_Commandes.ID_Client; 

-------------------------------------------------------------------------------------------------------------------
-- REQUETE 6 Afficher l’inventaire des produits dont la quantité est inférieure à 1000 
-------------------------------------------------------------------------------------------------------------------
SELECT Article.ID_Article, Nom, Prix, Poids_Grammes, Inventaire.Quantite 
FROM Inventaire, Article
WHERE Article.ID_Article = Inventaire.ID_Article
AND Quantite < 1000;
-------------------------------------------------------------------------------------------------------------------
/* REQUETE 7 Liste des clients qui ont effectué des commandes pour une plage de dates donnée,  
avec le nom de l'épicerie correspondante, le nom du coursier qui a effectué la livraison,  
le numéro de camion et la date de livraison */ 
-------------------------------------------------------------------------------------------------------------------

WITH CoursiersParEquipe AS (
    SELECT 
        cou_Prenom, 
        cou_Nom, 
        ID_Equipe,
        ROW_NUMBER() OVER (PARTITION BY ID_Equipe ORDER BY cou_Prenom, cou_Nom) AS RowNum
    FROM Coursier
),
CoursiersUniques AS (
    SELECT DISTINCT
        cou_Prenom,
        cou_Nom,
        ID_Equipe
    FROM CoursiersParEquipe
    WHERE RowNum = 1
)

SELECT
Client.Nom AS Nom_Client, 
Commande.ID_Commande, 
Commande.Date_Commande, 
Commande.Date_Livraison_Demande, 
Commande.Statut, 
Epicerie.Nom AS Nom_Epicerie, 
Livraison.Date_Livraison, 
Coursier.cou_Prenom AS Prenom_Coursier, 
Coursier.cou_Nom AS Nom_Coursier, 
Camion.ID_Camion, 
Livraison.Statut_Livraison AS Statut_Livraison 
FROM Commande 
INNER JOIN Client ON Commande.ID_Client = Client.ID_Client 
INNER JOIN Epicerie ON Commande.ID_Epicerie = Epicerie.ID_Epicerie 
INNER JOIN Livraison ON Commande.ID_Commande = Livraison.ID_Commande 
INNER JOIN Coursier ON Livraison.ID_Equipe = Coursier.ID_Equipe 
INNER JOIN Camion ON Livraison.ID_Camion = Camion.ID_Camion 
WHERE Commande.Date_Commande BETWEEN '2023-01-01' AND GETDATE(); 

-------------------------------------------------------------------------------------------------------------------
/* REQUETE 8 Liste des camions utilisés pour une plage de dates donnée,  
avec le nom de l'épicerie correspondante, le nom de l'équipe,  
le nom du coursier, le nombre de boîtes livrées,  
la date de livraison et le statut de la livraison */ 
-------------------------------------------------------------------------------------------------------------------

WITH CoursiersParEquipe AS (
SELECT
cou_Prenom,
cou_Nom,
ID_Equipe,
ROW_NUMBER() OVER (PARTITION BY ID_Equipe ORDER BY cou_Prenom, cou_Nom) AS RowNum
FROM Coursier
),
CoursiersUniques AS (
SELECT DISTINCT
cou_Prenom,
cou_Nom,
ID_Equipe
FROM CoursiersParEquipe
WHERE RowNum = 1
)

SELECT
c.ID_Camion,
e.Nom AS NomEpicerie,
eq.Horaire AS QuartTravail,
SUM(ca.Quantite) AS NbBoitesLivre,
l.Date_Livraison,
l.Statut_Livraison
FROM Camion c
INNER JOIN Livraison l ON c.ID_Camion = l.ID_Camion
INNER JOIN Equipe eq ON l.ID_Equipe = eq.ID_Equipe
INNER JOIN (
SELECT ID_Equipe, cou_Prenom, cou_Nom
FROM CoursiersUniques
) co ON eq.ID_Equipe = co.ID_Equipe
INNER JOIN Epicerie e ON c.ID_Epicerie = e.ID_Epicerie
INNER JOIN Commande_Article ca ON l.ID_Commande = ca.ID_Commande
WHERE l.Date_Livraison BETWEEN '2023-03-01' AND '2023-04-07'
GROUP BY c.ID_Camion, e.Nom, eq.Horaire, co.cou_Prenom, co.cou_Nom, l.Date_Livraison, l.Statut_Livraison
ORDER BY c.ID_Camion, l.Date_Livraison;




-------------------------------------------------------------------------------------------------------------------
/* REQUETE 9 Requête qui permet de sélectionner les détails de tous les accidents de camion  
sur la route pour une plage de date spécifique */  
-------------------------------------------------------------------------------------------------------------------

WITH CoursiersParEquipe AS (
    SELECT 
        cou_Prenom, 
        cou_Nom, 
        ID_Equipe,
        ROW_NUMBER() OVER (PARTITION BY ID_Equipe ORDER BY cou_Prenom, cou_Nom) AS RowNum
    FROM Coursier
),
CoursiersUniques AS (
    SELECT DISTINCT
        cou_Prenom,
        cou_Nom,
        ID_Equipe
    FROM CoursiersParEquipe
    WHERE RowNum = 1
)

SELECT 
Accident.ID_Accident, 
Camion.Immatriculation, 
Camion.Modele, 
Camion.Annee, 
Epicerie.Nom AS Nom_Epicerie, 
Accident.Date_Accident, 
Accident.Description 
FROM Accident 
INNER JOIN Camion ON Accident.ID_Camion = Camion.ID_Camion 
LEFT JOIN Epicerie ON Camion.ID_Epicerie = Epicerie.ID_Epicerie 
LEFT JOIN Livraison ON Accident.ID_Camion = Livraison.ID_Camion 
LEFT JOIN (
    SELECT DISTINCT ID_Equipe 
    FROM Livraison 
    WHERE Livraison.Date_Livraison BETWEEN '2023-01-01' AND GETDATE()
) AS lv ON Livraison.ID_Equipe = lv.ID_Equipe 
LEFT JOIN Coursier AS cu ON lv.ID_Equipe = cu.ID_Equipe 
WHERE Accident.Date_Accident BETWEEN '2023-01-01' AND GETDATE()
ORDER BY Accident.Date_Accident;





-------------------------------------------------------------------------------------------------------------------
--- REQUETE 10 Informations des articles oublies et des coursiers qui ont fait oublie  
-------------------------------------------------------------------------------------------------------------------

WITH CoursiersParEquipe AS (
    SELECT 
        cou_Prenom, 
        cou_Nom, 
        ID_Equipe,
        ROW_NUMBER() OVER (PARTITION BY ID_Equipe ORDER BY cou_Prenom, cou_Nom) AS RowNum
    FROM Coursier
),
CoursiersUniques AS (
    SELECT DISTINCT
        cou_Prenom,
        cou_Nom,
        ID_Equipe
    FROM CoursiersParEquipe
    WHERE RowNum = 1
)

SELECT
Article_Oublie.ID_Article_Oublie, 
Article.ID_Article, 
Article.Nom AS Nom_Article, 
Article_Oublie.Date_Oublie, 
Equipe.ID_Equipe, 
Equipe.Horaire AS Horaire_Equipe, 
Client.ID_Client, 
Commande.ID_Commande 
FROM Article_Oublie
INNER JOIN Article ON Article_Oublie.ID_Article_Oublie = Article.ID_Article 
INNER JOIN Livraison AS liv ON Article_Oublie.ID_Livraison = liv.ID_Livraison 
INNER JOIN Commande ON liv.ID_Commande = Commande.ID_Commande 
INNER JOIN Client ON Commande.ID_Client = Client.ID_Client 
INNER JOIN Equipe ON liv.ID_Equipe = Equipe.ID_Equipe 
INNER JOIN CoursiersUniques AS cu ON Equipe.ID_Equipe = cu.ID_Equipe 
INNER JOIN Coursier ON cu.cou_Nom = Coursier.cou_Nom AND cu.cou_Prenom = Coursier.cou_Prenom
ORDER BY Article_Oublie.Date_Oublie;




-------------------------------------------------------------------------------------------------------------------
/* REQUETE 11 Requete qui indique le nombre de clients ayant commande au moins 5 
articles differents ainsi que le nomnre d'articles differents commandes */ 
-------------------------------------------------------------------------------------------------------------------

WITH ArticlesParClient AS (
    SELECT
        Client.ID_Client,
        COUNT(DISTINCT Commande_Article.ID_Article) AS Nombre_Articles_Differents
    FROM Client
    INNER JOIN Commande ON Client.ID_Client = Commande.ID_Client
    INNER JOIN Commande_Article ON Commande.ID_Commande = Commande_Article.ID_Commande
    INNER JOIN Article ON Commande_Article.ID_Article = Article.ID_Article
    GROUP BY Client.ID_Client
),
ClientsPlusDe5Articles AS (
    SELECT
        ArticlesParClient.ID_Client
    FROM ArticlesParClient
    WHERE ArticlesParClient.Nombre_Articles_Differents >= 5
)
SELECT Client.ID_Client,
       Client.Nom,
       Client.Prenom,
       Client.NoCiv,
       Client.NoAppt,
       Client.Rue,
       Client.CP
FROM   Client
WHERE  Client.ID_Client IN (SELECT ID_Client FROM ClientsPlusDe5Articles);
