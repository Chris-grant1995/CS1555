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
  user_ID  NUMBER(10),
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
INSERT INTO Conversation VALUES (
    1,1
);
INSERT INTO Conversation VALUES (
    2,2
);
INSERT INTO Conversation VALUES (
    3,5
);

INSERT INTO Messages VALUES (
  1,
  1,
  TO_TIMESTAMP('2014-12-24 07:15:57', 'YYYY-MM-DD HH24:MI:SS'),
  1,
  'How are you?',
  0,
  0
);
INSERT INTO Messages VALUES (
  2,
  1,
  TO_TIMESTAMP('2014-12-24 07:16:14', 'YYYY-MM-DD HH24:MI:SS'),
  1,
  'Are you guys ok?',
  0,
  0
);
INSERT INTO Messages VALUES (
  3,
  2,
  TO_TIMESTAMP('2015-02-24 15:45:12', 'YYYY-MM-DD HH24:MI:SS'),
  2,
  'How to solve Problem 1?',
  0,
  0
);
INSERT INTO Messages VALUES (
  5,
  2,
  TO_TIMESTAMP('2015-02-24 15:57:56', 'YYYY-MM-DD HH24:MI:SS'),
  2,
  'Submit your homework on time!',
  0,
  0
);
INSERT INTO Messages VALUES (
  6,
  5,
  TO_TIMESTAMP('2015-07-24 09:39:18', 'YYYY-MM-DD HH24:MI:SS'),
  3,
  'Buy this great car.',
  1,
  0
);
INSERT INTO Recipients VALUES (
  1,
  2,
  TO_TIMESTAMP('2014-12-24 07:16:11', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Recipients VALUES (
  1,
  3,
  TO_TIMESTAMP('2014-12-24 07:16:21', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Recipients VALUES (
  2,
  2,
  TO_TIMESTAMP('2014-12-24 07:16:11', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Recipients VALUES (
  2,
  3,
  TO_TIMESTAMP('2014-12-24 07:20:10', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Recipients VALUES (
  3,
  2,
  TO_TIMESTAMP('2015-02-24 16:00:15', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Recipients VALUES (
  4,
  2,
  TO_TIMESTAMP('2015-02-24 15:52:39', 'YYYY-MM-DD HH24:MI:SS')
);



