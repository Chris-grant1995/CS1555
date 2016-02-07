--Chris Grant, crg50@pitt.edu
--DROP TABLE * CASCADE CONSTRAINTS;
--#1
CREATE TABLE Messages
(
  msgID: NUMBER PRIMARY KEY,
  sender_ID: NUMBER NOT NULL,
  FOREIGN KEY (sender_ID) REFERENCES Contacts(user_ID),
  time_sent: TIMESTAMP NOT NULL ,
  time_read: TIMESTAMP,
  convID: NUMBER NOT NULL ,
  FOREIGN KEY (convID) REFERENCES Conversation(convID),
  msg_text: VARCHAR2,
  spam: NUMBER

);

CREATE TABLE Recipients (
  msgID: NUMBER,
  user_ID: number,
  PRIMARY KEY (msgID,user_ID),
  FOREIGN KEY (msgID) REFERENCES Messages(msgID),
  FOREIGN KEY (user_ID) REFERENCES Contacts(user_ID)
);

CREATE TABLE Contacts (
  user_ID: number NOT NULL,
  fname: varchar2,
  lname: varchar2,
  cell: varchar2,
  city: varchar2,
  country: varchar2,
  PRIMARY KEY (user_ID)

);

CREATE TABLE Conversation (
  convID: number NOT NULL,
  duration: number,
  PRIMARY KEY (convID)
);
