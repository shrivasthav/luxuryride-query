SELECT 
    evat.vehicle_id 'vehicleId',
    plt.lead_name 'custName',
    plt.phone_number 'custPhNo',
    plt.transmission  'Greattype',
    vmt.odometer 'odometer',
    vmt.fuel_type 'Fueltype',
    vmt.no_of_owners 'Owners',
    UCASE(CONCAT(cmt.car_make, '-', vfdt.car_model)) AS 'carModel',
    UCASE(plt.registration_no) 'registrationNo',
    vmt.manufactured_year 'manufacturedYear',
    CASE WHEN evat.is_active = 'Y' AND evat.is_confirmed = 'N' and evat.is_rejected='N' and evat.is_rescheduled='N' THEN
   CONCAT(DATE(evat.assigned_on),' ',TIME_FORMAT(evat.assigned_on, '%h:%i:%s %p'))
   WHEN evat.is_active = 'Y' AND evat.is_confirmed = 'Y' and evat.is_rejected='N' and evat.is_rescheduled='N' THEN
	CONCAT(DATE(evat.confirmed_on),' ',TIME_FORMAT(evat.confirmed_on, '%h:%i:%s %p'))
    WHEN evat.is_active = 'Y' AND evat.is_confirmed = 'Y' and evat.is_rescheduled='Y' THEN
	CONCAT(DATE(evat.reschedule_time_date),' ',TIME_FORMAT(evat.reschedule_time_date, '%h:%i:%s %p'))
    END AS 'assignedOn',
    
    CASE WHEN evat.is_active = 'Y' AND evat.is_confirmed = 'Y' AND evat.is_rejected = 'N' and evat.is_rescheduled='N' THEN 'Accepted'
        WHEN evat.is_active = 'Y' AND evat.is_confirmed = 'Y' AND evat.is_rejected = 'N' and evat.is_rescheduled='Y' THEN 'ReScheduled'
         END AS 'status'
FROM
    purchase_lead_tbl plt
        INNER JOIN
    vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id
        AND plt.is_active = 'Y'
        inner join city_master_tbl ct on ct.city_id=plt.location_area_city
        INNER JOIN
    evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id
        AND evat.is_active = 'Y'
        INNER JOIN
    car_model_master_tbl cmt ON cmt.car_id = vmt.car_make
        AND cmt.is_active = 'Y'
        INNER JOIN
    vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
        AND vfdt.is_active = 'Y'
        INNER JOIN
    employee_master_tbl emt ON emt.employee_id = evat.evaluator_id
WHERE
    emt.employee_id = 2
        AND evat.is_rejected = 'N'
        and evat.is_confirmed='Y'
        and evat.is_submitted='N'
GROUP BY evat.vehicle_id
ORDER BY status , assignedOn ASC;