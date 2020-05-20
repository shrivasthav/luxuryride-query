select
slst.lead_source_id,slst.source_name,b.showroom_code,
b.first_name,
b.HOT_plus as 'HOT+',
b.HOT as 'HOT',
b.WARM as 'WARM',
b.COLD as 'COLD',
b.closed,
b.follow_up,
b.yet_to_vist,
b.sold
 from 
sales_lead_source_tbl slst left join 
(select 
st.showroom_code,emt.first_name,a.lead_source,a.employee_id,a.follow_date_time,
count(distinct if(a.status='HOT+' and a.is_active='Y',a.customer_id,NULL)) as 'HOT_plus',
count(distinct if(a.status='HOT'and a.is_active='Y',a.customer_id,NULL)) as 'HOT',
count(distinct if(a.status='WARM' and a.is_active='Y',a.customer_id,NULL)) as 'WARM',
count(distinct if(a.status='COLD'and a.is_active='Y',a.customer_id,NULL)) as'COLD',
count(distinct if(a.customer_status in (5,6) and a.is_active='Y',a.customer_id,NULL)) as closed,
count(distinct if(a.customer_status in (2,3) and a.is_active='Y',a.customer_id,NULL)) as follow_up,
count(distinct if(a.customer_status=1 and a.is_active='Y',a.customer_id,NULL)) as yet_to_vist,
count(distinct if(a.customer_status=7 and a.customer_id in (select customer_id from vehicle_sales_details_tbl where is_active='Y')
,a.customer_id,NULL))as sold
from
(select slmt.customer_id,csut.customer_status,csut.followup_status,slmt.planning_to_by,slmt.lead_source,csut.is_active,
csut.updated_by,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
     when csut.customer_status in (5,6) then date(csut.created_on)
     when csut.customer_status=7 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time,
    case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status,
     case when csut.updated_by is null then slmt.added_by else csut.updated_by end as employee_id
  
 from sales_lead_master_tbl  slmt inner join customer_status_update_tbl csut on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y')a
inner join employee_master_tbl emt on emt.employee_id=a.employee_id
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id  and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where st.showroom_id=1 
group by a.lead_source,a.employee_id)b on slst.lead_source_id=b.lead_source
where showroom_code is not null and  month(b.follow_date_time)=03 and year(b.follow_date_time)=2020
group by slst.lead_source_id,b.employee_id