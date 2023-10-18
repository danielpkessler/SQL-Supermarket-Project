USE MAXI;

---TRUNCATE TABLE Gerant;
---TRUNCATE TABLE Epicerie;
---TRUNCATE TABLE Secteur;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - GERANTS
-------------------------------------------------------------------------------------------------------------------

INSERT INTO Gerant (ID_Gerant, Prenom, Nom) VALUES 
('EMP001','Sierra','Rodriguez'),
('EMP002','Julian','Nguyen'),
('EMP003','Oliver','Patel'),
('EMP004','Isabelle','Gomez'),
('EMP005','Raymond','Singh'),
('EMP006','Nathalia','Kim'),
('EMP007','Maxime','Tremblay'),
('EMP008','Léa','Gagnon'),
('EMP009','Nicolas','Roy'),
('EMP010','Ariane','Côté'),
('EMP011','Étienne','Bouchard'),
('EMP012','Rosalie','Thibault'),
('EMP013','Louis','Morin'),
('EMP014','Gabrielle','Levesque'),
('EMP015','Antoine','Belanger'),
('EMP016','Camille','Dubois'),
('EMP017','Charles','Fortin'),
('EMP018','Florence','Bergeron'),
('EMP019','Mathis','Beaulieu'),
('EMP020','William','Mercier');

SELECT * FROM Gerant;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - EPICERIES
-------------------------------------------------------------------------------------------------------------------

INSERT INTO Epicerie (ID_Epicerie, Nom, NoCiv, Rue, CP, Ville, ID_Gerant, ID_Zone) VALUES
('M001','Maxi Montréal Sherbrooke E','7455 ','Sherbrooke St E','H1N 1E6','Montreal','EMP001','A4'),
('M002','Maxi Montréal Jean-Talon','6750 ','Rue Jean-Talon E','H1S 1N2','Montreal','EMP002','A2'),
('M003','Maxi Montréal Côte-des-Neiges','6825 ','Chem. de la Côte des Neiges','H3S 2B6','Montreal','EMP003','A7'),
('M004','Maxi Montréal Papineau','8305 ','Av. Papineau','H2M 2G2','Montreal','EMP004','A3'),
('M005','Maxi Montréal Sherbrooke E','2925 ','Sherbrooke St E','H1W 1B2','Montreal','EMP005','A4'),
('M006','Maxi Montréal Jean-Talon E','4325 ','Rue Jean-Talon E · In Centre Jean Talon','H1S 1J7','Montreal','EMP006','A2'),
('M007','Maxi Montréal Masson','2535','Rue Masson ','H1Y 1V9','Montreal','EMP007','A5'),
('M008','Maxi Montréal-Nord Pie IX','419','Montréal-Nord, Quebec','H1H 4J2','Montreal','EMP008','A4'),
('M009','Maxi Montréal Maurice-Duplessis','7605','Bd Maurice-Duplessis','H1E 6M3','Montreal','EMP009','A2'),
('M010','Maxi St-Laurent Marcel-Laurin','873','Saint-Laurent, Quebec','H4T 1V6','Montreal','EMP010','A1'),
('M011','Maxi Montréal Jean-Talon','375','Rue Jean-Talon O · In Parc','H2R 2X1','Montreal','EMP011','A2'),
('M012','Maxi Lasalle Newman','493','Lasalle, Quebec','H8N 1Z7','Montreal','EMP012','A10'),
('M013','Maxi LaSalle Dollard','820','Lasalle, Quebec · In Place Newman','H8N 3E2','Montreal','EMP013','A10'),
('M014','Maxi Saint-Laurent','496','Grenet / Bombardier','H4S 1G3','Montreal','EMP014','A1'),
('M015','Maxi Dorval Dorval','815','Dorval, Quebec · In the Jardins Dorva','H9S 5X6','Montreal','EMP015','A11'),
('M016','Maxi Verdun Wellington','494','Verdun, Quebec ','H4G 1V1','Montreal','EMP016','A10'),
('M017','Maxi Pierrefonds Pierrefonds','720','Pierrefonds-Roxboro, Quebec','H8Y 1Y2','Montreal','EMP017','A11'),
('M018','Maxi Pointe-Claire Transcanadienne','397','Pointe-Claire, Quebec','H9R 5J2','Montreal','EMP018','A11'),
('M019','Maxi Pointe-Aux-Trembles Sherbrooke E','318','Riviere-des-Prairies—Pointe-aux-Trembles, Quebec','H1A 5P4','Montreal','EMP019','A4'),
('M020','Maxi Lachine Remembrance','738','Lachine, Quebec · In Les Galeries Lachine','H8S 1B8','Montreal','EMP020','A10');

