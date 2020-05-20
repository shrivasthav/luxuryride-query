select 
(select count(vehicle_id) as evaluated_cars from evaluator_vehicle_assignment_tbl where is_submitted='Y' and is_active='Y' and is_confirmed='Y'
and date(submitted_on)=date(now())) as evaluated_cars,

(select count(distinct vehicle_id) as purchased_cars
from purchased_vehicle_details_tbl where onboard_id=2 and date(owned_on)=date(now())) as purchased_cars,

(select count(vehicle_id) as evaluated_cars from evaluator_vehicle_assignment_tbl where is_submitted='Y' and is_active='Y' and is_confirmed='Y'
and month(submitted_on)=month(now()) and year(submitted_on)=year(now())) as evaluated_cars,

(select count(distinct vehicle_id) as purchased_cars
from purchased_vehicle_details_tbl where onboard_id=2 and month(owned_on)=month(now()) and year(owned_on)=year(now()))as purchased_cars,

(select count(distinct vehicle_id) as evaluation_pending
from evaluator_vehicle_assignment_tbl where is_active='Y' and is_confirmed='Y' and is_rejected='N' and is_submitted='N') as evaluation_pending,

(select count(distinct vehicle_id) from purchased_vehicle_details_tbl where onboard_id=1 and is_active='Y') as pending_followup_cars,

(select count(vehicle_id) as rejected_cars from evaluator_vehicle_assignment_tbl where is_submitted='N' and is_active='Y' 
and is_rejected='Y') as rejected_cars,

(select count(distinct employee_id)  from employee_master_tbl where role_id=4 and is_active='Y') as purchase_manager;


/* pending evaluation on click */
select evat.evaluator_id,emt.first_name, count(distinct evat.vehicle_id) as evaluation_pending
from evaluator_vehicle_assignment_tbl evat inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id
and emt.is_active='Y'
 where evat.is_active='Y' and evat.is_confirmed='Y' and evat.is_rejected='N' and evat.is_submitted='N'
group by evat.evaluator_id;

/* on click follow up count*/
select  emt.first_name,count(distinct pvdt.vehicle_id) as follow_up_count
from employee_master_tbl emt inner join purchased_vehicle_details_tbl pvdt on pvdt.on_boarded_by=emt.employee_id
and emt.is_active='Y' and pvdt.is_active='Y'  
where pvdt.onboard_id=1
group by emt.employee_id;

/* on click purchase manager*/
select emt.employee_id,emt.first_name ,ifnull(a.no_of_evaluators,0) as no_of_evaluators
from employee_master_tbl emt 
left join 
(select eat.assigned_to ,count(distinct eat.employee_id) as no_of_evaluators
from employee_assignment_tbl eat inner join employee_master_tbl emt on emt.employee_id=eat.employee_id
and emt.role_id=3 and emt.is_active='Y' group by eat.assigned_to)a on a.assigned_to=emt.employee_id
where emt.role_id=4 and emt.is_active='Y'
group by emt.employee_id;


/* on click purchase manager list*/
select emt.employee_id,emt.first_name
 from employee_assignment_tbl eat inner join employee_master_tbl emt on eat.employee_id=emt.employee_id and eat.is_active='Y'
and emt.is_active='Y' and emt.role_id=3
where eat.assigned_to=14
group by emt.employee_id;

/*on click rejected cars*/
select emt.employee_id,emt.first_name,count(distinct evat.vehicle_id) as rehected_cars
from evaluator_vehicle_assignment_tbl evat inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id
where evat.is_active='Y' and evat.is_confirmed='Y' and evat.is_rejected='Y' and evat.is_submitted='N' 
group by evat.evaluator_id;

/* purchased cars on click*/
select pvdt.vehicle_id,cmt.car_make,vfdt.car_model,vmt.manufactured_year,pvdt.purchase_price,pvdt.refurbish_amount,vcit.front_view
from purchased_vehicle_details_tbl pvdt inner join vehicle_master_tbl vmt on pvdt.vehicle_id=vmt.vehicle_id
and  pvdt.is_active='Y' 
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=pvdt.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where pvdt.onboard_id=2
group by pvdt.vehicle_id;

/* evaluated cars*/
select evat.vehicle_id,cmt.car_make,vfdt.car_model,vmt.manufactured_year,emt.first_name,
vcit.front_view
from evaluator_vehicle_assignment_tbl evat inner join vehicle_master_tbl vmt on evat.vehicle_id=vmt.vehicle_id
and evat.is_active='Y' 
inner join employee_master_tbl emt on emt.employee_id=evat.evaluator_id 
inner join vehicle_condition_images_tbl vcit on vcit.vehicle_id=vmt.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
where evat.is_submitted='Y' and evat.vehicle_id not in (select vehicle_id from purchased_vehicle_details_tbl where is_active='Y')
and month(evat.submitted_on)=12 and year(evat.submitted_on)=2019
group by evat.vehicle_id;


