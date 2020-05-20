select vmt.vehicle_id,vmt.vehicle_no,cmt.car_make,vfdt.car_model,vmt.manufactured_year,vmt.odometer,pvdt.selling_price ,
st.showroom_id,st.showroom_name,
case when datediff(date(now()),date(svat.last_updated_on))<=30 then 'PLATINUM'
when datediff(date(now()),date(svat.last_updated_on))<=60 then 'GRID'
 else 'AGED' end as customer_status
from showroom_vehicle_assignment_tbl svat inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
and svat.is_active='Y' and st.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join purchased_vehicle_details_tbl pvdt on pvdt.vehicle_id=vmt.vehicle_id and pvdt.onboard_id=4
where vmt.vehicle_id not in (select vehicle_id from vehicle_sales_details_tbl where is_active='Y')
and st.showroom_id in (1,2,3,4,5,6,7)
group by vmt.vehicle_id
order by svat.last_updated_on desc