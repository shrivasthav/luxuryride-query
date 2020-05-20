delimiter $$
CREATE PROCEDURE Getshowrmid (in showroom_id_set varchar(1000))
BEGIN
   set @query = concat("select showroom_id from showrooms_tbl where is_active='Y' and showroom_id in  (" , showroom_id_set , ")");

    PREPARE stmt FROM @query;
    EXECUTE stmt ;
END

