SELECT
b.confirmDate, CONCAT(vehicleCount, ' C') AS vehicleCount
FROM
(SELECT
a.confirmDate, SUM(a.vehicleCount) AS vehicleCount
FROM
(SELECT
DATE(confirmed_on) AS 'confirmDate',
COUNT(DISTINCT vehicle_id) AS 'vehicleCount',
vehicle_id
FROM
evaluator_vehicle_assignment_tbl
WHERE
evaluator_id = 2 AND is_confirmed = 'Y' and is_active='Y'
AND is_rescheduled = 'N' and is_rejected='N'
AND DATE(confirmed_on) >= DATE(NOW())
GROUP BY confirmed_on
UNION ALL SELECT
DATE(reschedule_time_date) AS date,
COUNT(DISTINCT vehicle_id) AS count,
vehicle_id
FROM
evaluator_vehicle_assignment_tbl
WHERE
evaluator_id = 2 AND is_confirmed = 'Y' and is_active='Y'
AND is_rescheduled = 'Y' and is_rejected='N'
AND DATE(reschedule_time_date) >= DATE(NOW())
GROUP BY reschedule_time_date) a
GROUP BY a.confirmDate) b
GROUP BY b.confirmDate
ORDER BY b.confirmDate ASC ;


/* details*/
SELECT
a.vehicle_id,
a.leadName 'leadName',
a.leadContactNo 'leadContactNo',
a.vehicleName 'vehicleName',
a.registrationNo 'registrationNo',
a.confirmDate 'confirmDate'
FROM
(SELECT
vmt.vehicle_id,
plt.lead_name 'leadName',
plt.phone_number 'leadContactNo',
CONCAT(cmmt.car_make, ' ', vfdt.car_model) 'vehicleName',
plt.registration_no 'registrationNo',
CONCAT(DATE(evat.confirmed_on), ' ',
TIME_FORMAT(evat.confirmed_on, '%h:%i:%s %p')) AS 'confirmDate'
FROM
purchase_lead_tbl plt
INNER JOIN vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id
AND plt.is_active = 'Y'
INNER JOIN car_model_master_tbl cmmt ON cmmt.car_id = vmt.car_make
AND cmmt.is_active = 'Y'
INNER JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
AND vfdt.is_active = 'Y'
INNER JOIN evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id
AND evat.is_active = 'Y'
WHERE
is_confirmed = 'Y'
AND is_rescheduled = 'N' and is_rejected='N'
AND DATE(evat.confirmed_on) = '2019-12-23'
AND evat.evaluator_id = 2
GROUP BY vmt.vehicle_id UNION ALL SELECT
vmt.vehicle_id,
plt.lead_name 'leadName',
plt.phone_number 'leadContactNo',
CONCAT(cmmt.car_make, ' ', plt.car_model) 'vehicleName',
plt.registration_no 'registrationNo',
CONCAT(DATE(evat.reschedule_time_date), ' ',
TIME_FORMAT(evat.reschedule_time_date, '%h:%i:%s %p')) AS 'confirmDate'
FROM
purchase_lead_tbl plt
INNER JOIN vehicle_master_tbl vmt ON plt.purchase_lead_id = vmt.purchase_lead_id
AND plt.is_active = 'Y'
INNER JOIN car_model_master_tbl cmmt ON cmmt.car_id = vmt.car_make
AND cmmt.is_active = 'Y'
INNER JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
AND vfdt.is_active = 'Y'
INNER JOIN evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = vmt.vehicle_id
AND evat.is_active = 'Y'
WHERE
is_confirmed = 'Y'
AND is_rescheduled = 'Y' and is_rejected='N'
AND DATE(evat.reschedule_time_date) = '2019-12-23'
AND evat.evaluator_id = 2
GROUP BY evat.vehicle_id) a
GROUP BY a.vehicle_id
ORDER BY a.confirmDate DESC;