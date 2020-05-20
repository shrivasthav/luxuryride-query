delimiter $$
CREATE PROCEDURE `EmpDailyAttendance`(in showroom_id_set int,in select_date date)
begin
declare showroom_id_get int;
declare showroomIds varchar(1000);
declare getdate date;
if showroom_id_set is null then
set showroom_id_get = 0;
else 
set showroom_id_get = showroom_id_set;
end if;
set showroomIds = Getshowrmid(showroom_id_get); 
set getdate=select_date;

select a.first_name,a.phone_number,
case when attendance_date is null then 'Absent' 
     when a.morning_login_time is null then 'Absent'
     else a.morning_login_time end as morning_login_time,
case when attendance_date is null then 'Absent' 
     when a.evening_logout_time is null then 'Absent'
     else a.evening_logout_time end as evening_logout_time     
     
from
(select emt.first_name,emt.phone_number,a.attendance_date,a.morning_login_time,a.evening_logout_time
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on  emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y' and emt.role_id=5
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
left join 
(select employee_id,morning_login_time,evening_logout_time,attendance_date
 from employee_shift_attendance_tbl where is_active='Y' and attendance_date=getdate)a  
on a.employee_id=emt.employee_id
where  find_in_set(st.showroom_id,showroomIds)
group by emt.employee_id)a;

       
end