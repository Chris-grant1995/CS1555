--Chris Grant crg50@pitt.edu
--#4

SELECT * FROM Messages;
SELECT * FROM Contacts;
SELECT * FROM Conversations;
SELECT * FROM Recipients;

--A
SELECT user_ID
  FROM Contacts
WHERE cell = '412-624-8445';

--B
SELECT fname,lname
FROM Contacts JOIN Messages ON Contacts.user_ID = Messages.sender_ID JOIN Recipients ON Messages.msgID = Recipients.msgID
WHERE Recipients.user_ID = (select user_ID from Contacts where fname = 'Francis' AND  lname = 'Lefebvre')
GROUP BY fname,lname;

--C
SELECT Contacts.user_ID, count(Recipients.user_ID) AS RecievedCount
FROM Contacts LEFT OUTER JOIN Recipients ON Contacts.user_ID = Recipients.user_ID
GROUP BY Contacts.user_ID;
