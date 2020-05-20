select vmt.vehicle_id,vcit.front_view,concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,vmt.odometer,vmt.manufactured_year
from vehicle_master_tbl vmt inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make and vmt.is_active='Y'
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id and vcit.is_active='Y'
where vmt.vehicle_id=20;


select CheckoutCalculationNew('35','2','2019-12-13 12:24:16')	
