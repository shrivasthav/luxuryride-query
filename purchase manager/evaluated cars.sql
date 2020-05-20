select vmt.vehicle_id,vcit.front_view,
plt.transmission,vmt.odometer,vmt.fuel_type,vmt.no_of_owners,UCASE(CONCAT(cmt.car_make, '-', vfdt.car_model)) AS 'carModel',
UCASE(plt.registration_no) 'registrationNo',vmt.manufactured_year 
from evaluator_vehicle_assignment_tbl evat inner join vehicle_master_tbl vmt on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y'
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id
inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id 
inner join car_model_master_tbl cmt ON cmt.car_id = vmt.car_make 
INNER JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
where evat.is_submitted='Y' and evat.is_active='Y' and evat.is_confirmed='Y'
and evat.vehicle_id not in (select vehicle_id from purchased_vehicle_details_tbl where is_active='Y')
group by vmt.vehicle_id
order by evat.submitted_on;