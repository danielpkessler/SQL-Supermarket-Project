-- CREATE DATABASE MAXI;
USE MAXI;

-- Suppression des tables si elles existent déjà 
DROP TABLE IF EXISTS Camion_Occupation;
DROP TABLE IF EXISTS Inventaire;
DROP TABLE IF EXISTS Commande_Article;
DROP TABLE IF EXISTS Article_Oublie;
DROP TABLE IF EXISTS Accident;
DROP TABLE IF EXISTS Livraison;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS Camion;
DROP TABLE IF EXISTS CamionCapacite;
DROP TABLE IF EXISTS Article;
DROP TABLE IF EXISTS Coursier;
DROP TABLE IF EXISTS Equipe;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS CorrespondanceCP;
DROP TABLE IF EXISTS Secteur;
DROP TABLE IF EXISTS Epicerie;
DROP TABLE IF EXISTS Gerant;
 

-- Création des tables principales 

-------------------------------------------------------------------------------------------------------------------
---TABLE GERANT
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Gerant (
    ID_Gerant VARCHAR(10) NOT NULL PRIMARY KEY,
    Prenom VARCHAR(50) NOT NULL,
    Nom VARCHAR(50) NOT NULL
);
-------------------------------------------------------------------------------------------------------------------
---TABLE EPICERIE
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Epicerie (
    ID_Epicerie VARCHAR(10) NOT NULL PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    NoCiv VARCHAR(10) NOT NULL,
    Rue VARCHAR(50) NOT NULL,
    CP VARCHAR(10) NOT NULL,
    Ville VARCHAR(50) NOT NULL,
    ID_Gerant VARCHAR(10) NOT NULL,
	ID_Zone VARCHAR(5) NOT NULL,
    FOREIGN KEY (ID_Gerant) REFERENCES Gerant(ID_Gerant)
);

-------------------------------------------------------------------------------------------------------------------
---TABLE SECTEUR
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Secteur ( 
ID_Secteur VARCHAR(10) NOT NULL PRIMARY KEY, 
Nom_Secteur VARCHAR(100) NOT NULL,
ID_Zone VARCHAR(5) NOT NULL,
ID_Epicerie_1 VARCHAR(10) NOT NULL,
ID_Epicerie_2 VARCHAR(10) NOT NULL,
ID_Epicerie_3 VARCHAR(10) NOT NULL,
FOREIGN KEY (ID_Epicerie_1) REFERENCES Epicerie(ID_Epicerie),
FOREIGN KEY (ID_Epicerie_2) REFERENCES Epicerie(ID_Epicerie),
FOREIGN KEY (ID_Epicerie_3) REFERENCES Epicerie(ID_Epicerie)
);

-------------------------------------------------------------------------------------------------------------------
---TABLE CORRESPONDANCE CODE POSTAL - SECTEUR
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE CorrespondanceCP ( 
CP_Code VARCHAR(5) NOT NULL PRIMARY KEY,
ID_Secteur VARCHAR(10) NOT NULL,  
FOREIGN KEY (ID_Secteur) REFERENCES Secteur(ID_Secteur)
);

