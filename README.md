# SQL-Supermarket-Project

DDL

This SQL script file represents the Logical Database Design (LDD). The script creates the entire database structure, including tables for managing various aspects of a grocery management system, such as managers, stores, sectors, clients, teams, couriers, articles, delivery, accidents, forgotten articles, order articles, inventory, and truck occupancy. It demonstrates the database schema used to organize and manage data effectively for a comprehensive grocery management system.


DML

This SQL script file contains a series of SQL queries for the MAXI Grocery Management System, a database used to manage grocery-related data. The queries cover a wide range of functionalities and reporting requirements, from listing products in a customer's order to managing delivery teams, tracking accidents, and more. These queries are designed to extract specific information from the database for various use cases, helping the system operate efficiently.


Inserts

SQL script that populates a database with data for a grocery store management system. It includes tables for store managers, grocery stores, sectors, customers, delivery teams, couriers, and grocery items. This data serves as the foundation for managing and operating a grocery store business.


tSQL

The provided code appears to be a SQL script that defines and demonstrates the functions and procedures for a database used in a grocery store management system.

1. Functions:
- fn_trouverCP_Code: This function takes a postal code as input and returns the three-character postal code code.
- fn_trouverID_Secteur: Given a CP_Code (three-character postal code code), this function returns the corresponding ID_Secteur.
- fn_calculerNbBoites: It calculates the total number of boxes needed for a given order based on the weight of items in the order.
2. Procedures:
- sp_afficherLivraisons: This procedure is used to retrieve delivery information based on specified delivery dates and schedules.
- sp_afficherCommande: It retrieves the details of a specific order based on the provided order ID.
- sp_afficherCamions: This procedure retrieves information about available trucks for delivery based on the specified date, grocery store, and team.
- sp_afficherClients: Used to display customer information with various filter criteria such as date, address, and name.
- sp_afficherInventaire: This procedure displays the inventory of grocery items within a specified category.
- sp_creerCommande: Used for creating a new order with multiple input parameters, and it also updates the database records accordingly.
- ConfirmationCommande: A custom procedure to check if a command can be confirmed based on available stock and delivery resources.
3. Triggers:
- prevent_modification_cam: A trigger to prevent modifications (INSERT, UPDATE, DELETE) on the "camion" table.
- check_client_name: A trigger that checks if the client's name starts with the letter 'M' and raises an error if it does.
4. Cursor:
- A cursor used to iterate through and display client information.


VBA Application

VBA script used in Microsoft Excel to interact with the previous SQL database. It contains multiple subroutines, each responsible for fetching and displaying specific data from the database. These subroutines share a common structure. They start by disabling screen updating to improve performance, clear existing data in the "CONFIG" worksheet, establish a connection to the database, and execute a stored procedure (SQL function). The retrieved data is then pasted into the "CONFIG" worksheet, followed by formatting the column headers. Error handling is in place to manage any potential issues during database interactions. After the script's execution, the recordset and connection objects are properly closed and deallocated. Overall, this code streamlines the process of fetching and displaying database information in an Excel spreadsheet.