SELECT * FROM Epicerie;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - SECTEURS
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Secteur (ID_Secteur, ID_Zone, Nom_secteur, ID_Epicerie_1, ID_Epicerie_2, ID_Epicerie_3) VALUES
('S001','A3','Ahuntsic-Cartierville','M004','M002','M001'),
('S002','A4','Anjou','M001','M006','M005'),
('S003','A11','Beaconsfield','M015','M020','M018'),
('S004','A7','Côte-des-Neiges–Notre-Dame-de-Grâce','M003','M005','M002'),
('S005','A7','Côte-Saint-Luc','M003','M005','M002'),
('S006','A11','Dollard-Des-Ormeaux','M015','M017','M018'),
('S007','A11','Dorval','M015','M017','M018'),
('S008','A10','Griffintown','M012','M013','M016'),
('S009','A7','Hampstead','M012','M020','M013'),
('S010','A10','Île des Sœurs','M012','M010','M010'),
('S011','A11','Kirkland','M015','M017','M018'),
('S012','A11','L''Ile-Dorval','M015','M020','M018'),
('S013','A11','L’Île-Bizard–Sainte-Geneviève','M017','M018','M015'),
('S014','A10','Lachine','M020','M012','M013'),
('S015','A10','LaSalle','M012','M013','M020'),
('S016','A8','Le Plateau-Mont-Royal','M003','M016','M012'),
('S017','A11','Le Sud-Ouest','M015','M013','M013'),
('S018','A4','Mercier','M008','M001','M006'),
('S019','A6','Mercier–Hochelaga-Maisonneuve','M008','M005','M006'),
('S020','A8','Mont-Royal','M011','M003','M005'),
('S021','A4','Montréal-Est','M019','M009','M001'),
('S022','A4','Montréal-Nord','M019','M009','M001'),
('S023','A8','Montréal-Ouest','M003','M016','M012'),
('S024','A8','Outremont','M003','M016','M012'),
('S025','A11','Pierrefonds-Roxboro','M015','M013','M017'),
('S026','A11','Pointe-Claire','M015','M013','M017'),
('S027','A4','Rivière-des-Prairies–Pointe-aux-Trembles','M001','M002','M005'),
('S028','A5','Rosemont–La Petite-Patrie','M007','M005','M002'),
('S029','A11','Saint-François','M015','M017','M013'),
('S030','A1','Saint-Laurent','M010','M003','M002'),
('S031','A2','Saint-Léonard','M002','M006','M008'),
('S032','A11','Senneville','M017','M015','M018'),
('S033','A10','Verdun','M012','M010','M010'),
('S034','A6','Ville-Marie','M016','M003','M012'),
('S035','A5','Villeray–Saint-Michel–Parc-Extension','M007','M005','M003'),
('S036','A9','Westmount','M016','M003','M012'),
('S037','A6','Centre-Ville','M016','M003','M012');

SELECT * FROM Secteur;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - Correspondance CP
-------------------------------------------------------------------------------------------------------------------
INSERT INTO CorrespondanceCP (CP_Code, ID_Secteur) VALUES
('H2B','S001'),
('H2C','S001'),
('H2M','S001'),
('H2N','S001'),
('H3L','S001'),
('H1J','S002'),
('H1K','S002'),
('H9W','S003'),
('H3M','S007'),
('H4J','S001'),
('H4K','S001'),
('H2K','S037'),
('H2L','S037'),
('H2Z','S037'),
('H3A','S034'),
('H3B','S037'),
('H3G','S037'),
('H3H','S034'),
('H5B','S037'),
('H3S','S004'),
('H3T','S004'),
('H3V','S004'),
('H3W','S004'),
('H4V','S004'),
('H4W','S004'),
('H9A','S006'),
('H9B','S006'),
('H9G','S006'),
('H4Y','S007'),
('H9P','S007'),
('H3C','S008'),
('H3X','S009'),
('H1W','S019'),
('H3E','S014'),
('H9J','S011'),
('H9S','S026'),
('H8S','S014'),
('H8T','S014'),
('H8N','S015'),
('H8P','S015'),
('H1V','S019'),
('H1L','S019'),
('H1M','S019'),
('H1N','S019'),
('H3P','S020'),
('H3R','S020'),
('H4P','S020'),
('H1B','S021'),
('H1G','S021'),
('H1H','S021'),
('H4X','S021'),
('H4A','S004'),
('H4B','S023'),
('H2V','S024'),
('H3N','S035'),
('H3J','S035'),
('H2G','S028'),
('H2S','S028'),
('H8Z','S025'),
('H5A','S037'),
('H2H','S020'),
('H2J','S020'),
('H2T','S020'),
('H2W','S020'),
('H2X','S020'),
('H3K','S026'),
('H1A','S027'),
('H9R','S026'),
('H1C','S027'),
('H1T','S028'),
('H1X','S028'),
('H1Y','S028'),
('H8Y','S025'),
('H7B','S025'),
('H4C','S017'),
('H4L','S030'),
('H4M','S030'),
('H4N','S030'),
('H4R','S030'),
('H4S','S030'),
('H4T','S030'),
('H1P','S031'),
('H1R','S031'),
('H1S','S031'),
('H1Z','S035'),
('H2A','S035'),
('H9X','S013'),
('H7X','S013'),
('H9H','S013'),
('H9K','S013'),
('H4G','S033'),
('H4H','S033'),
('H2Y','S037'),
('H3Y','S036'),
('H3Z','S036');

