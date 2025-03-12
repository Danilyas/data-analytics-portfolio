
CREATE DATABASE university;

USE university;

CREATE TABLE Address (
    Id INT PRIMARY KEY NOT NULL,
    Country VARCHAR(30) NOT NULL,
    City VARCHAR(30) NOT NULL,
    Street VARCHAR(200) NOT NULL,
    Number INT
);

CREATE TABLE Person (
    Id INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(14) NOT NULL,
    BirthDate DATE NOT NULL,
    AddressId INT NOT NULL,
    FOREIGN KEY (AddressId) REFERENCES Address(Id)
);

CREATE TABLE Student (
    Id INT PRIMARY KEY NOT NULL,
    PersonId INT NOT NULL,
    Description VARCHAR(200) NOT NULL,
    FOREIGN KEY (PersonId) REFERENCES Person(Id)
);

CREATE TABLE Teacher (
    Id INT PRIMARY KEY NOT NULL,
    Position VARCHAR(50) NOT NULL,
    PersonId INT NOT NULL,
    FOREIGN KEY (PersonId) REFERENCES Person(Id)
);

CREATE TABLE Course (
    Id INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Credits INT NOT NULL,
    Description VARCHAR(255) NOT NULL,
    TeacherId INT NOT NULL,
    FOREIGN KEY (TeacherId) REFERENCES Teacher(Id)
);

INSERT INTO Address VALUES
(1, 'Country1', 'City1', 'Street1', 123),
(2, 'Country2', 'City2', 'Street2', 456),
(3, 'Country3', 'City3', 'Street3', 789),
(4, 'Country4', 'City4', 'Street4', 101),
(5, 'Country5', 'City5', 'Street5', 202),
(6, 'Country6', 'City6', 'Street6', 1415),
(7, 'Country7', 'City7', 'Street7', 1617),
(8, 'Country8', 'City8', 'Street8', 1819),
(9, 'Country9', 'City9', 'Street9', 2021),
(10, 'Country10', 'City10', 'Street10', 2223);

INSERT INTO Person VALUES
(1, 'John', 'Doe', '123-456-7890', '1990-01-01', 1),
(2, 'Jane', 'Smith', '987-654-3210', '1985-05-15', 2),
(3, 'Bob', 'Johnson', '555-123-4567', '1995-08-20', 3),
(4, 'Alice', 'Williams', '111-222-3333', '1980-11-10', 4),
(5, 'Charlie', 'Brown', '999-888-7777', '1998-03-25', 5),
(6, 'Eva', 'Green', '555-111-2222', '1988-08-12', 6),
(7, 'Michael', 'Johnson', '999-888-7777', '1975-04-25', 7),
(8, 'Sophia', 'Miller', '333-444-5555', '1992-11-30', 8),
(9, 'Daniel', 'Taylor', '777-999-1111', '1983-06-18', 9),
(10, 'Olivia', 'Anderson', '222-555-4444', '1997-02-03', 10);

INSERT INTO Student VALUES
(1, 1, 'Computer Science'),
(2, 2, 'Mathematics'),
(3, 3, 'Physics'),
(4, 4, 'History'),
(5, 5, 'English Literature');

INSERT INTO Teacher VALUES
(1, 'Professor', 6),
(2, 'Associate Professor', 7),
(3, 'Assistant Professor', 8),
(4, 'Lecturer', 9),
(5, 'Instructor', 10);

INSERT INTO Course VALUES
(1, 'Introduction to Programming', 3, 'Learn the basics of programming', 1),
(2, 'Calculus I', 4, 'Fundamental concepts of calculus', 2),
(3, 'Modern Physics', 3, 'Explore the principles of modern physics', 3),
(4, 'World History', 3, 'Study major events in world history', 4),
(5, 'English Literature Survey', 2, 'Survey of English literature', 5);



