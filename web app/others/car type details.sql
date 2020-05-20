select car_type_id,car_type from vehicle_type_master_tbl where is_active='Y';

select cmmt.car_id,cmmt.car_make from car_model_master_tbl cmmt 
inner join vehicle_full_details_tbl vfdt on cmmt.car_id=vfdt.car_id and cmmt.is_active='Y' and 
vfdt.is_active='Y'
where vfdt.car_type=1
group by cmmt.car_make;

select vfdt.model_id,vfdt.car_model from car_model_master_tbl cmmt 
inner join vehicle_full_details_tbl vfdt on cmmt.car_id=vfdt.car_id and cmmt.is_active='Y' and 
vfdt.is_active='Y'
where vfdt.car_id=3
group by vfdt.car_model;

select vvmt.varient_name from car_model_master_tbl cmmt 
inner join vehicle_full_details_tbl vfdt on cmmt.car_id=vfdt.car_id and cmmt.is_active='Y' and 
vfdt.is_active='Y'
inner join vehicle_varient_master_tbl vvmt on vvmt.model_id=vfdt.model_id and vvmt.is_active='Y'
where vvmt.model_id=1
group by vvmt.varient_name;