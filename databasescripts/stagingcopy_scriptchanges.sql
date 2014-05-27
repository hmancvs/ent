-- Reset all email addresses to development addresses and the password to the word password
-- UPDATE useraccount set email =  INSERT(email,LOCATE('@', email)+1, 22,'veritracker.com'), password = sha1('password');
UPDATE useraccount set email =  concat(username,'@veritracker.com'), password = sha1('password') WHERE email like '%devmail%';

UPDATE useraccount set email =  'admin@veritracker.com', username = 'admin' where id = 1;
UPDATE useraccount set email =  'qms@veritracker.com', username = 'qms_cc' where id = 24;
UPDATE useraccount set email =  'dpt@veritracker.com', username = 'department' where id = 28;
UPDATE useraccount set email =  'head@veritracker.com', username = 'qms_head' where id = 20;

UPDATE appconfig set optionvalue = 'administrator@veritracker.com' where optionname = 'emailmessagesender';
UPDATE appconfig set optionvalue = 'administrator@veritracker.com' where optionname = 'supportemailaddress';