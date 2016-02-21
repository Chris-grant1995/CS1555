--Chris Grant crg50@Pitt.edu
--Homework 3

--1A
SELECT * FROM Messages JOIN Recipients ON Messages.msgID = Recipients.msgID
WHERE ((Messages.spam = 0) AND Recipients.time_read IS NOT NULL )
GROUP BY Messages.msgID;