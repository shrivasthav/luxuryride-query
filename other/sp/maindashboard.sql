CREATE DEFINER=`root`@`%` PROCEDURE `MainDashboardData`(in showroom_id_set int,in select_day int,in select_month int,in select_year int)
begin
declare showroom_id_get int;
declare showroomIds varchar(1000);
declare getmonth int;
declare getyear int;
declare getday int;

if showroom_id_set is null then
set showroom_id_get = 0;
else 
set showroom_id_get = showroom_id_set;
end if;
set showroomIds = Getshowrmid(showroom_id_get); 

set getday=select_day;
set getmonth=select_month;
set getyear=select_year;

if  getmonth is null   then 

select 
(select count(vehicle_id) as evaluated_cars from evaluator_vehicle_assignment_tbl where is_submitted='Y' and is_active='Y' and is_confirmed='Y'
and year(submitted_on)=getyear) as evaluated_cars,

(select count(distinct vehicle_id) as assigned_cars
from evaluator_vehicle_assignment_tbl where is_active='Y' and is_confirmed='Y' and is_rejected='N' and is_submitted='N'
and year(assigned_on)=getyear) as assigned_cars,
 
(select count(distinct vehicle_id) as purchased_cars
from purchased_vehicle_details_tbl where onboard_id=2 and year(owned_on)=getyear) as purchased_cars,

(select count(distinct invester_id) as no_of_invester from invester_master_tbl where is_active='Y') as no_of_invester ,

(select count(distinct vehicle_id) as invested_cars from invester_vehicle_interest_tbl where is_interest='Y' and is_active='Y'
and  year(interested_on)=getyear) as invested_cars,

(select ifnull(sum(invesed_amount),0) from invester_debit_amount_tbl where  year(created_on)=getyear)
 as invesed_amount ,

(select 0 as returns) as total_returns,

(select count(distinct svat.vehicle_id) from showroom_vehicle_assignment_tbl svat 
inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
where svat.is_active='Y' and svat.vehicle_id not in(select vehicle_id from vehicle_sales_details_tbl where is_active='Y') 
and year(svat.created_on)=getyear
and find_in_set(st.showroom_id,showroomIds)) as inventory,

