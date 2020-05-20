select vvmt.varient_id,cmt.car_make,vfdt.car_model,vtmt.car_type,vvmt.varient_name 
from car_model_master_tbl cmt inner join vehicle_full_details_tbl vfdt on cmt.car_id=vfdt.car_id and cmt.is_active='Y'
and vfdt.is_active='Y'
inner join vehicle_type_master_tbl vtmt on vtmt.car_type_id=vfdt.car_type
inner join vehicle_varient_master_tbl vvmt on vvmt.model_id=vfdt.model_id
group by vvmt.varient_id;


