SELECT
invester_id 'InvesterId',
invester_name 'InvesterName',
phone_number 'phoneNumber'
FROM
invester_master_tbl
WHERE
is_active='Y'
AND (phone_number =7799886656   OR email_id ='naveen@gmail.com' )
AND password =12345678
UNION SELECT 'NA', 'NA', 'NA' LIMIT 1 ;