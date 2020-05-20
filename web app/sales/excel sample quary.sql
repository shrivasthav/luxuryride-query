select slmt.customer_id, slmt.customer_name,slmt.phone_no,ifnull(slmt.alternative_number,'NA') as alternative_number,
ifnull(slmt.email,'NA') as email,ifnull(slmt.address,'NA') as address,ifnull(slmt.date_of_birth,'NA') as date_of_birth,
ifnull(slmt.marital_status,'NA') as marital_status,ifnull(slmt.anniversary,'NA') as anniversary,ifnull(slmt.hobbies,'NA') as hobbies,
ifnull(st.state,'NA') as state,ifnull(ct.city,'NA') as city,ifnull(slmt.pincode,'NA') as pincode,
ifnull(sls.source_name,'NA') as source_name,'1400000' as budget,slmt.planning_to_by,cst.title,
csut.followup_date,ifnull(csut.comment,'NA') as comment ,ifnull(emt.first_name,'NA') as first_name,
ifnull(cmt.car_make,'NA') as car_make,ifnull(vfdt.car_model,'NA') as car_model
 from sales_lead_master_tbl slmt inner join customer_status_update_tbl csut on slmt.customer_id=csut.customer_id 
and slmt.is_active='Y' 
left join expecting_cars_tbl ect on ect.customer_id=slmt.customer_id 
left join car_model_master_tbl cmt on cmt.car_id=ect.make
left join vehicle_full_details_tbl vfdt on vfdt.model_id=ect.model_id
left join state_master_tbl st on st.state_id=slmt.state
left join city_master_tbl ct on ct.city_id=slmt.location
left join sales_lead_source_tbl sls on sls.lead_source_id=slmt.lead_source
left join customer_status_tbl cst on cst.status_id=csut.customer_status
left join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.customer_status in (1,2) and slmt.customer_id in (3,86,87,88,89)
group by slmt.customer_id 
order by slmt.customer_id  asc