-------------------------------------------------------------------------------------------------------------------
---TABLE CLIENTS
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Client ( 
ID_Client int IDENTITY (11001,1) NOT NULL PRIMARY KEY, 
Nom VARCHAR(50) NOT NULL, 
Prenom VARCHAR(50) NOT NULL, 
NoCiv VARCHAR(10) NOT NULL, 
NoAppt VARCHAR(10),
Rue VARCHAR(50) NOT NULL, 
CP VARCHAR(10) NOT NULL 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE EQUIPE
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Equipe ( 
ID_Equipe VARCHAR(10) NOT NULL PRIMARY KEY, 
Horaire VARCHAR(10) NOT NULL, 
ID_Epicerie VARCHAR(10) NOT NULL, 
ID_Camion VARCHAR(10) NOT NULL,
FOREIGN KEY (ID_Epicerie) REFERENCES Epicerie(ID_Epicerie) 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE COURSIER
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Coursier ( 
ID_Coursier VARCHAR(10) NOT NULL PRIMARY KEY, 
Cou_Prenom VARCHAR(50) NOT NULL, 
Cou_Nom VARCHAR(50) NOT NULL, 
ID_Equipe VARCHAR(10) NOT NULL, 
FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe) 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE ARTICLES
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Article ( 
ID_Article VARCHAR(10) NOT NULL PRIMARY KEY,
Nom VARCHAR(50) NOT NULL, 
A_Groupe VARCHAR(50) NOT NULL,
Prix DECIMAL(10,2) NOT NULL, 
Poids_Grammes DECIMAL(10,2) NOT NULL 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE CAMION-capacite
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE CamionCapacite ( 
Modele VARCHAR(50) NOT NULL PRIMARY KEY, 
Marque VARCHAR(50) NOT NULL, 
Capacite INT NOT NULL 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE CAMION
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Camion ( 
ID_Camion VARCHAR(10) NOT NULL PRIMARY KEY, 
Modele VARCHAR(50) NOT NULL, 
Annee INT NOT NULL, 
Immatriculation VARCHAR(50) NOT NULL, 
ID_Epicerie VARCHAR(10) NOT NULL, 
FOREIGN KEY (ID_Epicerie) REFERENCES Epicerie(ID_Epicerie)
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE COMMANDES
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Commande ( 
ID_Commande int identity (32001,1) NOT NULL PRIMARY KEY, 
Date_Commande DATE NOT NULL, 
Date_Livraison_Demande DATE NOT NULL, 
Statut VARCHAR(50) NOT NULL, 
ID_Client int NOT NULL, 
ID_Zone VARCHAR(10) NOT NULL, 
ID_Epicerie VARCHAR(10) NOT NULL, 
FOREIGN KEY (ID_Client) REFERENCES Client(ID_Client), 
FOREIGN KEY (ID_Epicerie) REFERENCES Epicerie(ID_Epicerie)
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE LIVRAISONS
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Livraison ( 
ID_Livraison int IDENTITY (50001,1) NOT NULL PRIMARY KEY, 
Date_Livraison DATE NOT NULL, 
Horaire_Livraison VARCHAR(10) NOT NULL,
ID_Epicerie VARCHAR(10) NOT NULL, 
ID_Commande int NOT NULL, 
ID_Equipe VARCHAR(10) NOT NULL, 
ID_Camion VARCHAR(10) NOT NULL, 
Statut_Livraison VARCHAR(50) NOT NULL, 
FOREIGN KEY (ID_Epicerie) REFERENCES Epicerie(ID_Epicerie), 
FOREIGN KEY (ID_Commande) REFERENCES Commande(ID_Commande), 
FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe), 
FOREIGN KEY (ID_Camion) REFERENCES Camion(ID_Camion) 
); 


-------------------------------------------------------------------------------------------------------------------
---TABLE ACCIDENTS
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Accident ( 
ID_Accident VARCHAR(10) NOT NULL PRIMARY KEY, 
Date_Accident DATE NOT NULL, 
Heure_Accident TIME NOT NULL, 
Type_Accident VARCHAR(50) NOT NULL, 
Description VARCHAR(500), 
ID_Camion VARCHAR(10) NOT NULL, 
FOREIGN KEY (ID_Camion) REFERENCES Camion(ID_Camion) 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE ARTICLES OUBLIES 
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Article_Oublie ( 
ID_Article_Oublie VARCHAR(10) NOT NULL PRIMARY KEY,  
Date_Oublie DATE NOT NULL, 
ID_Livraison int NOT NULL, 
FOREIGN KEY (ID_Article_Oublie) REFERENCES Article(ID_Article), 
FOREIGN KEY (ID_Livraison) REFERENCES Livraison(ID_Livraison) 
); 


-------------------------------------------------------------------------------------------------------------------
---TABLE COMMANDE DES ARTICLES
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Commande_Article ( 
ID_Commande int NOT NULL, 
ID_Article VARCHAR(10) NOT NULL, 
Quantite INT NOT NULL, 
PRIMARY KEY (ID_Commande, ID_Article), 
FOREIGN KEY (ID_Commande) REFERENCES Commande(ID_Commande), 
FOREIGN KEY (ID_Article) REFERENCES Article(ID_Article) 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE INVENTAIRE
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Inventaire ( 
ID_Article VARCHAR(10) NOT NULL PRIMARY KEY, 
Quantite INT NOT NULL, 
FOREIGN KEY (ID_Article) REFERENCES Article(ID_Article) 
); 

-------------------------------------------------------------------------------------------------------------------
---TABLE OCCUPATION CAMIONS
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE Camion_Occupation ( 
ID_Camion VARCHAR(10) NOT NULL,
Date_Livraison DATE NOT NULL,
CapaciteRestante INT NOT NULL,
PRIMARY KEY (ID_Camion, Date_Livraison),
FOREIGN KEY (ID_Camion) REFERENCES Camion(ID_Camion) 
); 