SELECT * FROM CorrespondanceCP;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - CLIENTS *MANUELLEMENT, AUTREMENT QUE PAR LA PROCEDURE
-------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT Client ON; 
GO
INSERT INTO CLIENT (ID_Client, Nom, Prenom, NoCiv, NoAppt, Rue, CP) VALUES
(11001,'Tremblay','Jean-Pierre','463','867','Rue Saint-Jacques','H2Y 1M6'),
(11002,'Gagnon','Catherine','1870',NULL,'Avenue des Pins Est','H2W 1N5'),
(11003,'Bélanger','Luc','473','393','Rue Saint-Urbain','H2Z 1W4'),
(11004,'Dubé','Émilie','690','78','Rue Saint-Patrick','H4E 1A4'),
(11005,'Lavoie','Philippe','1416','809','Avenue Henri-Julien','H2T 2M2'),
(11006,'Thibault','Isabelle','661','105','Boulevard Pie-IX','H1V 2C8'),
(11007,'Roy','Marc-Antoine','1947','595','Avenue de Lorimier','H2K 3V4'),
(11008,'Deschamps','Sylvie','417','113','Rue de la Roche','H2S 2E3'),
(11009,'Leclerc','François','1511','315','Rue Masson','H2H 1B4'),
(11010,'Dionne','Stéphanie','141','877','Rue Rachel Est','H2J 2M1'),
(11011,'Lapierre','Alexandre','1726','879','Rue Beaubien Est','H2S 1T9'),
(11012,'Gagné','Gabrielle','1396', NULL,'Avenue Papineau','H2K4J5'),
(11013,'Beaulieu','Martin','1938', NULL,'Rue Sainte-Catherine Est','H2L 2G9'),
(11014,'Morin','Marie-Josée','753','444','Boulevard René-Lévesque Est','H2X 3Y5'),
(11015,'Dubois','Pierre-Luc','1555','27','Rue Sherbrooke Est','H1N 1C9'),
(11016,'Boucher','Annie','471','799','Avenue des Canadiens-de-Montréal','H3B 0G1'),
(11017,'Lemay','Mathieu','558', NULL,'Rue Saint-Antoine Ouest','H2Y 0A3'),
(11018,'Bertrand','Chantal','536', NULL,'Rue Peel','H3B 2T6'),
(11019,'Pelletier','Nicolas','99','414','Avenue Atwater','H3Z 1X5'),
(11020,'Gauthier','Amélie','1701','294','Rue Guy','H3H 2L9'),
(11021,'Caron','Vincent','363','826','Rue Crescent','H3G 2B8'),
(11022,'Lévesque','Pascale','1802','798','Rue Bishop','H3G 2E8'),
(11023,'Béliveau','Sébastien','1724','17','Rue de la Montagne','H3G 1Z7'),
(11024,'Thériault','Évelyne','1732','715','Rue Saint-Mathieu','H3H 2H4'),
(11025,'Boudreau','Michel','1741',NULL,'Rue Drummond','H3G 1W7'),
(11026,'Beauchamp','Karine','1493', NULL,'Rue Stanley','H3B 2S5'),
(11027,'Barbeau','Maxime','1542','646','Boulevard de Maisonneuve Ouest','H3G 1M8'),
(11028,'Fournier','Caroline','1056', NULL,'Rue Sainte-Catherine Ouest','H3B 1A7'),
(11029,'Bégin','Guillaume','415','946','Avenue McGill College','H3A 0G3'),
(11030,'Tremblay','Émilie','1130', NULL,'Rue Saint-Denis','H2X 3K8'),
(11031,'Gagnon','Frédéric','757','927','Boulevard Saint-Laurent','H2T 1S1'),
(11032,'Martin','Valérie','272','818','Rue Saint-Hubert','H2S 2M9'),
(11033,'Lapointe','Jean-Philippe','1878', NULL,'Avenue Christophe-Colomb','H2S 1J6'),
(11034,'Gauthier','Nathalie','499', NULL,'Rue Saint-Laurent','H2W 1Y9'),
(11035,'Desrosiers','Éric','1029', NULL,'Avenue du Parc','H2W 1R1'),
(11036,'Renaud','Geneviève','281', NULL,'Avenue du Mont-Royal Est','H2J 1Y8'),
(11037,'Dubois','Louis-Philippe','1481','347','Rue Laurier Est','H2T 1R5'),
(11038,'Girard','Joanie','1515', NULL,'Avenue Mont-Royal Ouest','H2T 2S9'),
(11039,'Poirier','Patrick','1425','286','Rue Saint-Viateur Est','H2T 1C6'),
(11040,'Bernard','Mélanie','1115', NULL,'Rue Bernard Ouest','H2T 2K5'),
(11041,'Lachance','Jérôme','1411','386','Avenue du Parc-La Fontaine','H2L 1R5'),
(11042,'Dubé','Josée','1496', NULL,'Avenue du Parc-Extension','H3N 1M8'),
(11043,'Gaudreau','Simon','1585',NULL,'Rue de Verdun','H4H 1K2'),
(11044,'Dubois','Isabelle','673', NULL,'Rue Wellington','H3C 1T3'),
(11045,'Côté','François','1954','539','Rue Saint-Paul Ouest','H2Y 1Y6'),
(11046,'Dubois','Marie-Claude','61', NULL,'Avenue Laurier Ouest','H2V 2K8'),
(11047,'Bouchard','Michel','1109', NULL,'Rue Fleury Est','H2C 1P9'),
(11048,'Côté','Sophie','989','681','Boulevard Henri-Bourassa Est','H1G 5W9'),
(11049,'Gagné','David','38','616','Boulevard Gouin Ouest','H8Z 1W9'),
(11050,'Bertrand','Nathalie','581','448','Rue Beaubien Ouest','H2S 1T9');
SET IDENTITY_INSERT Client OFF; 
GO
SELECT * FROM Client;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - EQUIPES
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Equipe (ID_Equipe, Horaire, ID_Epicerie, ID_Camion) VALUES
('E1','Jour','M001','KDF-987'),
('E2','Jour','M002','PWO-452'),
('E3','Jour','M003','JTY-642'),
('E4','Jour','M004','LKG-874'),
('E5','Jour','M005','FDS-276'),
('E6','Jour','M006','QWE-103'),
('E7','Jour','M007','AZX-590'),
('E8','Jour','M008','VBN-789'),
('E9','Jour','M009','UYH-431'),
('E10','Jour','M010','CDR-998'),
('E11','Jour','M011','TGB-765'),
('E12','Jour','M012','ZAQ-222'),
('E13','Jour','M013','XSW-666'),
('E14','Jour','M014','NHJ-004'),
('E15','Jour','M015','MJI-856'),
('E16','Jour','M016','BGT-937'),
('E17','Jour','M017','VCF-201'),
('E18','Jour','M018','SXD-518'),
('E19','Jour','M019','KLO-119'),
('E20','Jour','M020','POI-332'),
('E21','Soir','M001','DFR-900'),
('E22','Soir','M002','FDE-274'),
('E23','Soir','M003','WSD-649'),
('E24','Soir','M004','RFG-076'),
('E25','Soir','M005','XCD-452'),
('E26','Soir','M006','YTR-123'),
('E27','Soir','M007','UJM-345'),
('E28','Soir','M008','IOP-789'),
('E29','Soir','M009','HGF-451'),
('E30','Soir','M010','VRT-603'),
('E31','Soir','M011','KIJ-839'),
('E32','Soir','M012','MNB-576'),
('E33','Soir','M013','WER-981'),
('E34','Soir','M014','ZXC-125'),
('E35','Soir','M015','ASD-777'),
('E36','Soir','M016','QAZ-394'),
('E37','Soir','M017','EDW-520'),
('E38','Soir','M018','LKY-642'),
('E39','Soir','M019','UIO-825'),
('E40','Soir','M020','GFD-168');

