---Universite de Montreal
---IFT2821 Intro aux bases de donnees
---Hiver 2023
---Projet Epiceries
---Equipe 06

USE MAXI;

-------------------------------------------------------------------------------------------------------------------
---FONCTIONS
-------------------------------------------------------------------------------------------------------------------

GO
---fonction qui, selon le code postal, trouve le CP_Code
CREATE OR ALTER FUNCTION fn_trouverCP_Code
(
    @CP VARCHAR(10)
)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @CL_Code VARCHAR(10);
    SET @CL_Code = LEFT(@CP, 3);
    RETURN @CL_Code;
END;
GO


Declare @CP_Code_test VARCHAR(10);
SET @CP_Code_test = dbo.fn_trouverCP_Code('H2B 4N8')
print '3 premier caractères du cp = ' + @CP_Code_test
go



---fonction qui, selon le CP_Code, trouve le ID_Secteur
CREATE OR ALTER FUNCTION fn_trouverID_Secteur
(
@CP_Code_trouve VARCHAR(5) ---trois premiers caractères du CP
)
RETURNS varchar(10)
AS
BEGIN

Declare @ID_Secteur_test VARCHAR(10);

SET @ID_Secteur_test = (
	SELECT ID_Secteur
	FROM CorrespondanceCP
	WHERE CP_Code = @CP_Code_trouve
);
RETURN @ID_Secteur_test
END;
GO

Declare @CP_Code_test2 VARCHAR(5);
SET @CP_Code_test2 = dbo.fn_trouverID_Secteur('H2B')
print 'secteur = ' + @CP_Code_test2
go


CREATE OR ALTER FUNCTION fn_calculerNbBoites
(
@id_commande int ---trois premiers caractères du CP
)
RETURNS int
AS
BEGIN

Declare @total int;

SET @total = (
SELECT SUM(Article.Poids_Grammes * Commande_Article.Quantite/1000 /10) ---/1000 grammes pour kilos et /10 pour 10 kilos par boites
FROM Commande_Article 
INNER JOIN Article ON Article.ID_Article = Commande_Article.ID_Article
WHERE ID_Commande = @id_commande);

RETURN @total
END;
GO


Declare @total_boites int;
SET @total_boites = dbo.fn_calculerNbBoites(32024);
print @total_boites;
go


-------------------------------------------------------------------------------------------------------------------
---PROCEDURES - AFFICHER LIVRAISONS
-------------------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE sp_afficherLivraisons
(
@date_livraison1 DATE,
@date_livraison2 DATE,
@horaire varchar(10)
)

AS
BEGIN

SELECT ID_Livraison, Date_Livraison, Horaire_Livraison, Equipe.ID_Epicerie, Commande.ID_Commande, Equipe.ID_Equipe, Equipe.ID_Camion, Statut_Livraison
FROM Livraison
INNER JOIN Commande ON Livraison.ID_Commande = Commande.ID_Commande 
INNER JOIN Equipe ON Livraison.ID_Equipe = Equipe.ID_Equipe 
WHERE Livraison.Date_Livraison BETWEEN @date_livraison1 AND @date_livraison2
AND Equipe.Horaire = @horaire
END;
go

-------------------------------------------------------------------------------------------------------------------
---PROCEDURES - AFFICHER LA COMMANDE
-------------------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE sp_afficherCommande
(
@id_com int
)

AS
BEGIN

SELECT Commande_Article.ID_Article, Article.Nom, Article.A_Groupe, Quantite ---Nom, A_Groupe, Prix, Quantite
FROM Commande_Article
INNER JOIN Article ON Article.ID_Article = Commande_Article.ID_Article 
WHERE Commande_Article.ID_Commande = @id_com 
END;
go

exec sp_afficherCommande @id_com = 32008;

-------------------------------------------------------------------------------------------------------------------
---PROCEDURES - AFFICHER LES CAMIONS
-------------------------------------------------------------------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE sp_afficherCamions
(
@date date,
@id_epicerie varchar(10),
@id_equipe varchar(10)
)
AS
BEGIN

