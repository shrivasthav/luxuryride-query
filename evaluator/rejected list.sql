SELECT 
vmt.vehicle_id 'vehicleId', 
UCASE(plt.lead_name) 'custName', 
plt.phone_number 'custPhNo', 
UCASE(CONCAT(plt.car_make, '-', plt.car_model)) AS 'carModel', 
UCASE(plt.registration_no) 'registrationNo', 
DATE(evat.rejected_on) AS 'rejectedOn' 
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
AND evat.is_rejected = 'Y' 
and evat.is_active='Y'
GROUP BY plt.purchase_lead_id 
order by evat.rejected_on desc ;