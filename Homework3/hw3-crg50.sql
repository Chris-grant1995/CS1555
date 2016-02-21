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
/*
SELECT user_ID, count(time_read)
FROM Recipients JOIN Messages on Recipients.msgID = Messages.msgID
GROUP BY user_ID; -- Gets user ID and how many messages they have read

SELECT DISTINCT EXTRACT(YEAR FROM Recipients.time_read)
from Recipients; -- Gets unique years

SELECT user_ID, count(time_read) as NumRead, EXTRACT(YEAR FROM Recipients.time_read) AS Year
FROM Recipients JOIN Messages on Recipients.msgID = Messages.msgID
GROUP BY user_ID, EXTRACT(YEAR FROM Recipients.time_read) ;
--Shows how many messages a given user read in a year
SELECT max(NumRead), user_ID, Year
FROM (SELECT user_ID, count(time_read) as NumRead, EXTRACT(YEAR FROM Recipients.time_read) AS Year FROM Recipients JOIN Messages on Recipients.msgID = Messages.msgID GROUP BY user_ID, EXTRACT(YEAR FROM Recipients.time_read))
GROUP BY Year, user_ID;
*/
SELECT DISTINCT Year,user_ID, MAX(NumRead)  FROM (SELECT user_ID, count(time_read) as NumRead, EXTRACT(YEAR FROM Recipients.time_read) AS Year FROM Recipients JOIN Messages on Recipients.msgID = Messages.msgID GROUP BY user_ID, EXTRACT(YEAR FROM Recipients.time_read)) GROUP BY Year;