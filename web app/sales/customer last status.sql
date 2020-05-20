select a.id,b.customer_id,b.customer_status,b.followup_status,b.visit_location,b.date_time,b.car_make,b.car_model,b.reg_number,b.vehicle_id,
b.km_in,b.km_out,b.reason_id,b.action,b.followup_date,b.comment,b.added_by,b.updated_by from 
(select  max(id) id
from customer_status_update_tbl where customer_id=153 and is_active='N' and reason_id is null)a
inner join 
(select id,customer_id,customer_status,followup_status,visit_location,date_time,car_make,car_model,reg_number,vehicle_id,km_in,km_out,reason_id,
action,followup_date,comment,added_by,updated_by from customer_status_update_tbl)b 
on a.id=b.id
group by b.customer_id;
 
 
 /* booked*/
 select a.id,b.customer_id,b.customer_status,b.followup_status,b.visit_location,b.date_time,b.car_make,b.car_model,b.reg_number,b.vehicle_id,
b.under_finance,b.finance_type,b.is_unbooked,b.km_in,b.km_out,b.reason_id,b.action,b.followup_date,b.comment,b.added_by,b.updated_by from 
(select  max(id) id
from customer_status_update_tbl where customer_id=153 and is_active='N' and is_unbooked='N')a
inner join 
(select id,customer_id,customer_status,followup_status,visit_location,date_time,car_make,car_model,reg_number,vehicle_id,
under_finance,finance_type,is_unbooked,km_in,km_out,reason_id,
action,followup_date,comment,added_by,updated_by from customer_status_update_tbl)b 
on a.id=b.id
group by b.customer_id;
 