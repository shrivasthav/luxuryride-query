/* car_count */
select count(distinct vehicle_id) as  enquired_cars from enquired_cars_tbl where customer_id=1 and is_active='Y';

/* enquired cars */
select 
vmt.vehicle_id,vmt.vehicle_no,cmt.car_make,vfdt.car_model,vmt.manufactured_year,
concat(' Rs : ',svat.final_selling_price) as selling_price
from enquired_cars_tbl ect inner join vehicle_master_tbl vmt on vmt.vehicle_id=ect.vehicle_id and ect.is_active='Y'
inner join showroom_vehicle_assignment_tbl svat on svat.vehicle_id=vmt.vehicle_id 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where ect.customer_id=16
group by ect.vehicle_id;


/* add cars to lead*/
select 
vmt.vehicle_id,vmt.vehicle_no,cmt.car_make,vfdt.car_model,vmt.manufactured_year,
concat(' Rs : ',svat.final_selling_price) as selling_price
 from showroom_vehicle_assignment_tbl svat inner join employee_showroom_assignment_tbl esat on 
svat.showroom_id=esat.showroom_id and svat.is_active='Y' and esat.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where esat.employee_id=3
and svat.vehicle_id not in (select vehicle_id from enquired_cars_tbl where customer_id=1 and is_active='Y')
and svat.vehicle_id not in (select vehicle_id from vehicle_sales_details_tbl where is_active='Y')
group by svat.vehicle_id;

select
vmt.vehicle_id,vmt.vehicle_no,cmt.car_make,vfdt.car_model,vmt.manufactured_year,
concat(' Rs : ',svat.final_selling_price) as selling_price
from showroom_vehicle_assignment_tbl svat
inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id and svat.is_active='Y'
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where svat.vehicle_id not in (select vehicle_id from enquired_cars_tbl where customer_id=1 and is_active='Y')
and svat.vehicle_id not in (select vehicle_id from vehicle_sales_details_tbl where is_active='Y')
group by svat.vehicle_id;