count(distinct if(a.customer_status=3 and a.followup_status=3 and 
year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthly_test_drives,


count(distinct if(a.customer_status=3 and a.followup_status=6 
and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthlyBooked,

(select count(distinct vsdt.vehicle_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 and  year(vsdt.sold_on)=getyear
 where find_in_set(st.showroom_id,showroomIds)) as monthlySoldCars,
 
 count(distinct if(a.customer_status in (1,2,3) and 
  year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthlyActiveLeads,
 
count(distinct if(a.customer_status in (2,3) 
 and year(a.follow_date_time)=getyear ,a.customer_id,NULL)) as monthlyOverDues,
 
 count(distinct if(a.customer_status in (2,3) 
 and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as followups,
 

(select count(distinct vsdt.customer_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 and  year(vsdt.sold_on)=getyear
 where find_in_set(st.showroom_id,showroomIds)) as monthly_coverted_leads,
 
 (select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=4 and find_in_set(st.showroom_id,showroomIds)) as purchase_managers,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=5 and find_in_set(st.showroom_id,showroomIds)) as sales_manager,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=3 and find_in_set(st.showroom_id,showroomIds)) as evaluators,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=9 and find_in_set(st.showroom_id,showroomIds)) as sales_head,

(select count(distinct emt.employee_id) as purchase_managers
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=6 and find_in_set(st.showroom_id,showroomIds)) as operation_head

from
(select slmt.customer_id,st.showroom_id,csut.customer_status,csut.followup_status,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time
    
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
left join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by  and esat.is_active='Y'
left join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a;


else if   getday is null   then 

select 
(select count(vehicle_id) as evaluated_cars from evaluator_vehicle_assignment_tbl where is_submitted='Y' and is_active='Y' and is_confirmed='Y'
and year(submitted_on)=getyear and month(submitted_on)=getmonth) as evaluated_cars,

(select count(distinct vehicle_id) as assigned_cars
from evaluator_vehicle_assignment_tbl where is_active='Y' and is_confirmed='Y' and is_rejected='N' and is_submitted='N'
and year(assigned_on)=getyear and month(assigned_on)=getmonth) as assigned_cars,
 
(select count(distinct vehicle_id) as purchased_cars
from purchased_vehicle_details_tbl where onboard_id=2 and year(owned_on)=getyear and month(owned_on)=getmonth) as purchased_cars,

(select count(distinct invester_id) as no_of_invester from invester_master_tbl where is_active='Y') as no_of_invester ,

(select count(distinct vehicle_id) as invested_cars from invester_vehicle_interest_tbl where is_interest='Y' and is_active='Y'
and  year(interested_on)=getyear and month(interested_on)=getmonth) as invested_cars,

(select ifnull(sum(invesed_amount),0) from invester_debit_amount_tbl where  year(created_on)=getyear and month(created_on)=getmonth)
 as invesed_amount ,

(select 0 as returns) as total_returns,

(select count(distinct svat.vehicle_id) from showroom_vehicle_assignment_tbl svat 
inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
where svat.is_active='Y' and svat.vehicle_id not in(select vehicle_id from vehicle_sales_details_tbl where is_active='Y') 
and year(svat.created_on)=getyear and month(svat.created_on)=getmonth
and find_in_set(st.showroom_id,showroomIds)) as inventory,

count(distinct if(a.customer_status=3 and a.followup_status=3 and  month(a.follow_date_time)=getmonth and
year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthly_test_drives,


count(distinct if(a.customer_status=3 and a.followup_status=6 and month(a.follow_date_time)=getmonth
and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthlyBooked,

(select count(distinct vsdt.vehicle_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 and  year(vsdt.sold_on)=getyear and month(vsdt.sold_on)=getmonth
 where find_in_set(st.showroom_id,showroomIds)) as monthlySoldCars,
 
 count(distinct if(a.customer_status in (1,2,3) and month(a.follow_date_time)=getmonth and
  year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthlyActiveLeads,
 
count(distinct if(a.customer_status in (2,3) and month(a.follow_date_time)=getmonth
 and year(a.follow_date_time)=getyear ,a.customer_id,NULL)) as monthlyOverDues,
 
 count(distinct if(a.customer_status in (2,3) and month(a.follow_date_time)=getmonth
 and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as followups,
 

(select count(distinct vsdt.customer_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 and  year(vsdt.sold_on)=getyear and month(vsdt.sold_on)=getmonth
 where find_in_set(st.showroom_id,showroomIds)) as monthly_coverted_leads,
 
 (select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=4 and find_in_set(st.showroom_id,showroomIds)) as purchase_managers,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=5 and find_in_set(st.showroom_id,showroomIds)) as sales_manager,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=3 and find_in_set(st.showroom_id,showroomIds)) as evaluators,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=9 and find_in_set(st.showroom_id,showroomIds)) as sales_head,

(select count(distinct emt.employee_id) as purchase_managers
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=6 and find_in_set(st.showroom_id,showroomIds)) as operation_head

from
(select slmt.customer_id,st.showroom_id,csut.customer_status,csut.followup_status,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time
    
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
left join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by  and esat.is_active='Y'
left join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a;

else 

select 
(select count(vehicle_id) as evaluated_cars from evaluator_vehicle_assignment_tbl where is_submitted='Y' and is_active='Y' and is_confirmed='Y'
and day(submitted_on)=getday and year(submitted_on)=getyear and month(submitted_on)=getmonth) as evaluated_cars,

(select count(distinct vehicle_id) as assigned_cars
from evaluator_vehicle_assignment_tbl where is_active='Y' and is_confirmed='Y' and is_rejected='N' and is_submitted='N' and day(assigned_on)=getday
and year(assigned_on)=getyear and month(assigned_on)=getmonth) as assigned_cars,
 
(select count(distinct vehicle_id) as purchased_cars
from purchased_vehicle_details_tbl where onboard_id=2 and day(owned_on)=getday and year(owned_on)=getyear and month(owned_on)=getmonth) as purchased_cars,

(select count(distinct invester_id) as no_of_invester from invester_master_tbl where is_active='Y') as no_of_invester ,

(select count(distinct vehicle_id) as invested_cars from invester_vehicle_interest_tbl where is_interest='Y' and is_active='Y'
and day(interested_on)=getday and  year(interested_on)=getyear and month(interested_on)=getmonth) as invested_cars,

(select ifnull(sum(invesed_amount),0) from invester_debit_amount_tbl where day(created_on)=getday and
  year(created_on)=getyear and month(created_on)=getmonth) as invesed_amount ,

(select 0 as returns) as total_returns,

(select count(distinct svat.vehicle_id) from showroom_vehicle_assignment_tbl svat 
inner join showrooms_tbl st on st.showroom_id=svat.showroom_id
where svat.is_active='Y' and svat.vehicle_id not in(select vehicle_id from vehicle_sales_details_tbl where is_active='Y') 
and day(svat.created_on)=getday and year(svat.created_on)=getyear and month(svat.created_on)=getmonth
and find_in_set(st.showroom_id,showroomIds)) as inventory,

count(distinct if(a.customer_status=3 and a.followup_status=3 and  month(a.follow_date_time)=getmonth and
day(a.follow_date_time)=getday and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthly_test_drives,


count(distinct if(a.customer_status=3 and a.followup_status=6 and day(a.follow_date_time)=getday and month(a.follow_date_time)=getmonth
and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthlyBooked,

(select count(distinct vsdt.vehicle_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 and day(vsdt.sold_on)=getday and year(vsdt.sold_on)=getyear and month(vsdt.sold_on)=getmonth
 where find_in_set(st.showroom_id,showroomIds)) as monthlySoldCars,
 
 count(distinct if(a.customer_status in (1,2,3) and day(a.follow_date_time)=getday and month(a.follow_date_time)=getmonth and
  year(a.follow_date_time)=getyear,a.customer_id,NULL)) as monthlyActiveLeads,
 
count(distinct if(a.customer_status in (2,3) and day(a.follow_date_time)=getday and  month(a.follow_date_time)=getmonth
 and year(a.follow_date_time)=getyear ,a.customer_id,NULL)) as monthlyOverDues,
 
 count(distinct if(a.customer_status in (2,3) and day(a.follow_date_time)=getday and month(a.follow_date_time)=getmonth
 and year(a.follow_date_time)=getyear,a.customer_id,NULL)) as followups,
 

(select count(distinct vsdt.customer_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 and day(vsdt.sold_on)=getday and  year(vsdt.sold_on)=getyear and month(vsdt.sold_on)=getmonth
 where find_in_set(st.showroom_id,showroomIds)) as monthly_coverted_leads,
 
 (select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=4 and find_in_set(st.showroom_id,showroomIds)) as purchase_managers,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=5 and find_in_set(st.showroom_id,showroomIds)) as sales_manager,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=3 and find_in_set(st.showroom_id,showroomIds)) as evaluators,

(select count(distinct emt.employee_id) 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=9 and find_in_set(st.showroom_id,showroomIds)) as sales_head,

(select count(distinct emt.employee_id) as purchase_managers
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where emt.role_id=6 and find_in_set(st.showroom_id,showroomIds)) as operation_head

from
(select slmt.customer_id,st.showroom_id,csut.customer_status,csut.followup_status,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time
    
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
left join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by  and esat.is_active='Y'
left join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a;

end if;
end if;
end