select 
vmt.vehicle_id,vmt.vehicle_no,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,svat.vehicle_images,
vmt.manufactured_year,concat(' Rs : ',svat.final_selling_price) as selling_price,st.showroom_name
from enquired_cars_tbl ect inner join vehicle_master_tbl vmt on vmt.vehicle_id=ect.vehicle_id and ect.is_active='Y'
inner join showroom_vehicle_assignment_tbl svat on svat.vehicle_id=vmt.vehicle_id 
inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where ect.customer_id=1
group by ect.vehicle_id;