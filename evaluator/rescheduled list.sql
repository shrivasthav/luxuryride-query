SELECT 
vmt.vehicle_id 'vehicleId', 
UCASE(plt.lead_name) 'custName', 
plt.phone_number 'custPhNo', 
UCASE(CONCAT(plt.car_make, '-', plt.car_model)) AS 'carModel', 
UCASE(plt.registration_no) 'registrationNo', 
CONCAT(DATE(evat.reschedule_time_date), 
' ', 
TIME_FORMAT(evat.reschedule_time_date, '%h:%i:%s %p')) AS 'assignedOn' 
FROM 
purchase_lead_tbl plt 
INNER JOIN 
vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id 
AND plt.is_active = 'Y' 
INNER JOIN 
evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id 
AND evat.is_active = 'Y' 
WHERE 
evat.evaluator_id = 2 
AND evat.is_rescheduled = 'Y' 
and evat.is_active='Y' and evat.is_rejected='N'
AND evat.is_confirmed = 'Y' 
AND evat.vehicle_id NOT IN (SELECT 
vehicle_id 
FROM 
evaluator_vehicle_assignment_tbl 
WHERE 
is_submitted = 'Y') 
GROUP BY plt.purchase_lead_id 
ORDER BY assignedOn asc ;