/* quairy exicution process and duration */

SET profiling = 1;   SET profiling = 0;

SHOW PROFILES;

SHOW PROFILE FOR QUERY 7;

/* others */

SHOW GLOBAL STATUS;

/* size of db */
SELECT table_schema 'table name', sum( data_length + index_length ) / 1024 / 1024  'Data Base Size in MB'
FROM information_schema.TABLES GROUP BY table_schema ; 

/* table status */
SHOW TABLE STATUS LIKE 'sales_lead_master_tbl';

/* memory allocated*/
SELECT ENGINE, SUM(DATA_LENGTH)/1024/1024/1024 as DATA_LENGTH_IN_GB,  
    SUM(INDEX_LENGTH)/1024/1024/1024 AS INDEX_LENGTH_IN_GB, 
    SUM(DATA_LENGTH+INDEX_LENGTH)/1024/1024/1024 as TOTAL_IN_GB
FROM information_schema.TABLES
WHERE ENGINE IN ("InnoDB") 
    AND TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema')
GROUP BY ENGINE
ORDER BY DATA_LENGTH DESC;

/*


