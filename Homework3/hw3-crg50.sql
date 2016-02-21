--Chris Grant crg50@Pitt.edu
--Homework 3

--1A
SELECT Messages.msgID, msg_text FROM Messages JOIN Recipients ON Messages.msgID = Recipients.msgID
WHERE ((Messages.spam = 0) AND Recipients.time_read IS NOT NULL )
ORDER BY Messages.msgID ASC ;

--1B
--List the time and number of read counts in which the least number of messages were read ordered by increasing time.
--I have no idea what the hell this is asking

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