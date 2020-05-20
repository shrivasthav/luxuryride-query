select evat.vehicle_id, plt.lead_name,plt.phone_number, evat.evaluator_id,eddt.device_imei
 from evaluator_vehicle_assignment_tbl evat inner join vehicle_master_tbl vmt on evat.vehicle_id=vmt.vehicle_id
inner join purchase_lead_tbl plt on plt.purchase_lead_id=vmt.purchase_lead_id
inner join employee_device_details_tbl eddt on eddt.employee_id=evat.evaluator_id and eddt.is_active='Y'
 where  is_confirmed='Y' and is_reassigned='N' and  is_rejected='N'
and is_rescheduled='N' and date(assigned_on)='2019-11-30' order by assigned_on desc limit 1