SELECT * FROM Equipe;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - COURSIERS
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Coursier (ID_Coursier, Cou_Nom, Cou_Prenom, ID_Equipe) VALUES
('C1001', 'Bauer', 'Louis', 'E1'),
('C1002', 'Becker', 'Jeanne', 'E2'),
('C1003', 'Berger', 'Gabriel', 'E3'),
('C1004', 'Braun', 'Camille', 'E4'),
('C1005', 'Brandt', 'Théo', 'E5'),
('C1006', 'Busch', 'Léa', 'E6'),
('C1007', 'Böhm', 'Lucas', 'E7'),
('C1008', 'Dietrich', 'Zoé', 'E8'),
('C1009', 'Döring', 'Romain', 'E9'),
('C1010', 'Ebert', 'Elodie', 'E10'),
('C1011', 'Ehrlich', 'Adrien', 'E11'),
('C1012', 'Engel', 'Jade', 'E12'),
('C1013', 'Fink', 'Maxime', 'E13'),
('C1014', 'Fischer', 'Manon', 'E14'),
('C1015', 'Franke', 'Hugo', 'E15'),
('C1016', 'Friedrich', 'Olivia', 'E16'),
('C1017', 'Fröhlich', 'Baptiste', 'E17'),
('C1018', 'Geyer', 'Emma', 'E18'),
('C1019', 'Giese', 'Antoine', 'E19'),
('C1020', 'Graf', 'Chloé', 'E20'),
('C1021', 'Greiner', 'Pierre', 'E21'),
('C1022', 'Groß', 'Juliette', 'E22'),
('C1023', 'Günther', 'Timothée', 'E23'),
('C1024', 'Haas', 'Lina', 'E24'),
('C1025', 'Hartmann', 'Nicolas', 'E25'),
('C1026', 'Heine', 'Charlotte', 'E26'),
('C1027', 'Heinrich', 'Clément', 'E27'),
('C1028', 'Heller', 'Lucie', 'E28'),
('C1029', 'Herrmann', 'Mathis', 'E29'),
('C1030', 'Herzog', 'Pauline', 'E1'),
('C1031', 'Hoffmann', 'Benjamin', 'E2'),
('C1032', 'Huber', 'Margaux', 'E3'),
('C1033', 'Jacob', 'Victor', 'E4'),
('C1034', 'Jäger', 'Célia', 'E5'),
('C1035', 'Kaiser', 'Guillaume', 'E6'),
('C1036', 'Keller', 'Eva', 'E7'),
('C1037', 'Kirsch', 'Mathieu', 'E8'),
('C1038', 'Klein', 'Axelle', 'E9'),
('C1039', 'Koch', 'Simon', 'E10'),
('C1040', 'Krause', 'Aurore', 'E11'),
('C1041', 'Kuhn', 'Damien', 'E12'),
('C1042', 'Lange', 'Océane', 'E13'),
('C1043', 'Lehmann', 'Jules', 'E14'),
('C1044', 'Lindner', 'Anaïs', 'E15'),
('C1045', 'Lutz', 'Valentin', 'E16'),
('C1046', 'Maier', 'Morgane', 'E17'),
('C1047', 'Mayer', 'Luc', 'E18'),
('C1048', 'Meier', 'Audrey', 'E19'),
('C1049', 'Menzel', 'Alexandre', 'E20'),
('C1050', 'Müller', 'Marion', 'E21'),
('C1051', 'Neubauer', 'Rémi', 'E22'),
('C1052', 'Neumann', 'Élise', 'E23'),
('C1053', 'Nitsche', 'Florent', 'E24'),
('C1054', 'Ostermann', 'Lou', 'E25'),
('C1055', 'Otto', 'Quentin', 'E26'),
('C1056', 'Pfeiffer', 'Emilie', 'E27'),
('C1057', 'Pohl', 'Thibaut', 'E28'),
('C1058', 'Richter', 'Mélissa', 'E29'),
('C1059', 'Ritter', 'Sylvain', 'E1'),
('C1060', 'Roth', 'Laura', 'E2'),
('C1061', 'Sauer', 'François', 'E3'),
('C1062', 'Schäfer', 'Hélène', 'E4'),
('C1063', 'Schiller', 'Lucas', 'E5'),
('C1064', 'Schmidt', 'Fanny', 'E6'),
('C1065', 'Schneider', 'Axel', 'E7'),
('C1066', 'Scholz', 'Carole', 'E8'),
('C1067', 'Schulze', 'Grégoire', 'E9'),
('C1068', 'Schumacher', 'Elsa', 'E10'),
('C1069', 'Schuster', 'Sébastien', 'E11'),
('C1070', 'Schwarz', 'Léna', 'E12'),
('C1071', 'Seidel', 'Mathias', 'E13'),
('C1072', 'Simon', 'Julie', 'E14'),
('C1073', 'Sommer', 'Thibault', 'E15'),
('C1074', 'Stein', 'Lucie', 'E16'),
('C1075', 'Steiner', 'Brice', 'E17'),
('C1076', 'Strauss', 'Pauline', 'E18'),
('C1077', 'Vogel', 'Corentin', 'E19'),
('C1078', 'Vogt', 'Léa', 'E20'),
('C1079', 'Wagner', 'Théophile', 'E21'),
('C1080', 'Walter', 'Manon', 'E22'),
('C1081', 'Weber', 'David', 'E23'),
('C1082', 'Weiß', 'Louane', 'E24'),
('C1083', 'Werner', 'Robin', 'E25'),
('C1084', 'Winkler', 'Margaux', 'E26'),
('C1085', 'Winter', 'Damien', 'E27'),
('C1086', 'Wirth', 'Solène', 'E28'),
('C1087', 'Zimmermann', 'Valentin', 'E29');

