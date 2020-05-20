select 
case when employee_id in (select employee_id fromemployee_shift_attendance_tbl where is_active='Y' and date(attendance_date)=date(now())
and morning_login_time is not null)then 'Y' else 'N' end as morning_login_confirm,
case when employee_id in (select employee_id fromemployee_shift_attendance_tbl where is_active='Y' and date(attendance_date)=date(now())
and evening_logout_time is not null)then 'Y' else 'N' end as evening_login_confirm
from employee_shift_attendance_tbl where employee_id=3 
