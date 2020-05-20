select emt.employee_id,emt.first_name,emt.phone_number,emt.email_id,ert.role,count(distinct pvdt.vehicle_id) as on_boarded
 from employee_master_tbl emt inner join employee_roles_tbl ert on ert.role_id=emt.role_id 
 left join purchased_vehicle_details_tbl pvdt on emt.employee_id=pvdt.on_boarded_by
and pvdt.is_active='Y' where emt.employee_id=8;