SELECT Immatriculation, Marque, CamionCapacite.Modele, Annee, ID_Equipe, CamionCapacite.Capacite, Camion_Occupation.CapaciteRestante, Livraison.ID_Commande
FROM Camion
INNER JOIN CamionCapacite ON Camion.Modele = CamionCapacite.Modele
INNER JOIN Livraison ON Livraison.ID_Camion = Camion.ID_Camion
INNER JOIN Camion_Occupation ON Camion.ID_Camion = Camion_Occupation.ID_Camion
WHERE Livraison.Date_Livraison = @date OR Livraison.ID_Epicerie = @id_epicerie OR Livraison.ID_Equipe = @id_equipe
END;
go

exec sp_afficherCamions @date = '03/04/2023', @id_epicerie = '654165', @id_equipe='322' ;

-------------------------------------------------------------------------------------------------------------------
---PROCEDURES - AFFICHER LES clients
-------------------------------------------------------------------------------------------------------------------

GO
CREATE OR ALTER PROCEDURE sp_afficherClients
(
@date1 date,
@date2 date,
---@montant DECIMAL(10,2),
@rue varchar(50),
@noCiv varchar(10),
@noApt varchar(10),
@nom varchar(50),
@prenom varchar(50)
)
AS
BEGIN

SELECT DISTINCT(Client.ID_Client), Nom, Prenom, Rue, NoCiv, NoAppt, CP
FROM Client
INNER JOIN Commande ON Commande.ID_Client = Client.ID_Client
WHERE Date_Commande BETWEEN @date1 AND @date2
OR Rue LIKE @rue
OR NoCiv LIKE @noCiv
OR NoAppt LIKE @noApt
OR Nom LIKE @nom
OR Prenom LIKE @prenom
END;
go

exec sp_afficherClients @date1 = '01/04/2023',@date2 = '03/04/2023', @rue = '654165', @noCiv='E7',@noApt='E7',@nom='E7',@prenom='E7';

-------------------------------------------------------------------------------------------------------------------
---PROCEDURES - AFFICHER L'inventaire
-------------------------------------------------------------------------------------------------------------------

GO
CREATE OR ALTER PROCEDURE sp_afficherInventaire
(
@categorie VARCHAR(50)
)
AS
BEGIN

SELECT Article.ID_Article, Nom, A_Groupe, Prix, Inventaire.Quantite
FROM Inventaire
INNER JOIN Article ON Inventaire.ID_Article = Article.ID_Article
WHERE A_Groupe = @categorie
END;
go

exec sp_afficherInventaire @categorie = 'Grains';

-------------------------------------------------------------------------------------------------------------------
---PROCEDURES - CREER UNE COMMANDE
-------------------------------------------------------------------------------------------------------------------

GO
CREATE OR ALTER PROCEDURE sp_creerCommande
(
@cl_nom VARCHAR(50),
@cl_prenom VARCHAR(50),
@cl_noCiv VARCHAR(10),
@cl_noApt VARCHAR(10),
@cl_rue VARCHAR(50),
@cl_CP VARCHAR(10),

@livraison_date DATE,
@livraison_horaire VARCHAR(10),

@commande_art1 VARCHAR(50),
@commande_qt1 int,
@commande_art2 VARCHAR(50),
@commande_qt2 int,
@commande_art3 VARCHAR(50),
@commande_qt3 int,
@commande_art4 VARCHAR(50),
@commande_qt4 int,
@commande_art5 VARCHAR(50),
@commande_qt5 int
)

AS
BEGIN
SET NOCOUNT ON


---determiner CP_Code et ID_Secteur
---fonction qui, selon le code postal, trouve le CP_Code et ID_Secteur

Declare @cp VARCHAR(5);
Set @cp = dbo.fn_trouverCP_Code(@cl_CP)

Declare @sect VARCHAR(5);
Set @sect = dbo.fn_trouverID_Secteur(@cp)


