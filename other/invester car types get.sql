SELECT DISTINCT SUBSTRING_INDEX(SUBSTRING_INDEX(car_id,',',n),',',-1) car_id
FROM invester_car_brand_tbl ,(SELECT 1 n  UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6     
UNION ALL SELECT 7  UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13  
UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19  UNION ALL SELECT 20
UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25  UNION ALL SELECT 26 UNION ALL SELECT 27 
UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30) a where  invester_id=2 and is_active='Y'