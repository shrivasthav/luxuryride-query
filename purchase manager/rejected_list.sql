SELECT 
vmt.vehicle_id 'vehicleId', 
UCASE(plt.lead_name) 'custName',
UCASE(CONCAT(cmt.car_make, '-', vfdt.car_model)) AS 'carModel',
UCASE(plt.registration_no) 'registrationNo', 
plt.phone_number 'custPhNo',
emt.first_name 'EmpName',
evat.rej_comments 'Comment'
FROM 
purchase_lead_tbl plt 
INNER JOIN 
vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id 
AND plt.is_active = 'Y' 
inner join car_model_master_tbl cmt ON cmt.car_id = vmt.car_make 
        INNER JOIN
    vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
INNER JOIN 
evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id 
inner join employee_master_tbl emt on evat.evaluator_id=emt.employee_id
AND evat.is_active = 'Y' 
WHERE evat.is_rejected = 'Y' 
and evat.is_confirmed='Y'
and evat.is_submitted='N'
GROUP BY plt.purchase_lead_id 
order by evat.rejected_on desc ;