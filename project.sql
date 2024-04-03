DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;

-- 

CREATE TABLE newspaper
	(nTitle			VARCHAR(50),
     fDate			DATE,
	 periodicity	TEXT,
     PRIMARY KEY(nTitle)
	);

INSERT newspaper VALUES
	("Springfield Daily", '1066-09-15', "Daily"),
    ("Ornithopters!", '1444-11-11', "Monthly");
SELECT * FROM newspaper;

-- 

CREATE TABLE edition
	(eID	INTEGER,
     pDate	DATE,
     PRIMARY KEY(eID)
	);

INSERT edition VALUES
	(1, '1066-09-16'),
    (2, '1444-11-18');
SELECT * FROM edition;

-- 

CREATE TABLE publishes
	(nTitle	VARCHAR(50),
	 eID	INTEGER,
     PRIMARY KEY(nTitle, eID),
     FOREIGN KEY(nTitle) REFERENCES newspaper(nTitle),
     FOREIGN KEY(eID) REFERENCES edition(eID)
	);

INSERT publishes VALUES
	("Springfield Daily", 1),
    ("Ornithopters!", 2);
SELECT * FROM publishes;

-- 
    
CREATE TABLE article
	(aTitle 	VARCHAR(50),
	 contents  	TEXT,
     topic		VARCHAR(20),
     readCount	INTEGER,
     PRIMARY KEY(aTitle)
	);
	
INSERT article VALUES
	("Dog pees in village well!", "A village's water has become even less drinkable after a dog peed into it!", "Life", 20),
	("Man buys drink!", "A shocking event has happened in Springfield where a man went and bought a beer", "Life", 20),
    ("Ornithopter manufacturer goes bankrupt!", "Milan Ornithopters has gone bankrupt on account of political instability in Northern Italy", "Business", 5),
    ("Tech Giants Merge", "Two leading tech companies announced a merger, shocking the industry.", "Business", 300),
	("Revolution in Renewable Energy", "A new technology promises to dramatically reduce renewable energy costs.", "Science", 280),
	("Local Sports Team Wins Championship", "The local team clinched the national championship after a thrilling final.", "Sports", 250),
	("Artificial Intelligence in Healthcare", "Exploring the impact of AI on future medical diagnostics and treatments.", "Health", 230),
	("The Future of Public Transportation", "Innovations that could transform how we commute in the next decade.", "Technology", 210),
	("Global Economic Outlook", "Analysts predict a slow recovery from the global economic downturn.", "Economics", 190),
	("New Educational Reforms Announced", "The government unveils plans for major educational system reforms.", "Education", 170),
	("Celebrity Chef Opens New Restaurant", "A celebrity chef brings his culinary expertise to a new fine dining experience.", "Lifestyle", 150),
	("Exploring the Deep Ocean", "Recent expeditions reveal fascinating details about deep-sea ecosystems.", "Environment", 130);
SELECT * FROM article;

-- 
    
CREATE TABLE writtenIn
	(eID	INTEGER,
	 aTitle VARCHAR(50),
	 PRIMARY KEY(eID, aTitle),
     FOREIGN KEY(eID) REFERENCES edition(eID),
     FOREIGN KEY(aTitle) REFERENCES article(aTitle)
	);

INSERT writtenIn VALUES
	(1, "Dog pees in village well!"),
	(1, "Man buys drink!"),
    (2, "Ornithopter manufacturer goes bankrupt!");
SELECT * FROM writtenIn;

-- 
    
CREATE TABLE photo
	(pTitle		VARCHAR(50),
     shotDate	DATE,
     PRIMARY KEY(pTitle)
	);

INSERT photo VALUES
	("DaVinci ornithopter sketch", '1444-11-15'),
    ("Anachronistic American beer", '1977-05-25'),
    ("Cityscape at Dawn", '2024-04-01'),
	("Mountain Expedition", '2024-04-02'),
	("Gourmet Cuisine", '2024-04-03'),
	("Wildlife in the Forest", '2024-04-04'),
	("Starry Night Sky", '2024-04-05'),
	("Festival Celebrations", '2024-04-06'),
	("Robotics in Action", '2024-04-07'),
	("Historical Landmark", '2024-04-08'),
	("Modern Architecture", '2024-04-09'),
	("Portrait of a Musician", '2024-04-10');
SELECT * FROM photo;

-- 
    
CREATE TABLE includes
	(aTitle	VARCHAR(50),
	 pTitle	VARCHAR(50),
     PRIMARY KEY(aTitle, pTitle),
     FOREIGN KEY(aTitle) REFERENCES article(aTitle),
     FOREIGN KEY(pTitle) REFERENCES photo(pTitle)
	);

INSERT includes VALUES
	("Man buys drink!", "Anachronistic American beer"),
	("Ornithopter manufacturer goes bankrupt!", "DaVinci ornithopter sketch"),
	("Tech Giants Merge", "Robotics in Action"),
	("Revolution in Renewable Energy", "Modern Architecture"),
	("Local Sports Team Wins Championship", "Festival Celebrations"),
	("The Future of Public Transportation", "Cityscape at Dawn"),
	("Artificial Intelligence in Healthcare", "Starry Night Sky"),
	("Global Economic Outlook", "Wildlife in the Forest"),
	("New Educational Reforms Announced", "Historical Landmark"),
	("Celebrity Chef Opens New Restaurant", "Gourmet Cuisine"),
	("Exploring the Deep Ocean", "Mountain Expedition"),
	("Dog pees in village well!", "Portrait of a Musician");
