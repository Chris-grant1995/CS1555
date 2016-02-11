--Chris Grant crg50@pitt.edu
--#4
--A
SELECT user_ID
  FROM Contacts
WHERE cell = '412-624-8445';

--B
SELECT fname,lname
FROM Contacts JOIN Messages ON Contacts.user_ID = Messages.sender_ID JOIN Recipients ON Messages.msgID = Recipients.msgID
WHERE Recipients.user_ID = (select user_ID from Contacts where fname = 'Francis' AND  lname = 'Lefebvre')
GROUP BY fname,lname;