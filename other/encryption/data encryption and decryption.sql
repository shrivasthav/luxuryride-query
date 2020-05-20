select * from invester_master_tbl where invester_id=45;
INSERT into invester_master_tbl (invester_name, password) VALUES (AES_ENCRYPT('cleansecar', 'autobrix'),AES_ENCRYPT('hellobuddy', 'pautobrix'));

select invester_name,CAST(AES_DECRYPT(invester_name, 'autobrix') AS CHAR(50)) as name,
password,CAST(AES_DECRYPT(password, 'pautobrix') AS CHAR(50)) as password
 from invester_master_tbl where invester_id=45;
