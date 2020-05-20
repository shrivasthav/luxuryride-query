select 
count(distinct svat.vehicle_id) as total_cars,
(select count(distinct customer_id) from customer_status_update_tbl where is_active='Y' and customer_status in (2,3) and updated_by=esat.employee_id) as total_followup,
(select count(distinct customer_id) from customer_status_update_tbl where is_active='Y' and customer_status=1 ) as total_enquiry,

(select count(distinct customer_id) from customer_status_update_tbl where is_active='Y' and customer_status in (2,3) 
and date(followup_date)=date(now()) and updated_by=esat.employee_id) as day_followup,
(select count(distinct customer_id) from customer_status_update_tbl where is_active='Y' and customer_status=1 and 
date(created_on)=date(now() )) as day_enquiry,


(select count(distinct customer_id) from customer_status_update_tbl where is_active='Y' and customer_status in (2,3) 
and month(followup_date)=month(now()) and year(followup_date)=year(now()) and updated_by=esat.employee_id) as monthly_followup,
(select count(distinct customer_id) from customer_status_update_tbl where is_active='Y' and customer_status=1 and 
month(created_on)=month(now()) and year(created_on)=year(now()) ) as monthly_enquiry,
(select count(distinct vehicle_id) from vehicle_sales_details_tbl where is_active='Y' and sold_by=esat.employee_id and 
month(sold_on)=month(now()) and year(sold_on)=year(now())) as monthly_sold_cars,
(select count(distinct customer_id) from vehicle_sales_details_tbl where is_active='Y' and sold_by=esat.employee_id and 
month(sold_on)=month(now()) and year(sold_on)=year(now())) as monthly_seller_leads


from showroom_vehicle_assignment_tbl svat inner join employee_showroom_assignment_tbl esat on svat.showroom_id=esat.showroom_id 
and svat.is_active='Y' and esat.is_active='Y'
where esat.employee_id=3;