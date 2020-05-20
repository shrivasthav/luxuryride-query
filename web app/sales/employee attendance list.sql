select a.employee_id,a.first_name as employeeName,a.phone_number as phoneNumber,a.showroom_code,
case when attendance_date is null then 'Absent' 
     when attendance_date=date(now()) and a.morning_login_time is null  then 'Absent'
     when a.morning_login_time is null then 'Absent'
     else a.morning_login_time end as AMlogIn,
     
case when attendance_date is null  then 'Absent' 
     when attendance_date=date(now()) and a.evening_logout_time is null  then 'yet to logout'
     when a.evening_logout_time is null then 'Absent'
     else a.evening_logout_time end as PMlogOut     
     
from
(select emt.employee_id, emt.first_name,emt.phone_number,a.attendance_date,a.morning_login_time,a.evening_logout_time,st.showroom_code
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on  emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y' and emt.role_id=5
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
left join 
(select employee_id,morning_login_time,evening_logout_time,attendance_date
 from employee_shift_attendance_tbl where is_active='Y' and attendance_date='2020-05-11')a  
on a.employee_id=emt.employee_id
where  find_in_set(st.showroom_id,Getshowrmid(null))
group by emt.employee_id)a;