DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;

CREATE TABLE newspaper
	(nTitle			VARCHAR(50),
     fDate			DATE,
	 periodicity	TEXT,
     PRIMARY KEY(nTitle)
	);

CREATE TABLE edition
	(eID	INTEGER,
     pDate	DATE,
     PRIMARY KEY(eID)
	);

CREATE TABLE publishes
	(nTitle	VARCHAR(50),
	 eID	INTEGER,
     PRIMARY KEY(nTitle, eID),
     FOREIGN KEY(nTitle) REFERENCES newspaper(nTitle),
     FOREIGN KEY(eID) REFERENCES edition(eID)
	);
    
CREATE TABLE article
	(aTitle 	VARCHAR(50),
	 contents  	TEXT,
     topic		VARCHAR(20),
     readCount	INTEGER,
     PRIMARY KEY(aTitle)
	);
    
CREATE TABLE writtenIn
	(eID	INTEGER,
	 aTitle VARCHAR(50),
	 PRIMARY KEY(eID, aTitle),
     FOREIGN KEY(eID) REFERENCES edition(eID),
     FOREIGN KEY(aTitle) REFERENCES article(aTitle)
	);
    
CREATE TABLE photo
	(pTitle		VARCHAR(50),
     shotDate	DATE,
     PRIMARY KEY(pTitle)
	);
    
CREATE TABLE includes
	(aTitle	VARCHAR(50),
	 pTitle	VARCHAR(50),
     PRIMARY KEY(aTitle, pTitle),
     FOREIGN KEY(aTitle) REFERENCES article(aTitle),
     FOREIGN KEY(pTitle) REFERENCES photo(pTitle)
	);

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
    
CREATE TABLE phones
	(phone	INTEGER,
     cpr	INTEGER,
     PRIMARY KEY(phone),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr)
	);
    
CREATE TABLE emails
	(email	VARCHAR(30),
     cpr	INTEGER,
     PRIMARY KEY(email),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr)
	);
    
CREATE TABLE shoots
	(cpr	INTEGER,
     pTitle	VARCHAR(50),
     PRIMARY KEY(cpr, pTitle),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr),
     FOREIGN KEY(pTitle) REFERENCES photo(pTitle)
	);
    
CREATE TABLE edits
	(cpr	INTEGER,
	 eID	INTEGER,
     PRIMARY KEY(cpr, eID),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr),
     FOREIGN KEY(eID) REFERENCES edition(eID)
	);
    
CREATE TABLE writes
	(cpr		INTEGER,
     aTitle		VARCHAR(50),
     teamRole 	TEXT,
     PRIMARY KEY(cpr, aTitle),
     FOREIGN KEY(cpr) REFERENCES journalist(cpr),
     FOREIGN KEY(aTitle) REFERENCES article(aTitle)
	);

INSERT newspaper VALUES
	("Springfield Daily", '1066-09-15', "Daily"),
    ("Ornithopters!", '1444-11-11', "Monthly");
SELECT * FROM newspaper;

INSERT edition VALUES
	(1, '1066-09-16'),
    (2, '1444-11-18');
SELECT * FROM edition;

INSERT publishes VALUES
	("Springfield Daily", 1),
    ("Ornithopters!", 2);
SELECT * FROM publishes;

INSERT article VALUES
	("Dog pees in village well!", "A village's water has become even less drinkable after a dog peed into it!", "Life", 20),
	("Man buys drink!", "A shocking event has happened in Springfield where a man went and bought a beer", "Life", 20),
    ("Ornithopter manufacturer goes bankrupt!", "Milan Ornithopters has gone bankrupt on account of political instability in Northern Italy", "Business", 5);
SELECT * FROM article;

INSERT writtenIn VALUES
	(1, "Dog pees in village well!"),
	(1, "Man buys drink!"),
    (2, "Ornithopter manufacturer goes bankrupt!");
SELECT * FROM writtenIn;

INSERT photo VALUES
	("DaVinci ornithopter sketch", '1444-11-15'),
    ("Anachronistic American beer", '1977-05-25');
SELECT * FROM photo;

INSERT includes VALUES
	("Ornithopter manufacturer goes bankrupt!", "DaVinci ornithopter sketch"),
    ("Man buys drink!", "Anachronistic American beer");
SELECT * FROM includes;

INSERT journalist VALUES
	(20184709, "John", "Smith", "street1", 15, "Springfield", 12, "Iroquois"),
    (81027341, "Edward", "Scissorhands", "street2", 20, "Springfield", 11, "Iroquois"),
    (11245432, "Joe", "Biden", "street3", 1, "Tirana", 2, "Albania");
SELECT * FROM journalist;

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

INSERT emails VALUES
	("sauofh@gmail.com", 11245432),
    ("awufbafaouwf@hotmail.com", 11245432),
    ("asfuhahfgaf@gmail.com", 20184709),
    ("asuofawr@gmail.com", 81027341);
SELECT * FROM emails;

INSERT shoots VALUES
	(11245432, "DaVinci ornithopter sketch"),
    (11245432, "Anachronistic American beer");
SELECT * FROM shoots;

INSERT edits VALUES
	(11245432, 1),
    (11245432, 2);
SELECT * FROM edits;

INSERT writes VALUES
	(11245432, "Dog pees in village well!", "Commander-in-chief"),
    (11245432, "Man buys drink!", "Commander-in-chief"),
    (11245432, "Ornithopter manufacturer goes bankrupt!", "Commander-in-chief"),
    (81027341, "Ornithopter manufacturer goes bankrupt!", "Ornithopter assembler"),
    (20184709, "Dog pees in village well!", "Dog procurer");
SELECT * FROM writes;
