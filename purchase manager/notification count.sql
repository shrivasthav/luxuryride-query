select pvdt.on_boarded_by as employee_id,count(distinct pvdt.vehicle_id) as followup_count
from purchased_vehicle_details_tbl pvdt inner join purchase_price_change_tbl ppct on pvdt.vehicle_id=ppct.vehicle_id
and pvdt.is_active='Y' and ppct.is_active='Y'
where pvdt.onboard_id=1 and date(ppct.follow_up_date)='2020-01-08'
group by pvdt.on_boarded_by;

/* list*/
select pvdt.on_boarded_by as employee_id,ppct.vehicle_id,ppct.follow_up_date
from purchased_vehicle_details_tbl pvdt inner join purchase_price_change_tbl ppct on pvdt.vehicle_id=ppct.vehicle_id
and pvdt.is_active='Y' and ppct.is_active='Y'
where pvdt.onboard_id=1
group by ppct.vehicle_id; 