INSERT INTO Client (Nom, Prenom, NoCiv, NoAppt, Rue, CP)
SELECT * FROM (SELECT @cl_nom AS Nom, @cl_prenom AS Prenom, @cl_noCiv AS NoCiv, @cl_noApt AS NoAppt, @cl_rue AS Rue, @cl_CP AS CP) AS tmp
WHERE NOT EXISTS (
    SELECT Nom, Prenom, Rue FROM Client WHERE Nom = @cl_nom AND Prenom = @cl_prenom AND Rue = @cl_rue
);

---CONFIRMATION DE LA COMMANDE---

---declaration des variables à déterminer selon les conditions de la commande
Declare @id_epicerie varchar(10);
Declare @id_equipe varchar(10);
Declare @id_camion varchar(10);

---DÉTERMINER L'ÉPICERIE
Set @id_epicerie = (
Select ID_Epicerie_1
FROM Secteur
WHERE ID_Secteur = @sect
)

---DÉTERMINER LE CAMION
---si la somme de la capacité des camions d'un magasin donne pour une journée donnee n'est pas 100%, on peut recevoir la commande dans le camion le moins chargé d'un magasin
Set @id_camion = (
SELECT TOP 1 Camion_Occupation.ID_Camion
FROM Camion_Occupation
INNER JOIN Camion ON Camion.ID_Camion = Camion_Occupation.ID_Camion
INNER JOIN Equipe ON Camion.ID_Camion = Equipe.ID_Camion
WHERE CapaciteRestante > 0 
AND Camion_Occupation.Date_Livraison = @livraison_date
AND Camion.ID_Epicerie = @id_epicerie
AND Equipe.Horaire = @livraison_horaire)

---DÉTERMINER L'ÉQUIPE
---le camion va determiner l'équipe
Set @id_equipe = (
SELECT ID_Equipe
FROM Equipe
WHERE ID_Camion = @id_camion
)


Declare @id_client int;
Set @id_client = (SELECT MAX(ID_Client) FROM Client)
-----si le client existe déjà, il faut trouver son numero de client automatiquement
---valider si nouveau client ou existant



Declare @id_zone varchar(10);
Set @id_zone = (
select ID_Zone
FROM Secteur
WHERE ID_Secteur = @sect
)

---insertion dans Commande
INSERT INTO Commande (Date_Commande, Date_Livraison_Demande, Statut, ID_Client, ID_Zone, ID_Epicerie) VALUES (@livraison_date, @livraison_date,'Confirme', @id_client, @id_zone, @id_epicerie);



Declare @id_commande int;
Set @id_commande = (SELECT MAX(ID_Commande) FROM Commande)


---insertion dans Commande_Article
INSERT INTO Commande_Article (ID_Commande, ID_Article, Quantite) VALUES (@id_commande,@commande_art1, @commande_qt1);
INSERT INTO Commande_Article (ID_Commande, ID_Article, Quantite) VALUES (@id_commande,@commande_art2, @commande_qt2);
INSERT INTO Commande_Article (ID_Commande, ID_Article, Quantite) VALUES (@id_commande,@commande_art3, @commande_qt3);
INSERT INTO Commande_Article (ID_Commande, ID_Article, Quantite) VALUES (@id_commande,@commande_art4, @commande_qt4);
INSERT INTO Commande_Article (ID_Commande, ID_Article, Quantite) VALUES (@id_commande,@commande_art5, @commande_qt5);


Declare @id_livraison int;
Set @id_livraison = (SELECT MAX(ID_Livraison) FROM Livraison)+1

---insertion dans Livraisons
SET IDENTITY_INSERT Livraison ON; 
INSERT INTO Livraison (ID_Livraison, Date_Livraison, Horaire_Livraison, ID_Epicerie, ID_Commande, ID_Equipe, ID_Camion, Statut_Livraison) VALUES (@id_livraison, @livraison_date, @livraison_horaire, @id_epicerie, @id_commande, @id_equipe, @id_camion,'Confirme');
SET IDENTITY_INSERT Livraison OFF; 



---mettre à jour les quantités de boites par camion

