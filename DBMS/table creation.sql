DROP TABLE IF EXISTS ODETAILS;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS DELPPL;
DROP TABLE IF EXISTS BOOK;
DROP TABLE IF EXISTS USERS;

CREATE TABLE USERS(
UID INTEGER PRIMARY KEY AUTO_INCREMENT,
FNAME VARCHAR(20),
LNAME VARCHAR(20),
EMAIL VARCHAR(50) UNIQUE,
PHONENO BIGINT(10),
ADDR VARCHAR(70),
PW VARCHAR(15));

CREATE TABLE BOOK(
BID INTEGER PRIMARY KEY AUTO_INCREMENT,
BNAME VARCHAR(50),
AUTHOR VARCHAR(40),
PRICE INTEGER,
BSTATUS CHAR,
BORROWEDBY INTEGER,
FOREIGN KEY (BORROWEDBY) REFERENCES USERS(UID));

CREATE TABLE DELPPL(
EID INTEGER PRIMARY KEY AUTO_INCREMENT,
FNAME VARCHAR(15),
LNAME VARCHAR(15),
PHONENO BIGINT(10),
ORDERCOUNT INTEGER);

CREATE TABLE ORDERS(
OID INTEGER PRIMARY KEY AUTO_INCREMENT,
UID INTEGER,
EID INTEGER,
ODATE DATE,
DDATE DATE,
RDATE DATE,
AMOUNT INTEGER,
FINE INTEGER,
TOTAL INTEGER,
OSTATUS CHAR,
FOREIGN KEY (UID) REFERENCES USERS(UID),
FOREIGN KEY (EID) REFERENCES DELPPL(EID));

CREATE TABLE ODETAILS(
OID INTEGER,
BID INTEGER,
PRICE INTEGER,
FOREIGN KEY (OID) REFERENCES ORDERS(OID),
FOREIGN KEY (BID) REFERENCES BOOK(BID));
