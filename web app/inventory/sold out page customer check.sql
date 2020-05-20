select slmt.customer_id,slmt.customer_name,slmt.phone_no,
case when slmt.customer_id in (select customer_id from customer_status_update_tbl where is_active='Y' ) then 'Y' 
else 'N' end as create_status,

case when slmt.customer_id  in (select customer_id from customer_status_update_tbl where is_active='Y' ) then
(select Ifnull(updated_by,'NA') as updated_by_id
 from customer_status_update_tbl where customer_id=slmt.customer_id and is_active='Y' group by customer_id)
 else 'NA' end as updated_by,
 
case when slmt.customer_id  in (select customer_id from customer_status_update_tbl where is_active='Y' ) then 
(select Ifnull(emt.first_name,'NA') as employee_name
 from customer_status_update_tbl csut left join employee_master_tbl emt on csut.updated_by=emt.employee_id
where csut.customer_id=slmt.customer_id and csut.is_active='Y' group by csut.customer_id)
else 'NA' end as updated_by_name
from sales_lead_master_tbl slmt 
left join customer_status_update_tbl csut on csut.customer_id=slmt.customer_id and slmt.is_active='Y'
where phone_no=8904061334
group by slmt.customer_id
