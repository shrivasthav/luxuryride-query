select slmt.customer_id,slmt.customer_name,slmt.phone_no,emt.first_name,st.showroom_name
from sales_lead_master_tbl slmt inner join customer_status_update_tbl csut on slmt.customer_id=csut.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where csut.customer_status in (5,6)
group by slmt.customer_id;