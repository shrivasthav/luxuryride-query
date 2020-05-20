LOAD DATA local INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/upload.csv' 
INTO TABLE bulk_sales_lead_upload_tbl
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from bulk_sales_lead_upload_tbl ;


delete from bulk_sales_lead_upload_tbl