SELECT * FROM Coursier;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - articles
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Article (ID_Article, A_Groupe, Nom, Prix, Poids_Grammes) VALUES
('AR001','Meat','Viande hachée',8.00,500),
('AR002','Meat','Poulet',8.00,1.000),
('AR003','Meat','Poisson',15.00,250),
('AR004','Meat','Saumon',20.00,600),
('AR005','Meat','Crevettes',20.00,250),
('AR006','Meat','Steak',20.00,150),
('AR007','Meat','Jambon',8.00,500),
('AR008','Meat','Bacon',4.00,1.500),
('AR009','Meat','Saucisses',12.00,750),
('AR010','Dairy','Lait',20.00,150),
('AR011','Dairy','Beurre',4.00,500),
('AR012','Dairy','Fromage',12.00,300),
('AR013','Dairy','Yaourt',2.50,150),
('AR014','Dairy','Lait concentré sucré',3.00,300),
('AR015','Fruits','Aricots Verts',5.00,300),
('AR016','Fruits','Pommes',3.00,500),
('AR017','vegetables','Salade',2.40,1.000),
('AR018','vegetables','Tomates',1.50,150),
('AR019','vegetables','Oignons',2.00,500),
('AR020','vegetables','Ail',1.50,500),
('AR021','vegetables','Pommes de terre',2.00,100),
('AR022','Grains','Pain',1.00,1.500),
('AR023','Grains','Riz',2.00,750),
('AR024','Grains','Pâtes',1.00,750),
('AR025','Grains','Pain grillé',1.50,400),
('AR026','Grains','Farine',5.00,500),
('AR027','Sauces','Sauce tomate',3.00,250),
('AR028','Sauces','Huile d''olive',0.50,500),
('AR029','Sauces','Vinaigre balsamique',0.50,100),
('AR030','Sauces','Sel',1.20,50),
('AR031','Sauces','Poivre',5.00,250),
('AR032','Sauces','Épices',3.00,75),
('AR033','Sauces','Confiture',2.00,1.000),
('AR034','Sauces','Miel',1.50,2.000),
('AR035','Sauces','Sirop d''érable',0.50,1.500),
('AR036','Sauces','Nutella',1.50,1.500),
('AR037','Sauces','Sucre',11.50,1.500),
('AR038','Beverages','Café',2.00,750),
('AR039','Beverages','Thé',1.50,150),
('AR040','Beverages','Jus de fruits',4.50,150),
('AR041','Beverages','Soda',1.00,150),
('AR042','Beverages','Eau en bouteille',3.00,150),
('AR043','Beverages','Bière',12,400),
('AR044','Beverages','Vin',2.50,375),
('AR045','Beverages','eau petillante',3.00,375),
('AR046','Snacks','Chips',6.00,375),
('AR047','Snacks','Biscuits',4.50,375),
('AR048','Snacks','Chocolat',2.00,375),
('AR049','Snacks','Bonbons',1.00,397),
('AR050','Snacks','Céréales',1.50,1.000);

