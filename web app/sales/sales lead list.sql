select slmt.customer_id,slmt.customer_name,slmt.phone_no,cmt.city,slmt.planning_to_by,concat(showroom_code,' - ',emt.first_name) as employee_name
,slmt.added_on
 from sales_lead_master_tbl slmt inner join city_master_tbl cmt on cmt.city_id=slmt.location 
inner join employee_master_tbl emt on emt.employee_id=slmt.added_by
inner join customer_status_update_tbl csut on csut.customer_id=slmt.customer_id  
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id 
where csut.is_active='Y' and slmt.is_active='Y' and csut.customer_status=1
group by slmt.customer_id
order by slmt.added_on desc;

