select csut.customer_id,slmt.customer_name,slmt.phone_no,eat.assigned_to,
case when (customer_status in(4) or (customer_status in (5,6) and action='A')) then 'Closed'
	when customer_status in(6) then 'Booked' end as 'notification_type'
 from customer_status_update_tbl csut inner join employee_assignment_tbl eat on eat.employee_id=csut.updated_by
 inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id
and eat.is_active='Y'
where (customer_status in(4,6) or (customer_status in (5,6) and action='A'))
and csut.updated_by=15  and date(csut.created_on)=date(now());

