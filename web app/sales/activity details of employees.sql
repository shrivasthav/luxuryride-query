select emt.employee_id,emt.first_name,emt.phone_number,st.showroom_code,a.hotplus,a.HOT,a.WARM,a.COLD,a.booked,a.test_drive,a.closed,a.soldcars,a.activeleads,
a.detailleads
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on  emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.is_active='Y' and emt.role_id=5
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id

left join 

(select  a.updated_by,
count(distinct if(a.status='HOT+' and  a.is_active ='Y',a.customer_id,NULL)) as hotplus,
count(distinct if(a.status='HOT' and  a.is_active ='Y',a.customer_id,NULL)) as HOT,
count(distinct if(a.status='WARM' and  a.is_active ='Y',a.customer_id,NULL)) as WARM,
count(distinct if(a.status='COLD' and  a.is_active ='Y',a.customer_id,NULL)) as COLD,
 
count(distinct if(a.customer_status=3 and a.followup_status=6 and a.follow_date_time between '2020-05-01' and '2020-05-14'
 ,a.customer_id,NULL)) as booked,
 count(distinct if(a.customer_status=3 and a.followup_status=3 and a.follow_date_time between '2020-05-01' and '2020-05-14'
 ,a.customer_id,NULL)) as test_drive,
  count(distinct if((a.customer_status in (5,6) or (a.customer_status=4 and a.action='A')) and a.follow_date_time 
  between '2020-05-01' and '2020-05-14',a.customer_id,NULL)) as closed,
count(distinct if(a.customer_status=7 and a.follow_date_time between '2020-05-01' and '2020-05-14'
 ,a.customer_id,NULL)) as soldcars,
count(distinct if(a.is_active='Y' and date(a.created_on)<=date(now()),a.customer_id,NULL)) as activeleads,
count(distinct if(date(a.inactive_on) between '2020-05-01' and '2020-05-14',a.customer_id,NULL)) as detailleads
from 

(select slmt.customer_id,csut.customer_status,csut.followup_status,csut.action,csut.created_on,csut.inactive_on,csut.is_active,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status,
     case when csut.customer_status=1 then date(csut.created_on)
          when csut.customer_status=2 then date(csut.followup_date)
          when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
          when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) 
		  when csut.customer_status in (4,5,6,7)  then date(csut.created_on)
          end as follow_date_time,csut.updated_by
    
     from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y'
group by slmt.customer_id,csut.customer_status,csut.followup_status ,date(csut.created_on),
date(csut.followup_date),date(csut.date_time),csut.updated_by )a
where a.updated_by  is not null 
group by a.updated_by  )a on emt.employee_id=a.updated_by

where  find_in_set(st.showroom_id,getshowrmid(null))
group by emt.employee_id