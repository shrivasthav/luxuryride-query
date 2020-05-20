select vsdt.vehicle_id,slmt.customer_name,slmt.phone_no,cmt.car_make,vfdt.car_model,st.showroom_name,date(vsdt.sold_on) as sold_on,
case when esat.park_and_sale='Y' then 'park & sale'
else 'Stock' end as vehicle_status
from vehicle_sales_details_tbl vsdt inner join sales_lead_master_tbl slmt on slmt.customer_id=vsdt.customer_id
and slmt.is_active='Y' and vsdt.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=vsdt.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join showroom_vehicle_assignment_tbl esat on esat.vehicle_id=vsdt.vehicle_id
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
group by vsdt.vehicle_id;