select vmt.vehicle_id,vcit.front_view,
plt.transmission,vmt.odometer,vmt.fuel_type,vmt.no_of_owners,UCASE(CONCAT(cmt.car_make, '-', vfdt.car_model)) AS 'carModel',
UCASE(plt.registration_no) 'registrationNo',vmt.manufactured_year,pvdt.purchase_price,pvdt.selling_price,evpt.refurbish_amount
from purchased_vehicle_details_tbl pvdt inner join vehicle_master_tbl vmt on pvdt.vehicle_id=vmt.vehicle_id and pvdt.is_active='Y'
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id and onboard_id=2
inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id 
inner join evaluated_vehicle_pricing_details_tbl evpt on evpt.vehicle_id=pvdt.vehicle_id and evpt.is_active='Y'
inner join car_model_master_tbl cmt ON cmt.car_id = vmt.car_make 
INNER JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
where pvdt.on_boarded_by=8
group by vmt.vehicle_id;
