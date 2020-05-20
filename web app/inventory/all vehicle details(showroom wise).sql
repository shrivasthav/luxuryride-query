select vmt.vehicle_id,plt.lead_name,plt.phone_number,vmt.vehicle_no,cmt.car_make,vfdt.car_model,vmt.color,vmt.fuel_type,
vmt.manufactured_year,vmt.registration_year,vmt.odometer,vmt.no_of_owners,ct.city,pvdt.purchase_price, pvdt.selling_price ,
st.showroom_id,st.showroom_name,svat.vehicle_images
from showroom_vehicle_assignment_tbl svat inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
and svat.is_active='Y' and st.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id
inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join city_master_tbl ct on ct.city_id=vmt.city
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_make
inner join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=vmt.vehicle_id 
where  vmt.vehicle_id=187
group by vmt.vehicle_id;
