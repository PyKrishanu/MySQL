-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
#Creating Database for a mail order company dealing in bakery products using MYSQL
#Author: Krishanu Joarder
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------


#Creating the Database
CREATE SCHEMA Cakes_Fudges;
#Creating the Parent Table- Supplier
USE Cakes_Fudges;
CREATE TABLE Supplier
(SupplierID VARCHAR (10),
SupplierName CHAR (20) NOT NULL,
Phone INT NOT NULL, 
Manufacturing_address VARCHAR (100),
CONSTRAINT sup_pk PRIMARY KEY(SupplierID),
CONSTRAINT sup_unq UNIQUE (SupplierName)
);


#Creating the Parent Table- Ingredients
USE Cakes_Fudges;
CREATE TABLE Ingredients
(Ingredient_name CHAR (20),
SupplierID VARCHAR (10) NOT NULL,
Stock_lbs INT (10),
Price_PerUnit INT (10),
CONSTRAINT ing_pk PRIMARY KEY (Ingredient_name),
CONSTRAINT ing_fk FOREIGN KEY (SupplierID) REFERENCES supplier (SupplierID)
);

#Creating the Parent Table- Chef
USE Cakes_Fudges;
CREATE TABLE chef
(ChefID VARCHAR (10),
ChefName CHAR (20) NOT NULL,
Phone INT NOT NULL, 
Chef_address VARCHAR (100),
CONSTRAINT chef_pk PRIMARY KEY(ChefID),
CONSTRAINT chef_unq UNIQUE (ChefName)
);


#Creating the Parent Table- Customer
USE Cakes_Fudges;
CREATE TABLE customer
(CustomerUID VARCHAR (10),
CustomerName CHAR (20) NOT NULL,
Phone INT NOT NULL, 
Customer_address VARCHAR (100),
CONSTRAINT cust_pk PRIMARY KEY(CustomerUID),
CONSTRAINT cust_unq UNIQUE (CustomerName)
);


#Creating Dishes Table

USE Cakes_Fudges;
CREATE TABLE dishes
(Dish_name CHAR (20),
ChefID VARCHAR (10),
Preparation_time INT,
OrderStatus CHAR (20),
Price INT,
CONSTRAINT dishes_pk PRIMARY KEY (Dish_name),
CONSTRAINT dishes_fk FOREIGN KEY (ChefID) REFERENCES chef (ChefID)
);




#Creating the Junction Table- Dish_Ingredients

USE Cakes_Fudges;
CREATE TABLE Dish_Ingredients
(Dish_ingredients VARCHAR (10),
Dish_name CHAR (20),
Ingredient_name CHAR (20),
Quantity_name INT (10),
CONSTRAINT di_pk PRIMARY KEY (Dish_ingredients),
CONSTRAINT di_fk1 FOREIGN KEY (Dish_name) REFERENCES dishes (Dish_name),
CONSTRAINT di_fk2 FOREIGN KEY (Ingredient_name) REFERENCES Ingredients (Ingredient_name)
);


#Creating the Orders Table
USE Cakes_Fudges;
CREATE TABLE Orders
(OrderID VARCHAR (10),
Dish_name CHAR (20),
CustomerUID VARCHAR (10),
Order_date VARCHAR (10),
Delivery_date VARCHAR (10),
Payment_mode CHAR (20),
CONSTRAINT ord_pk PRIMARY KEY (OrderID),
CONSTRAINT ord_fk1 FOREIGN KEY (Dish_name) REFERENCES dishes (Dish_name),
CONSTRAINT ord_fk2 FOREIGN KEY (CustomerUID) REFERENCES customer (CustomerUID)
);

#Creating the Junction Table- orders_dish
USE Cakes_Fudges;
CREATE TABLE orders_dish
(orders_dishID VARCHAR (10),
OrderID VARCHAR (10),
Dish_name CHAR (20),
Quantity_lbs INT,
Price INT,
CONSTRAINT ordish_pk PRIMARY KEY (orders_dishID),
CONSTRAINT ordish_fk1 FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
CONSTRAINT ordish_fk2 FOREIGN KEY (Dish_name) REFERENCES dishes (Dish_name)
);



