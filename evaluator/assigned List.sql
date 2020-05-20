SELECT 
    evat.vehicle_id 'vehicleId',
    plt.lead_name 'custName',
    plt.phone_number 'custPhNo',
    ct.city 'location',
    UCASE(CONCAT(cmt.car_make, '-', vfdt.car_model)) AS 'carModel',
    UCASE(plt.registration_no) 'registrationNo',
    emt.first_name 'empName',
    vmt.manufactured_year 'manufacturedYear',
    vmt.odometer,
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
       
        AND evat.vehicle_id NOT IN (SELECT  a.vehicle_id
        FROM
            (SELECT 
                vddt.vehicle_id
            FROM
                vehicle_document_details_tbl vddt
            INNER JOIN vehicle_condition_images_tbl vcit ON vddt.vehicle_id = vcit.vehicle_id
            INNER JOIN evaluated_vehicle_pricing_details_tbl evpdt ON evpdt.vehicle_id = vcit.vehicle_id
            INNER JOIN evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = evpdt.vehicle_id
                AND evat.is_submitted = 'Y') a
                INNER JOIN
            (SELECT b.vehicle_id FROM
                (SELECT 
                CASE
                        WHEN a.counts = a.sub_count THEN a.vehicle_id
                        ELSE 0
                    END AS vehicle_id
            FROM
                (SELECT COUNT(sub_details_id) AS counts,vehicle_id,
                    (SELECT COUNT(sub_details_id) FROM sub_details_master_tbl WHERE is_active = 'Y') AS sub_count
            FROM vehicle_condition_details_tbl WHERE is_active = 'Y'
            GROUP BY vehicle_id) a) b) c ON c.vehicle_id = a.vehicle_id)
GROUP BY evat.vehicle_id
ORDER BY status , assignedOn ASC;