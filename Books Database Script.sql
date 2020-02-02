-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
#Creating Books Database in MYSQL
#Author: Krishanu Joarder
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

#Creating the Database
CREATE SCHEMA books_database;

#Creating the Parent Table- Publisher
USE books_database;
CREATE TABLE Publisher
(PubID VARCHAR (10),  
Pubname VARCHAR (100),
PubCountry VARCHAR (100) NOT NULL,
CONSTRAINT pub_pk PRIMARY KEY (PubID),
CONSTRAINT pub_unq UNIQUE (Pubname)
);

#Inserting data into Publisher Table
INSERT INTO Publisher
(PubID, Pubname, PubCountry) VALUES ('P023', 'Jessica Kingsley', 'England'); 
INSERT INTO Publisher
(PubID, Pubname, PubCountry) VALUES ('P024', 'Routledge', 'England'); 
INSERT INTO Publisher
(PubID, Pubname, PubCountry) VALUES ('P025', 'Springer', 'Germany'); 
INSERT INTO Publisher
(PubID, Pubname, PubCountry) VALUES ('P026', 'International psychogeriatrics', 'United States'); 


#Creating Parent Table- Author
USE books_database;
CREATE TABLE Author
(Author_ID VARCHAR (10) NOT NULL,  
Author_Name CHAR (100) NOT NULL, 
Author_Age INT (10), 
Author_Nationality CHAR (50),
CONSTRAINT au_pk PRIMARY KEY (Author_ID),
CONSTRAINT au_name UNIQUE (Author_Name)
);

#Inserting data into Author Table
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0001', 'Rees, J.', '70', 'Australian'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0002', 'Mokyr, J.', '73', 'Israeli American'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0003', 'Neuberger, J.', '69', 'English'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0004', 'Poirier, D.R.', '70', 'Canadian'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0005', 'Geiger, G.', '60', 'American'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0006', 'Elfrink, T.R.', '75', 'French'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0007', 'Zuidema, S.U.', '69', 'Dutch'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0008', 'Kunz, M', '36', 'English'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0009', 'Westerhof, G.J.', '70', 'Australian'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0010', 'Kläger, F.', '74', 'French'); 
INSERT INTO Author
(Author_ID, Author_Name, Author_Age, Author_Nationality) 
VALUES ('AU0011', "D'hoker, E.", '64', 'Belgian-American'); 


#Creating Books Table
USE books_database;
CREATE TABLE Books
(ISBN VARCHAR (20),
Title VARCHAR (300) NOT NULL,
Author_ID VARCHAR (10),
PubID VARCHAR (100),
Price INT,
Genre VARCHAR (50),
CONSTRAINT books_pk PRIMARY KEY (ISBN),
CONSTRAINT books_fk1 FOREIGN KEY (PubID) REFERENCES Publisher (PubID),
CONSTRAINT books_fk2 FOREIGN KEY (Author_ID) REFERENCES Author (Author_ID),
CONSTRAINT books_title_unq UNIQUE (Title),
CONSTRAINT books_price CHECK (Price >0)
);


#Using Alter to drop the column Price
ALTER TABLE books DROP COLUMN Price;


#Adding back column Price
ALTER TABLE books ADD COLUMN Price int NOT NULL;



#Inserting data into Books Table

USE books_database;

INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00001', 
'Life Story Books for Adopted and Fostered Children: A Family Friendly Approach', 
'AU0001', 
'P023',
'Short Story', 
'6'); 



INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00002', 
'Looking for Mr. Nobody: the secret life of Goronwy Rees', 
'AU0001', 
'P024',
'Short Story', 
'8'); 

INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00003', 
'The Economics of the Industrial Revolution', 
'AU0002', 
'P024',
'Economics', 
'7'); 

INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00004', 
'The Moral Heart of Public Service', 
'AU0003', 
'P023',
'Society', 
'9'); 


INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00005', 
'Transport phenomena in materials processing', 
'AU0004', 
'P025',
'Transportation', 
'12'); 


INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00006', 
'Life story books for people with dementia: a systematic review', 
'AU0006', 
'P026',
'Short Story', 
'15'); 

INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00007', 
'Recovered Coherence in an Early Short Story Cycle: Rudyard Kipling’s Plain Tales from the Hills', 
'AU0010', 
'P024',
'Short Story', 
'8'); 

INSERT INTO books
(ISBN, 
Title, 
Author_ID, 
PubID, Genre, 
Price)
VALUES 
('00008', 
'Irish Women Writers and the Modern Short Story', 
'AU0011', 
'P025',
'Short Story', 
'6'); 



#Creating Bridge/Junction Table
USE books_database;
CREATE TABLE author_books
(AUBK_ID VARCHAR (10),  
ISBN VARCHAR (20) NOT NULL,
Author_ID VARCHAR (10) NOT NULL,
CONSTRAINT aubk_pk PRIMARY KEY (AUBK_ID),
CONSTRAINT aubk_fk1 FOREIGN KEY (ISBN) REFERENCES books (ISBN),
CONSTRAINT aubk_fk2 FOREIGN KEY (Author_ID) REFERENCES author (Author_ID)
);

#The Junction table consists AUBK_ID as the primary key 
# which has been created by including ISBN and Author_ID from the tables books and author respectively

#Inserting data into author_books table from books and author table
USE books_database;
INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU1_1', '00001', 'AU0001');


INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU2_1', '00002', 'AU0001');


INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU3_2', '00003', 'AU0002');


INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU4_3', '00004', 'AU0003');

INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU5_4', '00005', 'AU0004');

INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU6_6', '00006', 'AU0006');

INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU7_10', '00007', 'AU0010');

INSERT INTO author_books 
(AUBK_ID,ISBN,Author_ID)  
VALUES
('AU8_11', '00008', 'AU0011');

