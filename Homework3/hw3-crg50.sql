--Chris Grant crg50@Pitt.edu
--Homework 3

--1A
SELECT * FROM Messages WHERE ((Messages.spam = 0) AND Messages.time_read IS NOT NULL ) GROUP BY Messages.msgID;
