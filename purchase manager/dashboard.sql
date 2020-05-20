/* evluater count*/
select count(distinct emt.employee_id) evaluater_count,
(select count(distinct vehicle_id)  from purchased_vehicle_details_tbl where on_boarded_by=8 and onboard_id=2) as purchased_vehicle_count,
count(distinct if(evat.is_submitted='Y' and evat.is_active='Y'and evat.vehicle_id not in (select vehicle_id from purchased_vehicle_details_tbl
where is_active='Y'),evat.vehicle_id,NULL)) as evaluated_vehicle_count,
(select count(distinct vehicle_id) from purchased_vehicle_details_tbl where on_boarded_by=8 and onboard_id=1) as follow_up
from employee_master_tbl emt inner join employee_roles_tbl ert on emt.role_id=ert.role_id and emt.is_active='Y'
left join evaluator_vehicle_assignment_tbl evat on evat.evaluator_id=emt.employee_id and evat.is_active='Y'
where ert.role_id=3;
