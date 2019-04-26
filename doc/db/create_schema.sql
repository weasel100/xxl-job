drop user ubgjob;
CREATE USER ubgjob IDENTIFIED BY ubgjob
 DEFAULT TABLESPACE USERS
 TEMPORARY TABLESPACE TEMP
 PROFILE "DEFAULT"
 QUOTA UNLIMITED ON USERS;

GRANT "CONNECT" TO UBGJOB;
GRANT "RESOURCE" TO UBGJOB;
ALTER USER UBGJOB DEFAULT ROLE "CONNECT", "RESOURCE";
