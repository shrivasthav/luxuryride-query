select emt.first_name,emt.phone_number,emt.email_id,concat(st.showroom_code,' - ',ert.role) as role,cmt.city,ifnull(emt.employee_code,'NA') as employee_code,
(select count(distinct customer_id) from vehicle_sales_details_tbl where is_active='Y' and sold_by=emt.employee_id) as no_of_cutomers,
(select count(distinct vehicle_id) from vehicle_sales_details_tbl where is_active='Y' and sold_by=emt.employee_id) as no_of_cars
from employee_master_tbl emt
inner join employee_roles_tbl ert on ert.role_id=emt.role_id and emt.is_active='Y'
inner join city_master_tbl cmt on cmt.city_id=emt.employee_location 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.employee_id=3;