SELECT * FROM Article;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - INVENTAIRE
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Inventaire (ID_Article, Quantite) VALUES
('AR001',100),
('AR002',100),
('AR003',100),
('AR004',100),
('AR005',100),
('AR006',100),
('AR007',100),
('AR008',100),
('AR009',100),
('AR010',100),
('AR011',100),
('AR012',100),
('AR013',100),
('AR014',100),
('AR015',100),
('AR016',100),
('AR017',100),
('AR018',100),
('AR019',100),
('AR020',100),
('AR021',100),
('AR022',100),
('AR023',100),
('AR024',100),
('AR025',100),
('AR026',100),
('AR027',100),
('AR028',100),
('AR029',100),
('AR030',100),
('AR031',100),
('AR032',100),
('AR033',100),
('AR034',100),
('AR035',100),
('AR036',100),
('AR037',100),
('AR038',100),
('AR039',100),
('AR040',100),
('AR041',100),
('AR042',100),
('AR043',100),
('AR044',100),
('AR045',100),
('AR046',100),
('AR047',100),
('AR048',100),
('AR049',100),
('AR050',100);

SELECT * FROM Inventaire;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - capacite des camions par modele
-------------------------------------------------------------------------------------------------------------------
 INSERT INTO CamionCapacite (Modele, Marque, Capacite) VALUES  
('Ford Transit','Ford Motor',20),
('Titan XD','Nissan Motor',10),
('Equinox','Chevrolet',5),
('Sprinter','Mercedes-Benz',10),
('Savana','GMC',20),
('RAV4','Toyota',5),
('CX-5','Mazda',5),
('NV Cargo','Nissan Motor',15),
('Ford E-Series','Ford Motor',20);