Declare @nbBoitesCommande int;
Set @nbBoitesCommande = dbo.fn_calculerNbBoites(@id_commande);

Declare @capaciteRestante int;
Set @capaciteRestante = (
SELECT Capacite
FROM CamionCapacite
INNER JOIN Camion ON CamionCapacite.Modele = Camion.Modele
INNER JOIN Camion_Occupation ON Camion.ID_Camion = Camion_Occupation.ID_Camion
WHERE Camion_Occupation.ID_Camion = @id_camion
AND Camion_Occupation.Date_Livraison = @livraison_date) - @nbBoitesCommande 

UPDATE Camion_Occupation 
SET CapaciteRestante = @capaciteRestante
WHERE Camion_Occupation.ID_Camion = @id_camion
AND Date_Livraison = @livraison_date;


---mettre à jour les quantités d'articles de l'inventaire
UPDATE Inventaire SET Quantite = Quantite - @commande_qt1 WHERE Inventaire.ID_Article = @commande_art1;
UPDATE Inventaire SET Quantite = Quantite - @commande_qt2 WHERE Inventaire.ID_Article = @commande_art2;
UPDATE Inventaire SET Quantite = Quantite - @commande_qt3 WHERE Inventaire.ID_Article = @commande_art3;
UPDATE Inventaire SET Quantite = Quantite - @commande_qt4 WHERE Inventaire.ID_Article = @commande_art4;
UPDATE Inventaire SET Quantite = Quantite - @commande_qt5 WHERE Inventaire.ID_Article = @commande_art5;
END;
GO

select * from Client;
select * from Livraison;
select * from Commande;
select * from Commande_Article;
select * from Camion_Occupation;



DECLARE @livraison_date DATE;
DECLARE @id_epicerie VARCHAR(10);
DECLARE @id_camion VARCHAR(10);

SET @livraison_date = '2023-03-04';
SET @id_epicerie = 'M001';

SET @id_camion = (
	SELECT TOP 1 Camion_Occupation.ID_Camion
	FROM Camion_Occupation
	INNER JOIN Camion ON Camion.ID_Camion = Camion_Occupation.ID_Camion
	INNER JOIN Livraison ON Livraison.ID_Camion = Camion.ID_Camion
	WHERE CapaciteRestante > 0 
	AND Camion_Occupation.Date_Livraison = @livraison_date
	AND Camion.ID_Epicerie = @id_epicerie
	AND Livraison.Date_Livraison = @livraison_date
);

PRINT @id_camion;

DECLARE @cl_nom VARCHAR(50);
DECLARE @cl_prenom VARCHAR(50);
DECLARE @cl_noCiv VARCHAR(10);
DECLARE @cl_noApt VARCHAR(10);
DECLARE @cl_rue VARCHAR(50);
DECLARE @cl_CP VARCHAR(10);

SET @cl_nom = 'Doe';
SET @cl_prenom = 'John';
SET @cl_noCiv = '123';
SET @cl_noApt = '456';
SET @cl_rue = 'Main St.';
SET @cl_CP = 'H1J 8C4';

INSERT INTO Client (Nom, Prenom, NoCiv, NoAppt, Rue, CP) VALUES (@cl_nom, @cl_prenom, @cl_noCiv, @cl_noApt, @cl_rue, @cl_CP);


