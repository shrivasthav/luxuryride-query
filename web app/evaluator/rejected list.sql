SELECT 
vmt.vehicle_id 'vehicleId', 
UCASE(plt.lead_name) 'custName', 
plt.phone_number 'custPhNo', 
cmt.city 'location',
UCASE(CONCAT(ct.car_make, '-', vfd.car_model)) AS 'carModel', 
UCASE(plt.registration_no) 'registrationNo', 
emt.first_name 'empname',
CONCAT(date(evat.rejected_on),' ',TIME_FORMAT(evat.rejected_on, '%h:%i:%s %p')) AS 'rejectedOn'
FROM 
purchase_lead_tbl plt 
INNER JOIN 
vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id AND plt.is_active = 'Y' 
inner join city_master_tbl cmt on cmt.city_id=plt.location_area_city and cmt.is_active='Y'
inner join car_model_master_tbl ct on ct.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfd on vfd.model_id=vmt.car_model
INNER JOIN 
evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id  AND evat.is_active = 'Y' 
inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id 
 WHERE evat.is_rejected = 'Y' 
and evat.is_confirmed='Y'
and evat.is_submitted='N'
GROUP BY plt.purchase_lead_id 
order by evat.rejected_on desc ;