select  svat.vehicle_images,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,vmt.odometer,vmt.manufactured_year,
vmt.transmission,vmt.fuel_type,vmt.no_of_owners,svat.final_selling_price,
(select count(distinct customer_id) from enquired_cars_tbl where is_active='Y' and vehicle_id=svat.vehicle_id) as leads
from showroom_vehicle_assignment_tbl svat inner join vehicle_master_tbl vmt on svat.vehicle_id=vmt.vehicle_id
and svat.is_active='Y'
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where svat.vehicle_id=20;

/* lead list */
select ert.customer_id,slmt.customer_name,slmt.phone_no,
CONCAT(date(ert.added_on),' ',TIME_FORMAT(ert.added_on, '%h:%i:%s %p')) AS enqired_on
from enquired_cars_tbl ert inner join sales_lead_master_tbl slmt on slmt.customer_id=ert.customer_id and ert.is_active='Y'
 where ert.vehicle_id=20
 group by ert.customer_id;
