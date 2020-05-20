/* vehicle details and images*/
select cmt.car_make,vfdt.car_model,vmt.vehicle_no,vmt.manufactured_year,ifnull(vmt.expected_selling_price,'-') as expected_selling_price ,
ifnull(vmt.no_of_owners,'-') as no_of_owners  ,evdt,cust_expt_price,evdt.buying_price,evdt.refurbish_amount,
emt.first_name,
CONCAT(date(evat.submitted_on),' ',TIME_FORMAT(evat.submitted_on, '%h:%i:%s %p')) AS evaluated_on,
vcit.vehicle_images
from vehicle_master_tbl vmt inner join vehicle_condition_images_tbl vcit on vmt.vehicle_id=vcit.vehicle_id and vmt.is_active='Y'
inner join evaluator_vehicle_assignment_tbl evat on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y'
inner join evaluated_vehicle_pricing_details_tbl evdt on evdt.vehicle_id=vmt.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id
where vmt.vehicle_id=20;

/* condition status */
select sdmt.sub_details,vcmt.condition_name,ifnull(vcdt.images,'-') as images
 from vehicle_condition_details_tbl vcdt  inner join sub_details_master_tbl sdmt on vcdt.sub_details_id=sdmt.sub_details_id
and vcdt.is_active='Y' and sdmt.is_active='Y'
inner join vehicle_details_master_tbl vdmt on vdmt.details_id=sdmt.details_id and vdmt.is_active='Y'
inner join vehicle_condition_status_master_tbl vcmt on vcmt.status_id=vcdt.status_id
where vcdt.vehicle_id=20 and  vdmt.details_id=4
group by vcdt.sub_details_id