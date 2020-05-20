select slmt.customer_id,slmt.customer_name,slmt.phone_no,slmt.email,slmt.alternative_number,slmt.address,cmt.city,slmt.pincode,slt.source_name,
bmt.budget,ct.title,pmt.planning_name,emt.first_name,cst.comment,
case when cst.customer_status=2 and cst.customer_id=slmt.customer_id then st.showroom_name
  else 'NA' end as showroom 
 from sales_lead_master_tbl slmt inner join city_master_tbl cmt on cmt.city_id=slmt.location and slmt.is_active='Y'
 inner join sales_lead_source_tbl slt on slt.lead_source_id=slmt.lead_source
 inner join budget_master_tbl bmt on bmt.budget_id=slmt.budget
 inner join customer_status_update_tbl cst on cst.customer_id=slmt.customer_id and cst.is_active='Y'
 inner join customer_status_tbl ct on ct.id=cst.customer_status
 inner join customer_planning_master_tbl pmt on pmt.planning_id=slmt.planning_by
 inner join employee_master_tbl emt on emt.employee_id=slmt.added_by
 left join employee_showroom_assignment_tbl eshat on eshat.employee_id=cst.updated_by
 left join showrooms_tbl st on st.showroom_id=eshat.showroom_id 
 where slmt.customer_id=2
 
 
 
 