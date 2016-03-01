--Chris Grant crg50@Pitt.edu
--Homework 3
DROP VIEW ConversationLog;
DROP VIEW MessageLog;
DROP MATERIALIZED VIEW ConversationLog_MV;
--1A
SELECT Messages.msgID, msg_text FROM Messages JOIN Recipients ON Messages.msgID = Recipients.msgID
WHERE ((Messages.spam = 0) AND Recipients.time_read IS NOT NULL )
ORDER BY Messages.msgID ASC ;

--1B
--List the time and number of read counts in which the least number of messages were read ordered by increasing time.
--I think it is asking to group by timestamp, and count the messages read at a specfic timestamp, however as the timestamps are unqiue for each message I'm not exactly sure

SELECT min(c), min(tr)  From (SELECT Recipients.time_read AS tr, count(Recipients.time_read) as c
FROM Recipients
WHERE time_read IS NOT NULL
GROUP BY Recipients.time_read
ORDER BY Recipients.time_read ASC);

--1C

SELECT Year,Max(user_ID), MAX(NumRead)
FROM (
  SELECT user_ID, count(time_read) as NumRead, EXTRACT(YEAR FROM Recipients.time_read) AS Year
  FROM Recipients JOIN Messages on Recipients.msgID = Messages.msgID
  GROUP BY user_ID, EXTRACT(YEAR FROM Recipients.time_read)
)
GROUP BY Year;

--2A
CREATE VIEW ConversationLog
    AS SELECT convID,msgID
    FROM Messages
    ORDER BY convID ASC ;

--2B
CREATE VIEW MessageLog
    AS SELECT Messages.msgID,Contacts.fname,Contacts.lname,recfname,reclname
    FROM (Messages JOIN Contacts ON Messages.sender_ID = Contacts.user_ID) JOIN (SELECT Recipients.msgID as id, Contacts.fname as recfname, Contacts.lname as reclname
                                                                             From Recipients JOIN Contacts ON Recipients.user_ID = Contacts.user_ID) ON Messages.msgID = id
    ORDER BY msgID ASC;

--3A
SELECT avg(c)
FROM (SELECT count(ConversationLog.msgID) AS c, ConversationLog.convID FROM ConversationLog GROUP BY convID);

--3B

Select  MessageLog.fname,MessageLog.lname, MessageLog.recfname,MessageLog.reclname
FROM MessageLog
HAVING count(MessageLog.msgID) > 1
GROUP BY  MessageLog.fname,MessageLog.lname, MessageLog.recfname,MessageLog.reclname;


--4A
CREATE MATERIALIZED VIEW ConversationLog_MV
AS SELECT * From ConversationLog;

--4B Q1
SELECT MAX(cnt), MIN(cnt), AVG(cnt)
FROM (Select DISTINCT count(ConversationLog.msgID) as cnt, ConversationLog.convID FROM ConversationLog GROUP BY ConversationLog.convID);

--4B Q2
SELECT MAX(cnt), MIN(cnt), AVG(cnt)
FROM (Select DISTINCT count(ConversationLog_MV.msgID) as cnt, ConversationLog_MV.convID FROM ConversationLog_MV GROUP BY ConversationLog_MV.convID);

