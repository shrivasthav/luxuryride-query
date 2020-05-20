select slmt.customer_id,slmt.customer_name,slmt.phone_no,
slmt.address,slmt.planning_to_by,emt.first_name,
CONCAT(date(csut.created_on),' ',TIME_FORMAT(csut.created_on, '%h:%i:%s %p')) AS date_of_visit
 from sales_lead_master_tbl slmt inner join customer_status_update_tbl csut on slmt.customer_id=csut.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by 
where csut.customer_status in (5,6)
group by slmt.customer_id;