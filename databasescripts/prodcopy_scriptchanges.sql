-- Reset all email addresses to development addresses and the password to the word password
-- UPDATE useraccount set email =  INSERT(email,LOCATE('@', email)+1, 22,'veritracker.com'), password = sha1('password');
UPDATE useraccount set email =  concat(username,'@veritracker.com'), password = sha1('password') WHERE email like '%devmail%';

UPDATE appconfig set optionvalue = 'agmis@fituganda.com' where optionname = 'emailmessagesender';
UPDATE appconfig set optionvalue = 'agmis@fituganda.com' where optionname = 'supportemailaddress';
UPDATE appconfig set optionvalue = 'agmis@fituganda.com' where optionname = 'databasebackupemail';