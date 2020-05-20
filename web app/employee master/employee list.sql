select emt.employee_id,emt.first_name,emt.phone_number,emt.email_id,concat(st.showroom_code,' - ',ert.role) as designation,
cmt.city,emt.created_on
from employee_master_tbl emt 
inner join city_master_tbl cmt on emt.employee_location=cmt.city_id and emt.is_active='Y' and cmt.is_active='Y'
inner join employee_roles_tbl ert on ert.role_id=emt.role_id 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
group by emt.employee_id;