SELECT * FROM CamionCapacite;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - CAMION
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Camion (ID_Camion, Modele, Annee, Immatriculation, ID_Epicerie) VALUES 
 ('KDF-987','Ford Transit',2002,'FJ5792','M001'),
 ('PWO-452','Titan XD',2018,'FL6748','M002'),
 ('JTY-642','Equinox',1994,'FP3479','M003'),
 ('LKG-874','Sprinter',2004,'FA8934','M004'),
 ('FDS-276','Savana',2008,'FG1298','M005'),
 ('QWE-103','RAV4',2000,'FM4532','M006'),
 ('AZX-590','CX-5',2017,'FS2143','M007'),
 ('VBN-789','Ford Transit',2011,'FX1092','M008'),
 ('UYH-431','Titan XD',1993,'FY3251','M009'),
 ('CDR-998','Equinox',1998,'FC7649','M010'),
 ('TGB-765','Sprinter',2010,'FH4521','M011'),
 ('ZAQ-222','Savana',2003,'FK8713','M012'),
 ('XSW-666','RAV4',1992,'FQ2314','M013'),
 ('NHJ-004','CX-5',2007,'FZ7451','M014'),
 ('MJI-856','Ford Transit',2013,'FN6789','M015'),
 ('BGT-937','Titan XD',2016,'FT2901','M016'),
 ('VCF-201','Equinox',2001,'FB9832','M017'),
 ('SXD-518','Sprinter',2019,'FR5682','M018'),
 ('KLO-119','Savana',1997,'FD3276','M019'),
 ('POI-332','RAV4',1996,'FV1567','M020'),
 ('DFR-900','CX-5',2009,'FG6821','M001'),
 ('FDE-274','Ford Transit',1999,'FL2145','M002'),
 ('WSD-649','NV Cargo',2021,'FP9786','M003'),
 ('RFG-076','Equinox',1991,'FA4567','M004'),
 ('XCD-452','Sprinter',2014,'FM8214','M005'),
 ('YTR-123','Savana',2015,'FS6934','M006'),
 ('UJM-345','RAV4',2005,'FX3194','M007'),
 ('IOP-789','CX-5',2006,'FY5673','M008'),
 ('HGF-451','Ford E-Series',2012,'FC1093','M009'),
 ('VRT-603','NV Cargo',2013,'FH2874','M010'),
 ('KIJ-839','Equinox',1995,'FK9351','M011'),
 ('MNB-576','Sprinter',2008,'FQ6743','M012'),
 ('WER-981','Savana',2007,'FZ8793','M013'),
 ('ZXC-125','RAV4',2019,'FN5632','M014'),
 ('ASD-777','CX-5',1993,'FT3241','M015'),
 ('QAZ-394','Ford E-Series',2000,'FB6719','M016'),
 ('EDW-520','NV Cargo',2017,'FR5467','M017'),
 ('LKY-642','Equinox',2011,'FD3412','M018'),
 ('UIO-825','Sprinter',2009,'FV7846','M019'),
 ('GFD-168','Savana',2002,'FG4531','M020');


SELECT * FROM Camion;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - COMMANDES - CONFIRMEES
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Commande (Date_Commande, Date_Livraison_Demande, Statut, ID_Client, ID_Zone, ID_Epicerie) VALUES 
('01/04/2023','2023-04-03','Confirme',11001,'A6','M016'),
('01/04/2023','2023-04-03','Confirme',11002,'A9','M016'),
('01/04/2023','2023-04-03','Confirme',11003,'A6','M016'),
('01/04/2023','2023-04-03','Confirme',11004,'A10','M012'),
('01/04/2023','2023-04-03','Confirme',11005,'A9','M016'),
('01/04/2023','2023-04-03','Confirme',11006,'A6','M016'),
('01/04/2023','2023-04-03','Confirme',11007,'A6','M016'),
('01/04/2023','2023-04-03','Confirme',11008,'A5','M007'),
('01/04/2023','2023-04-03','Confirme',11009,'A8','M003');

SELECT * FROM Commande;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - LIVRAISONS
-------------------------------------------------------------------------------------------------------------------
SET IDENTITY_INSERT Livraison ON; 
GO

INSERT INTO Livraison (ID_Livraison, Date_Livraison, Horaire_Livraison, ID_Epicerie, ID_Commande, ID_Equipe, ID_Camion, Statut_Livraison) VALUES 
(50001, '2023-04-03', 'Jour', 'M016', 32002, 'E16', 'BGT-937', 'Confirme'),
(50002, '2023-04-03', 'Jour', 'M007', 32001, 'E7', 'AZX-590', 'Confirme'),
(50003, '2023-04-03', 'Soir', 'M016', 32003, 'E36', 'BGT-937', 'En transit'),
(50004, '2023-04-03', 'Jour', 'M016', 32004, 'E16', 'BGT-937', 'Confirme'),
(50005, '2023-04-04', 'Jour', 'M012', 32005, 'E12', 'ZAQ-222', 'Confirme'),
(50006, '2023-04-04', 'Soir', 'M016', 32006, 'E36', 'BGT-937', 'Confirme'),
(50007, '2023-04-04', 'Soir', 'M016', 32007, 'E16', 'BGT-937', 'Confirme'),
(50008, '2023-04-04', 'Jour', 'M007', 32008, 'E7', 'BGT-937', 'En transit'),
(50009, '2023-04-05', 'Jour', 'M007', 32009, 'E7', 'AZX-590', 'Confirme');

SET IDENTITY_INSERT Livraison OFF; 
GO

