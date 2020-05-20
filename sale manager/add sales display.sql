select slmt.customer_id,slmt.customer_name,slmt.phone_no,slmt.email,slmt.alternative_number,slmt.address,slmt.date_of_birth,
slmt.marital_status,slmt.anniversary,slmt.pincode,slmt.hobbies,cmt.city,smt.state
 from sales_lead_master_tbl slmt inner join city_master_tbl cmt on cmt.city_id=slmt.location
inner join state_master_tbl smt on smt.state_id=slmt.state
where slmt.phone_no=1234567890;

select 
case when customer_status=5 in (select customer_status from customer_status_update_tbl )
then 'Y' else 'N' end  'info_display_status'
 from customer_status_update_tbl where customer_id=2
 group by customer_id;