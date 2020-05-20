select concat(@a:=@a+1,' ( ',LEFT(a.vehicle_status,1),' ) ') as serial_number
,a.vehicle_id,a.vehicle_name,a.manufactured_year,a.odometer,a.color,a.fuel_type,a.registration_year,
a.no_of_owners,a.final_selling_price,a.showroom_name,a.vehicle_images,a.vehicle_status
from 
(select 
(SELECT @a:= 0) AS sl_no,
svat.vehicle_id,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,vmt.manufactured_year,vmt.odometer,vmt.color,vmt.fuel_type,
vmt.registration_year,vmt.no_of_owners,svat.final_selling_price,st.showroom_name,svat.vehicle_images,
case when datediff(date(now()),date(svat.last_updated_on))<=30 then 'PLATINUM'
when datediff(date(now()),date(svat.last_updated_on))<=60 then 'GRID'
 else 'AGED' end as vehicle_status
from showroom_vehicle_assignment_tbl svat inner join vehicle_master_tbl vmt on svat.vehicle_id=vmt.vehicle_id
and svat.is_active='Y' 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
where svat.vehicle_id not in (select vehicle_id from vehicle_sales_details_tbl where is_active='Y'))a
where find_in_set(a.vehicle_id,ids)



