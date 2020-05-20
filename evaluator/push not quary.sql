select count(distinct a.vehicle_id) 'vehicle_count',a.evaluator_id, a.confirmdate,ifnull(eddt.notification_token,'NA') as notification_token
 from 
 (select vehicle_id,date(confirmed_on) as confirmdate, evaluator_id from evaluator_vehicle_assignment_tbl where is_active='Y'  and is_confirmed='Y'
  and is_rejected='N' 
 union all
 select vehicle_id,date(reschedule_time_date) as confirmdate ,evaluator_id from evaluator_vehicle_assignment_tbl where is_active='Y' and is_confirmed='Y'
 and is_rescheduled='Y' and is_rejected='N' )a
 left join employee_device_details_tbl eddt on eddt.employee_id=a.evaluator_id and eddt.is_active='Y'
 where a.confirmdate=date(now())
 group by a.evaluator_id	