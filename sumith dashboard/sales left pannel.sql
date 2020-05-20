select 
(select sum(a.sales_managers) as sales_managers from
(select count(distinct emt.employee_id) as sales_managers 
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id
and emt.is_active='Y' and esat.is_active='Y' and emt.role_id=5
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id 
where find_in_set(st.showroom_id,Getshowrmid(null))
group by st.showroom_id)a) as sales_managers,

(select sum(a.converted_leads) from
(select count(distinct vsdt.customer_id) as converted_leads
from vehicle_sales_details_tbl vsdt inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by
and vsdt.is_active='Y' and esat.is_active='Y' 
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id 
where find_in_set(st.showroom_id,Getshowrmid(null))
group by st.showroom_id)a) as converted_leads,

(select sum(a.inventory) from
(select count(distinct svat.vehicle_id) as inventory
from showroom_vehicle_assignment_tbl svat inner join showrooms_tbl st on svat.showroom_id=st.showroom_id
and svat.is_active='Y'
where find_in_set(st.showroom_id,Getshowrmid(null))
and svat.vehicle_id not in (select vehicle_id from vehicle_sales_details_tbl where is_active='Y')
group by st.showroom_id)a) as inventory,

(select sum(a.sold_cars) from
(select count(distinct vsdt.vehicle_id) as sold_cars
from vehicle_sales_details_tbl vsdt inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by
and vsdt.is_active='Y' and esat.is_active='Y' 
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id 
where find_in_set(st.showroom_id,Getshowrmid(null))
group by st.showroom_id)a) as sold_cars,

count(distinct if(a.customer_status in (5,6),a.customer_id,NULL)) as pending_for_approval,

count(distinct if(a.customer_status=2 and a.follow_up='Y',a.customer_id,NULL)) as 'twentyFourHours',
count(distinct if(a.customer_status=2 and a.follow_up='A',a.customer_id,NULL)) as 'fortyEightHours',
count(distinct if(a.customer_status=2 and a.follow_up='R',a.customer_id,NULL)) as 'greaterThanFortyEightHours',


count(distinct if(a.customer_status=3 and a.followup_status=6 and date(a.follow_date_time)<=date(now()),a.customer_id,NULL)) as total_booked,


 (select count(distinct slmt.customer_id) as day_enquiry
from sales_lead_master_tbl slmt 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=slmt.added_by
and slmt.is_active='Y' and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where find_in_set(st.showroom_id,Getshowrmid(null)) and date(slmt.added_on)<=date(now())) as total_Enquiries,
 
 
(select count(distinct vsdt.vehicle_id)
from vehicle_sales_details_tbl vsdt 
 inner join employee_showroom_assignment_tbl esat on esat.employee_id=vsdt.sold_by  and esat.is_active='Y'
 inner join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
 where find_in_set(st.showroom_id,Getshowrmid(null))and date(vsdt.sold_on)<=date(now())) as total_SoldCars,
 
 count(distinct if(a.customer_status in (1,2,3) and 
 date(a.follow_date_time)<=date(now()),a.customer_id,NULL)) as total_ActiveLeads,
 
count(distinct if(a.customer_status in (2,3) and date(a.follow_date_time)<date(now()),a.customer_id,NULL)) as total_over_dues

from
(select slmt.customer_id,st.showroom_id,csut.customer_status,csut.followup_status,csut.date_time,csut.created_on,slmt.added_on,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time,
    
    case when csut.followup_date>= DATE_SUB(NOW(), INTERVAL 24 HOUR) then 'Y' 
      when csut.followup_date>= DATE_SUB(NOW(), INTERVAL 48 HOUR) then 'A'
      when csut.followup_date< DATE_SUB(NOW(), INTERVAL 48 HOUR) then 'R'  end as follow_up
    
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y'
left join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by  and esat.is_active='Y'
left join showrooms_tbl st on esat.showroom_id=st.showroom_id and st.is_active='Y'
where find_in_set(st.showroom_id,Getshowrmid(null))
group by csut.customer_id)a;