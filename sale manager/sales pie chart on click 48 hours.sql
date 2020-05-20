SELECT
a.customerId,
a.customerName,
a.phoneNo,
a.followupDate,
a.customerStatus
FROM
(SELECT
slmt.customer_id 'customerId',
slmt.customer_name 'customerName',
slmt.phone_no 'phoneNo',
DATE_FORMAT(csut.followup_date, '%Y-%m-%d %h:%i %p') 'followupDate',
CASE
WHEN DATEDIFF(DATE(slmt.planning_to_by), DATE(NOW())) <= 15 THEN 'HOT+'
WHEN DATEDIFF(DATE(slmt.planning_to_by), DATE(NOW())) <= 30 THEN 'HOT'
WHEN DATEDIFF(DATE(slmt.planning_to_by), DATE(NOW())) <= 60 THEN 'WARM'
WHEN DATEDIFF(DATE(slmt.planning_to_by), DATE(NOW())) >= 60 THEN 'COLD'
END AS 'customerStatus',
CASE
WHEN csut.followup_date >= DATE_SUB(NOW(),
INTERVAL 24 HOUR) THEN 'twentyFourHours'
WHEN csut.followup_date >= DATE_SUB(NOW(),
INTERVAL 48 HOUR) THEN 'fortyEightHours'
WHEN csut.followup_date < DATE_SUB(NOW(),
INTERVAL 48 HOUR) THEN 'greaterThanFortyEightHours'
END AS 'followUpOn'
FROM
customer_status_update_tbl csut
INNER JOIN sales_lead_master_tbl slmt ON slmt.customer_id = csut.customer_id
LEFT JOIN city_master_tbl cmt ON cmt.city_id = slmt.location
LEFT JOIN budget_master_tbl bt ON bt.budget_id = slmt.budget
LEFT JOIN employee_master_tbl emt ON emt.employee_id = csut.updated_by
WHERE
csut.updated_by = 15
AND slmt.is_active = 'Y'
AND csut.is_active = 'Y'
AND csut.customer_status = 2
GROUP BY csut.customer_id) a
WHERE
a.followUpOn LIKE 'greaterThanFortyEightHours' ;