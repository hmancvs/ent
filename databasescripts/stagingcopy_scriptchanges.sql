-- Reset all email addresses to development addresses and the password to the word password
-- UPDATE useraccount set email =  INSERT(email,LOCATE('@', email)+1, 22,'veritracker.com'), password = sha1('password');
UPDATE useraccount set email =  concat(username,'@veritracker.com'), password = sha1('password') WHERE email like '%devmail%';
UPDATE useraccount set email =  'administrator@veritracker.com', username = 'admin' where id = 1;

UPDATE appconfig set optionvalue = 'administrator@veritracker.com' where optionname = 'emailmessagesender';
UPDATE appconfig set optionvalue = 'administrator@veritracker.com' where optionname = 'supportemailaddress';