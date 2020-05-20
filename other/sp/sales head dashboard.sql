delimiter $$
CREATE  PROCEDURE salesheaddashboard(in showroom_id_set int)
begin
declare showroom_id_get int;
declare showroomIds varchar(1000);
if showroom_id_set is null then
set showroom_id_get = 0;
else 
set showroom_id_get = showroom_id_set;
end if;
set showroomIds = Getshowrmid(showroom_id_get); 

select 
(select count(distinct if(a.status='HOT+',a.customer_id,NULL)) as 'HOT+'  from
(select slmt.customer_id,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status
     from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=slmt.added_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a) as 'HOT+',

(select count(distinct if(a.status='HOT' ,a.customer_id,NULL)) as 'HOT'   from
(select slmt.customer_id,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status
     from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=slmt.added_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a) as 'HOT',

(select count(distinct if(a.status='WARM' ,a.customer_id,NULL)) as 'WARM'  from
(select slmt.customer_id,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status
     from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=slmt.added_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a) as 'WARM',

(select count(distinct if(a.status='COLD',a.customer_id,NULL)) as 'COLD'  from
(select slmt.customer_id,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status
     from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=slmt.added_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 where find_in_set(st.showroom_id,showroomIds)
group by csut.customer_id)a) as 'COLD',

count(distinct if(a.customer_status in (2,3) and a.follow_date_time<date(now()),a.customer_id,NULL)) as over_dues,

count(distinct if(a.customer_status in (2,3) and a.follow_date_time=date(now()),a.customer_id,NULL)) as day_pending_followups,
count(distinct if(a.customer_status in (2,3) and a.follow_date_time=date(now()),a.customer_id,NULL)) as day_enquiry,
count(distinct if(a.customer_status=3 and a.followup_status=3 and date(a.date_time)=date(now()),a.customer_id,NULL)) as day_test_drive,
count(distinct if(a.customer_status=3 and a.followup_status=1  and date(a.date_time)=date(now()),a.customer_id,NULL)) as day_visit,


count(distinct if(a.customer_status=3 and a.followup_status=6 and month(a.created_on)=month(now()) and year(a.created_on)=year(now())
,a.customer_id,NULL)) as monthly_booked,
count(distinct if(month(a.added_on)=month(now()) and year(a.added_on)=year(now()) ,a.customer_id,NULL)) as monthly_enquiry,
(select count(distinct vsdt.vehicle_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 where find_in_set(st.showroom_id,showroomIds)) as sold_cars,
 count(distinct if(a.customer_status in (1,2,3) and 
 month(a.follow_date_time)=month(now()) and year(a.follow_date_time)=year(now()),a.customer_id,NULL)) as active_list,
 count(distinct if(a.customer_status in (2,3) and date(a.follow_date_time)<date(now()) and month(a.follow_date_time)=month(now())
 and year(a.follow_date_time)=year(now()) ,a.customer_id,NULL)) as monthly_over_dues

from
(select slmt.customer_id,st.showroom_id,csut.customer_status,csut.followup_status,csut.date_time,csut.created_on,slmt.added_on,
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
       
end