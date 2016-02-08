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
  msgID  NUMBER(10) PRIMARY KEY,
  sender_ID NUMBER(10) NOT NULL,
  FOREIGN KEY (sender_ID) REFERENCES Contacts (user_ID),
  time_sent TIMESTAMP NOT NULL ,
  time_read TIMESTAMP,
  convID NUMBER(10) NOT NULL ,
  FOREIGN KEY (convID) REFERENCES Conversation (convID),
  msg_text VARCHAR2(1024),
  spam NUMBER(1)
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
INSERT INTO Messages VALUES (
  1,
  1,
  TO_TIMESTAMP( '2014-12-24 07:15:57', 'YYYY-MM-DD HH24:MI:SS.FF'),
  1,
  'How are you?',
  0,
  0
);