SELECT * FROM Livraison;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - ACCIDENT CAMION
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Accident (ID_Accident, Date_Accident, Heure_Accident, Type_Accident, Description, ID_Camion) VALUES 
('ACC001', '2023-04-03', '12:33', 'Collision', 'Vehicule a percute le luminaire', 'PWO-452'),
('ACC002', '2023-02-20', '14:33', 'Collision', 'Vehicule a percute le client', 'LKG-874'),
('ACC003', '2022-12-01', '09:33', 'Collision', 'Vehicule a percute le gerant', 'XSW-666'),
('ACC004', '2023-01-15', '22:33', 'Collision', 'Vehicule a percute les coursiers', 'QWE-103');

SELECT * FROM Accident;

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - camion occupation
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Camion_Occupation (ID_Camion, Date_Livraison, CapaciteRestante) VALUES 
('KDF-987', '2023-04-03', 20),
('PWO-452', '2023-04-03', 10),
('JTY-642', '2023-04-03', 5),
('LKG-874', '2023-04-03', 10),
('FDS-276', '2023-04-03', 20),
('QWE-103', '2023-04-03', 5),
('AZX-590', '2023-04-03', 5),
('VBN-789', '2023-04-03', 20),
('UYH-431', '2023-04-03', 10),
('CDR-998', '2023-04-03', 5),
('TGB-765', '2023-04-03', 10),
('ZAQ-222', '2023-04-03', 20),
('XSW-666', '2023-04-03', 5),
('NHJ-004', '2023-04-03', 5),
('MJI-856', '2023-04-03', 20),
('BGT-937', '2023-04-03', 10),
('VCF-201', '2023-04-03', 5),
('SXD-518', '2023-04-03', 10),
('KLO-119', '2023-04-03', 20),
('POI-332', '2023-04-03', 5),
('DFR-900', '2023-04-03', 5),
('FDE-274', '2023-04-03', 20),
('WSD-649', '2023-04-03', 15),
('RFG-076', '2023-04-03', 5),
('XCD-452', '2023-04-03', 10),
('YTR-123', '2023-04-03', 20),
('UJM-345', '2023-04-03', 5),
('IOP-789', '2023-04-03', 5),
('HGF-451', '2023-04-03', 20),
('VRT-603', '2023-04-03', 15),
('KIJ-839', '2023-04-03', 5),
('MNB-576', '2023-04-03', 10),
('WER-981', '2023-04-03', 20),
('ZXC-125', '2023-04-03', 5),
('ASD-777', '2023-04-03', 5),
('QAZ-394', '2023-04-03', 20),
('EDW-520', '2023-04-03', 15),
('LKY-642', '2023-04-03', 5),
('UIO-825', '2023-04-03', 10),
('GFD-168', '2023-04-03', 20)

SELECT * FROM Camion_Occupation;
-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - Articles oublies
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Article_Oublie (ID_Article_Oublie, Date_Oublie, ID_Livraison) VALUES 
('AR014', '03/04/2023', 50001),
('AR022', '03/04/2023', 50001),
('AR019', '03/04/2023', 50001);

-------------------------------------------------------------------------------------------------------------------
---INSERTION DES DONNEES - Articles commandés
-------------------------------------------------------------------------------------------------------------------
INSERT INTO Commande_Article (ID_Commande, ID_Article, Quantite) VALUES 
(32002, 'AR005', 4),
(32002, 'AR022', 10),
(32002, 'AR015', 40),
(32002, 'AR023', 3),
(32002, 'AR011', 22),
(32002, 'AR021', 55),
(32003, 'AR005', 4),
(32003, 'AR022', 10),
(32003, 'AR015', 40),
(32003, 'AR023', 3),
(32003, 'AR011', 22),
(32003, 'AR021', 55),
(32003, 'AR016', 1),
(32003, 'AR017', 5),
(32004, 'AR004', 1),
(32004, 'AR018', 5),
(32004, 'AR019', 3),
(32004, 'AR014', 2),
(32004, 'AR050', 2),
(32004, 'AR044', 1),
(32004, 'AR015', 20),
(32004, 'AR016', 10),
(32004, 'AR045', 24),
(32004, 'AR017', 2),
(32004, 'AR021', 1),
(32004, 'AR025', 2),
(32004, 'AR008', 2),
(32004, 'AR010', 3),
(32005, 'AR024', 4),
(32005, 'AR027', 12),
(32005, 'AR034', 1),
(32005, 'AR045', 24),
(32005, 'AR029', 1),
(32005, 'AR043', 12),
(32005, 'AR026', 1),
(32006, 'AR047', 2),
(32006, 'AR021', 1),
(32007, 'AR034', 1),
(32007, 'AR046', 2),
(32007, 'AR024', 3),
(32007, 'AR002', 2),
(32008, 'AR039', 2),
(32008, 'AR041', 12),
(32008, 'AR050', 3),
(32009, 'AR035', 3),
(32009, 'AR048', 10);

SELECT * FROM Commande_Article;