-- 10. Procédure pour determiner si la commande est confirmée ou non (en fonction des camions et l'inventaire disponibles)
GO
CREATE OR ALTER PROCEDURE ConfirmationCommande 
    @ID_Commande int,
    @ID_Article varchar(10),
    @Quantite int,
    @ID_Zone varchar(5),
    @Date_Livraison date
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifier si l'article est disponible dans le stock de l'epicerie de la zone voulue
    IF NOT EXISTS (SELECT * FROM Inventaire inv
                   INNER JOIN Epicerie e ON inv.ID_Article = @ID_Article AND inv.Quantite >= @Quantite
                   INNER JOIN CorrespondanceCP cp ON e.CP = cp.CP_Code AND cp.ID_Secteur IN (
                        SELECT ID_Secteur FROM Secteur WHERE ID_Zone = @ID_Zone
                   ))
    BEGIN
        PRINT 'Stock insuffisant pour cet article dans les épicerie de cette zone.';
        RETURN;
    END;

    -- Determiner s'il y a un camion disponible a la date de la livraison
    IF NOT EXISTS (SELECT * FROM Camion_Occupation WHERE ID_Camion IN (
                        SELECT ID_Camion FROM Camion WHERE ID_Epicerie IN (
                            SELECT ID_Epicerie FROM Epicerie e
                            INNER JOIN CorrespondanceCP cp ON e.CP = cp.CP_Code AND cp.ID_Secteur IN (
                                SELECT ID_Secteur FROM Secteur WHERE ID_Zone = @ID_Zone
                            )
                        )
                    ) AND Date_Livraison = @Date_Livraison)
    BEGIN
        PRINT 'Aucun camion disponible pour la date de livraison spécifiée.';
        RETURN;
    END;

    PRINT 'Commande confirmée.';
    RETURN;
END;


/* 
Curseur pour afficher tous les clients
*/

DECLARE @Nom VARCHAR(50)
DECLARE @Prenom VARCHAR(50)
DECLARE @NoCiv VARCHAR(10)
DECLARE @NoAppt VARCHAR(10)
DECLARE @Rue VARCHAR(50)
DECLARE @CP VARCHAR(10)

DECLARE client_cursor CURSOR FOR
SELECT Nom, Prenom, NoCiv, NoAppt, Rue, CP FROM Client

OPEN client_cursor
FETCH NEXT FROM client_cursor INTO @Nom, @Prenom, @NoCiv, @NoAppt, @Rue, @CP

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT @Nom + ', ' + @Prenom + ', ' + @NoCiv + ' ' + ISNULL(@NoAppt, '') + ' ' + @Rue + ', ' + @CP
    FETCH NEXT FROM client_cursor INTO @Nom, @Prenom, @NoCiv, @NoAppt, @Rue, @CP
END

CLOSE client_cursor
DEALLOCATE client_cursor


-- Curseur pour mettre a jour la quantite de stock de chaque article en fonction des livraisons

DECLARE @Quantite_Livree INT
DECLARE @Quantite_En_Stock INT

DECLARE inventaire_cursor CURSOR FOR
SELECT ID_Article, SUM(Quantite) FROM Commande_Article
JOIN Livraison ON Commande_Article.ID_Commande = Livraison.ID_Commande
WHERE Livraison.Statut_Livraison = 'Livré'
GROUP BY ID_Article

OPEN inventaire_cursor
FETCH NEXT FROM inventaire_cursor INTO @ID_Article, @Quantite_Livree

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT @Quantite_En_Stock = Quantite FROM Inventaire WHERE ID_Article = @ID_Article
    IF @Quantite_En_Stock IS NOT NULL
    BEGIN
        UPDATE Inventaire SET Quantite = @Quantite_En_Stock + @Quantite_Livree WHERE ID_Article = @ID_Article
    END
    ELSE
    BEGIN
        INSERT INTO Inventaire (ID_Article, Quantite) VALUES (@ID_Article, @Quantite_Livree)
    END
    FETCH NEXT FROM inventaire_cursor INTO @ID_Article, @Quantite_Livree
END

CLOSE inventaire_cursor
DEALLOCATE inventaire_cursor


-- 1. Trigger pour empecher la modification de la table camion

GO
CREATE TRIGGER prevent_modification_cam
ON camion
INSTEAD OF UPDATE, DELETE, INSERT
AS
BEGIN
    RAISERROR('Modification interdite.', 16, 1)
    ROLLBACK TRANSACTION
END;
GO

-- 2. Trigger pour verifier si le nom d'un client commence par la lettre "M"

CREATE TRIGGER check_client_name
ON Client
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS(SELECT 1 FROM inserted WHERE Nom LIKE 'M%')
    BEGIN
        RAISERROR('Le nom du client commence par M.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