SELECT * FROM includes;

-- 

CREATE TABLE journalist
	(cpr		INTEGER,
     fName		TEXT,
     lName		TEXT,
     street		TEXT,
     civic		INTEGER,
     city		TEXT,
     zip		INTEGER,
     country	TEXT,
     PRIMARY KEY(cpr)
	);

INSERT journalist VALUES
	(30000001, "Alice", "Johnson", "Maple Street", 100, "Metropolis", 12345, "USA"),
	(30000002, "Bob", "Brown", "Oak Street", 101, "Gotham", 54321, "USA"),
	(30000003, "Carol", "Smith", "Pine Street", 102, "Star City", 67890, "USA"),
	(30000004, "Dave", "Wilson", "Elm Street", 103, "Central City", 98765, "USA"),
	(30000005, "Eve", "Davis", "Cedar Street", 104, "National City", 13579, "USA"),
	(30000006, "Frank", "Miller", "Birch Street", 105, "Coast City", 24680, "USA"),
	(30000007, "Grace", "Lee", "Willow Street", 106, "Midway City", 86420, "USA"),
	(30000008, "Hank", "Taylor", "Maple Street", 107, "Keystone City", 97531, "USA"),
	(30000009, "Ivy", "Moore", "Oak Street", 108, "Opal City", 75319, "USA"),
	(20184709, "John", "Smith", "street1", 15, "Springfield", 12, "Iroquois"),
    (81027341, "Edward", "Scissorhands", "street2", 20, "Springfield", 11, "Iroquois"),
    (11245432, "Joe", "Biden", "street3", 1, "Tirana", 2, "Albania");
SELECT * FROM journalist;

-- 
    
CREATE TABLE phones
	(phone	INTEGER,
     cpr	INTEGER,
     PRIMARY KEY(phone),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr)
	);

INSERT phones VALUES
	(208470912, 20184709),
    (198481295, 20184709),
    (298364124, 20184709),
    (184097420, 81027341),
    (280347112, 81027341),
    (198659811, 11245432),
    (279298147, 11245432),
    (198642141, 11245432);
SELECT * FROM phones;

-- 
    
CREATE TABLE emails
	(email	VARCHAR(30),
     cpr	INTEGER,
     PRIMARY KEY(email),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr)
	);

INSERT emails VALUES
	("sauofh@gmail.com", 11245432),
    ("awufbafaouwf@hotmail.com", 11245432),
    ("asfuhahfgaf@gmail.com", 20184709),
    ("asuofawr@gmail.com", 81027341);
SELECT * FROM emails;

-- 
    
CREATE TABLE shoots
	(cpr	INTEGER,
     pTitle	VARCHAR(50),
     PRIMARY KEY(cpr, pTitle),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr),
     FOREIGN KEY(pTitle) REFERENCES photo(pTitle)
	);

INSERT shoots VALUES
	(11245432, "Anachronistic American beer"),
	(11245432, "DaVinci ornithopter sketch"),
	(30000001, "Robotics in Action"),
	(30000002, "Modern Architecture"),
	(30000003, "Festival Celebrations"),
	(30000004, "Cityscape at Dawn"),
	(30000005, "Starry Night Sky"),
	(30000006, "Wildlife in the Forest"),
	(30000007, "Historical Landmark"),
	(30000008, "Gourmet Cuisine"),
	(30000009, "Mountain Expedition"),
	(20184709, "Portrait of a Musician");
SELECT * FROM shoots;

-- 
    
CREATE TABLE edits
	(cpr	INTEGER,
	 eID	INTEGER,
     PRIMARY KEY(cpr, eID),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr),
     FOREIGN KEY(eID) REFERENCES edition(eID)
	);

INSERT edits VALUES
	(11245432, 1),
    (11245432, 2);
SELECT * FROM edits;
 
-- 
 
CREATE TABLE writes
	(cpr		INTEGER,
     aTitle		VARCHAR(50),
     teamRole 	TEXT,
     PRIMARY KEY(cpr, aTitle),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr),
     FOREIGN KEY(aTitle) REFERENCES article(aTitle)
	);

INSERT writes VALUES	
	(11245432, "Dog pees in village well!", "Commander-in-chief"),
	(11245432, "Man buys drink!", "Commander-in-chief"),
	(11245432, "Ornithopter manufacturer goes bankrupt!", "Commander-in-chief"),
	(30000001, "Tech Giants Merge", "Author"),
	(30000002, "Revolution in Renewable Energy", "Contributor"),
	(30000003, "Local Sports Team Wins Championship", "Author"),
	(30000004, "The Future of Public Transportation", "Author"),
	(30000005, "Artificial Intelligence in Healthcare", "Researcher"),	
	(30000006, "Global Economic Outlook", "Contributor"),
	(30000007, "New Educational Reforms Announced", "Author"),
	(30000008, "Celebrity Chef Opens New Restaurant", "Photographer"),
	(30000009, "Exploring the Deep Ocean", "Author"),
	(20184709, "Dog pees in village well!", "Dog procurer"),
	(81027341, "Ornithopter manufacturer goes bankrupt!", "Ornithopter assembler");
SELECT * FROM writes;
