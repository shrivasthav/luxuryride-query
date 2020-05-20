select slmt.customer_id,slmt.customer_name,slmt.phone_no,
concat(st.showroom_code,' - ',emt.first_name) as employee_name,
st.showroom_name,
case when datediff(date(slmt.planning_to_by),date(now()))<=15 then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30 then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60 then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))<=90 then 'COLD'
     else 'FREEZ' end as customer_status
from sales_lead_master_tbl slmt inner join customer_status_update_tbl csut on slmt.customer_id=csut.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where csut.customer_status not in (4,5,6,7)
group by slmt.customer_id
ORDER BY slmt.planning_to_by asc;