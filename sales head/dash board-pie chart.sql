select slst.lead_source_id,slst.source_name,ifnull(a.lead_count,'0') as lead_count
from sales_lead_source_tbl slst left join 
(select slmt.lead_source,count(distinct slmt.customer_id) as lead_count
from sales_lead_master_tbl slmt 
inner join employee_showroom_assignment_tbl esat on esat.employee_id=slmt.added_by and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id and  slmt.is_active='Y'
where month(slmt.added_on)=month(now()) and year(slmt.added_on)=year(now()) and  find_in_set(st.showroom_id,(select Getshowrmid(null)))
group by slmt.lead_source)a on slst.lead_source_id=a.lead_source
group by slst.lead_source_id;

/* employee list */
select emt.employee_id,esat.showroom_id,emt.first_name
from employee_master_tbl emt inner join employee_showroom_assignment_tbl esat on emt.employee_id=esat.employee_id
and emt.is_active='Y' and esat.employee_id 
where esat.showroom_id in (2) and emt.role_id=5
group by emt.employee_id;

/* employeewise data*/
select 
count(distinct if(a.customer_status=3 and a.followup_status=6 and month(a.created_on)=month(now()) and year(a.created_on)=year(now()) 
,a.customer_id,NULL)) as monthly_booked,

(select count(distinct customer_id) as monthly_enquiry
from sales_lead_master_tbl  
where is_active='Y' and added_by=a.updated_by and month(added_on)=month(now()) and year(added_on)=year(now())) as monthly_enquiry,

 count(distinct if(a.customer_status in (1,2,3) and a.is_active='Y' and 
 month(a.follow_date_time)=month(now()) and year(a.follow_date_time)=year(now()),a.customer_id,NULL)) as monthly_active_list,
 
count(distinct if(a.customer_status in (2,3) and date(a.follow_date_time)<date(now()) and month(a.follow_date_time)=month(now())
 and year(a.follow_date_time)=year(now()) and a.is_active='Y',a.customer_id,NULL)) as monthly_over_dues,
 
count(distinct if(a.customer_status=3 and a.followup_status=3 and date(a.date_time)<=date(now()) and month(a.date_time)=month(now())
 and year(a.date_time)=year(now()),a.customer_id,NULL)) as monthly_test_drive,

count(distinct if(a.customer_status in (2,3) and  a.is_active='Y' and a.follow_date_time>=date(now())
and month(a.follow_date_time)=month(now()) and year(a.follow_date_time)=year(now()),a.customer_id,NULL)) as monthly_pending_followups

from 

(select slmt.customer_id,csut.created_on,csut.customer_status,csut.followup_status,csut.is_active,csut.date_time,csut.updated_by,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' 
where csut.updated_by=3)a


