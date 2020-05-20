select vmt.vehicle_id,cmt.car_make,vfdt.car_model,vmt.color,vmt.vehicle_no,vgdt.km_in,vgdt.km_out,vgdt.date_time,vgdt.attachments,
vgdt.remarks 
from showroom_vehicle_assignment_tbl svat inner join vehicle_gatepass_details_tbl vgdt on svat.vehicle_id=vgdt.vehicle_id
and svat.is_active='Y' and vgdt.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=svat.vehicle_id 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where vmt.vehicle_id=202;