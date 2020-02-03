
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
#Creating Database for a medium-sized music school named Cacophoné Studios in MYSQL
#Author: Krishanu Joarder
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------


#Creating the Database
CREATE SCHEMA Cacophoné_Studios;
#Creating the Parent Table- Student
USE Cacophoné_Studios;
CREATE TABLE Student
(StudentID VARCHAR (10),
First_Name CHAR (20) NOT NULL,
Last_Name CHAR (20) NOT NULL,
Phone INT NOT NULL, 
CONSTRAINT stu_pk PRIMARY KEY(StudentID),
CONSTRAINT stu_unq UNIQUE (Last_Name)
);




#Creating the Parent Table- Teachers
USE Cacophoné_Studios;
CREATE TABLE Teacher
(TeacherID VARCHAR (10),
First_Name CHAR (20) NOT NULL,
Last_Name CHAR (20) NOT NULL,
CONSTRAINT tea_pk PRIMARY KEY(TeacherID),
CONSTRAINT tea_unq UNIQUE (Last_Name)
);


#Creating the Parent Table- Subjects
USE Cacophoné_Studios;
CREATE TABLE Subjects
(SubjectID VARCHAR (10),
Course CHAR (20) NOT NULL,
StartingDate VARCHAR (20) NOT NULL,
CONSTRAINT sub_pk PRIMARY KEY(SubjectID)
);



#Creating the Junction Table- Student_Subject
USE Cacophoné_Studios;
CREATE TABLE Student_Subject
(Student_SubjectID VARCHAR (10),
StudentID VARCHAR (10),
SubjectID VARCHAR (10),
CONSTRAINT stusub_pk PRIMARY KEY (Student_SubjectID),
CONSTRAINT stusub_fk1 FOREIGN KEY (StudentID) REFERENCES student (StudentID),
CONSTRAINT stusub_fk2 FOREIGN KEY (SubjectID) REFERENCES subjects (SubjectID)
);


#Creating the Junction Table- Subject_Teacher 
USE Cacophoné_Studios;
CREATE TABLE Subject_Teacher 
(SubjectTeacherID VARCHAR (10),
TeacherID VARCHAR (10),
SubjectID VARCHAR (10),
CONSTRAINT subtea_pk PRIMARY KEY (SubjectTeacherID),
CONSTRAINT subtea_fk1 FOREIGN KEY (TeacherID) REFERENCES teacher (TeacherID),
CONSTRAINT subtea_fk2 FOREIGN KEY (SubjectID) REFERENCES subjects (SubjectID)
);