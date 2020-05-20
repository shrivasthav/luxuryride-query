delimiter $$
CREATE  FUNCTION Getshowrmid (id int) 
RETURNS varchar(1000) CHARSET latin1
BEGIN

declare showroomIds varchar(1000);
declare showroom_id_get int;

if id is null then
set showroom_id_get = 0;
else 
set showroom_id_get = id;
end if;

if showroom_id_get = 0 then 
select concat('\'',group_concat(showroom_id),'\'') into showroomIds from showrooms_tbl;
else 
set showroomIds = concat('\'',showroom_id_get,'\'');
end if;


set showroomIds = replace(showroomIds,'\'','');
 
RETURN showroomIds;
END