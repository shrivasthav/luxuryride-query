select slmt.customer_id,slmt.customer_name,slmt.phone_no,date(slmt.added_on) as added_on
from sales_lead_master_tbl slmt inner join customer_status_update_tbl  cst on slmt.customer_id=cst.customer_id 
and slmt.is_active='Y' and cst.is_active='Y' 
where (cst.customer_status=1)
group by slmt.customer_id 
order by slmt.added_on desc
    

SELECT
slmt.customer_id 'customerId',
slmt.customer_name 'customerName',
slmt.phone_no 'phoneNo',
case when datediff(date(slmt.planning_to_by),date(now()))<=15 then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30 then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60 then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))<=90 then 'COLD'
     else 'FREEZ' end as customer_status,
DATE_FORMAT(slmt.added_on, '%d-%m-%Y') 'addedOn'
FROM
sales_lead_master_tbl slmt
INNER JOIN
customer_status_update_tbl cst ON slmt.customer_id = cst.customer_id
AND slmt.is_active = 'Y'
AND cst.is_active = 'Y'
WHERE
cst.customer_status = 1
GROUP BY slmt.customer_id
ORDER BY slmt.planning_to_by asc ;


/* cooment list*/
SELECT
csut.customer_id 'customerId',
cst.title,
emt.first_name as manager_name,
comment
FROM
customer_status_update_tbl csut inner join  customer_status_tbl cst on cst.status_id=csut.customer_status
inner join employee_master_tbl emt on emt.employee_id=csut.manager_id
left join customer_followup_status_tbl cfst on cfst.followup_status_id=csut.followup_status
left join car_model_master_tbl cmt on cmt.car_id=csut.car_make
left join vehicle_full_details_tbl vfdt on vfdt.model_id=csut.car_model
WHERE  csut.customer_id = 108 and csut.customer_status in (5,6);