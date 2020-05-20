SELECT 
vmt.vehicle_id 'vehicleId', 
UCASE(plt.lead_name) 'custName', 
plt.phone_number 'custPhNo', 
UCASE(CONCAT(cmt.car_make, '-', vft.car_model)) AS 'carModel', 
UCASE(plt.registration_no) 'registrationNo', 
evat.res_comments,
CONCAT(date(evat.reschedule_time_date),' ',TIME_FORMAT(evat.reschedule_time_date, '%h:%i:%s %p')) AS reschedule_date
FROM 
purchase_lead_tbl plt 
INNER JOIN 
vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id 
AND plt.is_active = 'Y' 
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vft on vft.model_id=vmt.car_model
INNER JOIN  
evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id 
AND evat.is_active = 'Y' 
WHERE 
 evat.is_rejected = 'N' 
and evat.is_confirmed='Y'
and evat.is_rescheduled='Y'
and evat.is_submitted='N'
GROUP BY plt.purchase_lead_id 
order by evat.reschedule_time_date desc ;