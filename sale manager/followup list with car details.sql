select vmt.vehicle_id,vmt.car_make, cmt.car_make,vmt.car_model,vfdt.car_model
 from showroom_vehicle_assignment_tbl svat inner join employee_showroom_assignment_tbl esat on svat.showroom_id=esat.showroom_id
and svat.is_active='Y' and esat.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_make
where esat.employee_id=3 and vmt.car_make=1;
