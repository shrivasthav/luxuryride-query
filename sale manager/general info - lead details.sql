select slmt.customer_id, slmt.customer_name,slmt.phone_no,slmt.email,slmt.date_of_birth,slmt.marital_status,slmt.anniversary,slmt.hobbies,
slmt.alternative_number,slmt.address,cmt.city,slmt.pincode,slst.source_name,bmt.budget,
cst.comment as remarks,
case when datediff(date(planning_to_by),date(now()))<=15 then 'HOT+'
     when datediff(date(planning_to_by),date(now()))<=30 then 'HOT'
     when datediff(date(planning_to_by),date(now()))<=60 then 'WARM'
     when datediff(date(planning_to_by),date(now()))<=90 then 'COLD'
   else 'FREEZ' end as customer_status
 from sales_lead_master_tbl slmt inner join customer_status_update_tbl cst on slmt.customer_id=cst.customer_id
 inner join sales_lead_source_tbl slst on slst.lead_source_id=slmt.lead_source
 inner join state_master_tbl smt on smt.state_id=slmt.state
 inner join city_master_tbl cmt on cmt.city_id=slmt.location
 inner join budget_master_tbl bmt on bmt.budget_id=slmt.budget 
and slmt.is_active='Y' and cst.is_active='Y'
where slmt.customer_id=80;

/* comment list*/
select customer_id,date(created_on),comment from customer_status_update_tbl where customer_status=2 and customer_id=20;

SELECT
csut.customer_id 'customerId',
cst.title,
cfst.followup_status,
visit_location,
date_time,
concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
comment
FROM
customer_status_update_tbl csut inner join  customer_status_tbl cst on cst.status_id=csut.customer_status
left join customer_followup_status_tbl cfst on cfst.followup_status_id=csut.followup_status
left join car_model_master_tbl cmt on cmt.car_id=csut.car_make
left join vehicle_full_details_tbl vfdt on vfdt.model_id=csut.car_model
WHERE  csut.customer_id = 1 and csut.customer_status not in (1);



SELECT
csut.customer_id 'customerId',
cst.title,
cfst.followup_status,
visit_location,
date_time,
concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
emt.first_name as manager_name,
comment
FROM
customer_status_update_tbl csut inner join  customer_status_tbl cst on cst.status_id=csut.customer_status
left join employee_master_tbl emt on emt.employee_id=csut.manager_id
left join customer_followup_status_tbl cfst on cfst.followup_status_id=csut.followup_status
left join car_model_master_tbl cmt on cmt.car_id=csut.car_make
left join vehicle_full_details_tbl vfdt on vfdt.model_id=csut.car_model
WHERE  csut.customer_id = 118 and (csut.comment is not null or csut.manager_comment is not null);