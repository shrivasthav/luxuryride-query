SELECT
a.title 'customerStatus',
a.followupStatus,
a.followup_date 'followupDate',
a.visit_location 'visitLocation',
a.dateTime,
a.vehicleName,
a.reg_number 'regNumber',
a.km_in 'kmsIn',
a.km_out 'kmsOut',
a.managerName,
a.comments
FROM
(SELECT
csut.id AS id,csut.comment_off,
csut.customer_id,
cst.title,
IFNULL(cfst.followup_status, 'NA') 'followupStatus',
csut.followup_date,
csut.visit_location,
IFNULL(csut.date_time, 'NA') 'dateTime',
IFNULL(CONCAT(cmt.car_make, ' - ', vfdt.car_model), 'NA') 'vehicleName',
csut.reg_number,
csut.km_in,
csut.km_out,
IFNULL(CASE
WHEN
(csut.customer_status IN (5 , 6)
OR csut.followup_status = 6)
THEN
'NA'
END, 'NA') AS 'managerName',
IFNULL(csut.comment, 'NA') 'comments'
FROM
customer_status_update_tbl csut
INNER JOIN customer_status_tbl cst ON cst.status_id = csut.customer_status
LEFT JOIN employee_master_tbl emt ON emt.employee_id = csut.manager_id
LEFT JOIN customer_followup_status_tbl cfst ON cfst.followup_status_id = csut.followup_status
LEFT JOIN car_model_master_tbl cmt ON cmt.car_id = csut.car_make
LEFT JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = csut.car_model
WHERE
csut.comment IS NOT NULL
GROUP BY csut.id UNION ALL SELECT
csut.id,csut.comment_off,
csut.customer_id,
cst.title,
IFNULL(cfst.followup_status, 'NA') 'followupStatus',
csut.followup_date,
csut.visit_location,
csut.date_time,
IFNULL(CONCAT(cmt.car_make, ' - ', vfdt.car_model), 'NA') 'vehicleName',
csut.reg_number,
csut.km_in,
csut.km_out,
emt.first_name,
csut.manager_comment 'comments'
FROM
customer_status_update_tbl csut
INNER JOIN customer_status_tbl cst ON cst.status_id = csut.customer_status
LEFT JOIN employee_master_tbl emt ON emt.employee_id = csut.manager_id
LEFT JOIN customer_followup_status_tbl cfst ON cfst.followup_status_id = csut.followup_status
LEFT JOIN car_model_master_tbl cmt ON cmt.car_id = csut.car_make
LEFT JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = csut.car_model
WHERE
csut.customer_status IN (5 , 6)
AND csut.reason_id IS NOT NULL
AND csut.action IS NOT NULL
AND (csut.comment IS NOT NULL
OR csut.manager_comment IS NOT NULL)
GROUP BY csut.id UNION ALL SELECT
csut.id,csut.comment_off,
csut.customer_id,
cst.title,
IFNULL(CASE
WHEN
csut.is_unbooked = 'Y'
AND csut.action = 'A'
THEN
'UnBooked Request'
WHEN
csut.is_unbooked = 'N'
AND csut.action = 'R'
THEN
'UnBooked Request'
WHEN
csut.is_unbooked = 'Y'
AND csut.action IS NULL
THEN
'UnBooked Request'
END, 'NA') 'followupStatus',
csut.followup_date,
csut.visit_location,
csut.date_time,
IFNULL(CONCAT(cmt.car_make, ' - ', vfdt.car_model), 'NA') 'vehicleName',
csut.reg_number,
csut.km_in,
csut.km_out,
IFNULL(CASE
WHEN (csut.followup_status = 6) THEN 'NA'
END, 'NA') AS 'managerName',
IFNULL(csut.unboock_comment, 'NA') 'comments'
FROM
customer_status_update_tbl csut
INNER JOIN customer_status_tbl cst ON cst.status_id = csut.customer_status
LEFT JOIN employee_master_tbl emt ON emt.employee_id = csut.manager_id
LEFT JOIN customer_followup_status_tbl cfst ON cfst.followup_status_id = csut.followup_status
LEFT JOIN car_model_master_tbl cmt ON cmt.car_id = csut.car_make
LEFT JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = csut.car_model
WHERE
(csut.is_active = 'Y'
OR csut.is_active = 'N')
AND csut.unboock_comment IS NOT NULL
AND csut.followup_status = 6
AND csut.comment IS NOT NULL
GROUP BY csut.id UNION ALL SELECT
csut.id,csut.comment_off,
csut.customer_id,
cst.title,
IFNULL(CASE
WHEN
csut.is_unbooked = 'Y'
AND csut.action = 'A'
THEN
'UnBooked Accept'
WHEN
csut.is_unbooked = 'N'
AND csut.action = 'R'
THEN
'UnBooked Reject'
END, 'NA') 'followupStatus',
csut.followup_date,
csut.visit_location,
csut.date_time,
IFNULL(CONCAT(cmt.car_make, ' - ', vfdt.car_model), 'NA') 'vehicleName',
csut.reg_number,
csut.km_in,
csut.km_out,
emt.first_name,
csut.manager_comment 'comments'
FROM
customer_status_update_tbl csut
INNER JOIN customer_status_tbl cst ON cst.status_id = csut.customer_status
LEFT JOIN employee_master_tbl emt ON emt.employee_id = csut.manager_id
LEFT JOIN customer_followup_status_tbl cfst ON cfst.followup_status_id = csut.followup_status
LEFT JOIN car_model_master_tbl cmt ON cmt.car_id = csut.car_make
LEFT JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = csut.car_model
WHERE
csut.followup_status = 6
AND csut.action IS NOT NULL
AND csut.comment IS NOT NULL
GROUP BY csut.id) a
WHERE a.comment_off='N' and 
a.customer_id = 158 
GROUP BY a.title , a.followupStatus , a.comments
ORDER BY a.id 