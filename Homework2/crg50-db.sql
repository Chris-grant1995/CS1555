--Chris Grant, crg50@pitt.edu
DROP TABLE Conversation CASCADE CONSTRAINTS;
DROP TABLE Contacts CASCADE CONSTRAINTS ;
DROP TABLE Messages CASCADE CONSTRAINTS ;
DROP TABLE Recipients CASCADE CONSTRAINTS ;
--#1

CREATE TABLE Contacts (
  user_ID number(10) NOT NULL,
  fname varchar2(32),
  lname varchar2(32),
  cell varchar2(16),
  city varchar2(32),
  country varchar2(32),
  PRIMARY KEY (user_ID)
);

CREATE TABLE Conversation (
  convID number(10) NOT NULL,
  duration number(10),
  PRIMARY KEY (convID)
);
CREATE TABLE Messages (
  msgID  NUMBER(10),
  sender_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (sender_ID) REFERENCES Contacts (user_ID),
  time_sent TIMESTAMP NOT NULL ,
  time_read TIMESTAMP,
  convID NUMBER(10) NOT NULL ,
  FOREIGN KEY (convID) REFERENCES Conversation (convID),
  msg_text VARCHAR2(1024),
  spam NUMBER(1),
  PRIMARY KEY(msgID)
);

CREATE TABLE Recipients (
  msgID  NUMBER(10),
  user_ID  number(10),
  PRIMARY KEY (msgID,user_ID),
  FOREIGN KEY (msgID) REFERENCES Messages (msgID),
  FOREIGN KEY (user_ID) REFERENCES Contacts (user_ID)
);

--#2
--A
ALTER TABLE Messages DROP COLUMN  time_read;
ALTER TABLE Recipients ADD  time_read TIMESTAMP;
--B
ALTER TABLE Conversation DROP COLUMN duration;
--C
ALTER TABLE Messages ADD length NUMBER(1) DEFAULT 0;
--D
ALTER TABLE Messages ADD CHECK (spam = 0 OR spam = 1);
--E
ALTER TABLE Conversation ADD userID NUMBER(10);
ALTER TABLE Conversation ADD FOREIGN KEY (userID) REFERENCES Contacts(user_ID);
--F
ALTER TABLE Messages MODIFY spam DEFAULT 0;

--#3
INSERT INTO Contacts VALUES (
  1,
  'Ada',
  'Lovelace',
  '412-624-4141',
  'Pittsburgh',
  'US'
);
INSERT INTO Contacts VALUES (
  2,
  'Na',
  'Li',
  '412-624-8442',
  'Pittsburgh',
  'US'
);
INSERT INTO Contacts VALUES (
  3,
  'Francis',
  'Lefebvre',
  '412-624-8443',
  'Pittsburgh',
  'US'
);
INSERT INTO Contacts VALUES (
  4,
  'Amanda',
  'Carlevaro',
  '412-624-8444',
  'Pittsburgh',
  'US'
);
INSERT INTO Contacts VALUES (
  5,
  'Ethan',
  'Lee',
  '412-624-8445',
  'Pittsburgh',
  'US'
);
INSERT INTO Contacts VALUES (
  6,
  'Zina',
  'Mkizungo',
  '412-624-8446',
  'Pittsburgh',
  'US'
);