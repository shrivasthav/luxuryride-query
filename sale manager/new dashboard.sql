select 
count(distinct if(a.status='HOT+',a.customer_id,NULL)) as 'HOT+' ,
count(distinct if(a.status='HOT' ,a.customer_id,NULL)) as 'HOT' ,
count(distinct if(a.status='WARM' ,a.customer_id,NULL)) as 'WARM' ,
count(distinct if(a.status='COLD' ,a.customer_id,NULL)) as 'COLD' ,
count(distinct if(a.customer_status in (2,3)and  a.follow_date_time<date(now()),a.customer_id,NULL)) as over_dues,

count(distinct if(a.customer_status in (2,3) and  a.follow_date_time=date(now()),a.customer_id,NULL)) as day_pending_followups,
(select count(distinct customer_id) from sales_lead_master_tbl where added_by=a.updated_by and date(added_on)=date(now()) and is_active='Y') as day_enquiry,
count(distinct if(a.customer_status=3 and a.followup_status=3  and date(a.date_time)=date(now()),a.customer_id,NULL)) as day_test_drive,
count(distinct if(a.customer_status=3 and a.followup_status=1  and date(a.date_time)=date(now()),a.customer_id,NULL)) as day_visit,

count(distinct if(a.customer_status=3 and a.followup_status=6 and month(a.created_on)=month(now()) and year(a.created_on)=year(now())
,a.customer_id,NULL)) as monthly_booked,
(select count(distinct customer_id) from sales_lead_master_tbl where added_by=a.updated_by and month(a.added_on)=month(now()) and year(a.added_on)=year(now()) 
and is_active='Y') as monthly_enquiry,
(select count(distinct vehicle_id) from vehicle_sales_details_tbl where sold_by=a.updated_by and is_active='Y'
and month(sold_on)=month(now()) and year(sold_on)=year(now())) as sold_cars,
 count(distinct if((a.added_by=a.added_by or a.updated_by=a.updated_by) and a.customer_status in (1,2,3) and 
 month(a.follow_date_time)=month(now()) and year(a.follow_date_time)=year(now()),a.customer_id,NULL)) as active_list,
count(distinct if(a.customer_status in (2,3) and date(a.follow_date_time)<date(now()) and month(a.follow_date_time)=month(now()) 
and year(a.follow_date_time)=year(now()) ,a.customer_id,NULL)) as monthly_over_dues,

count(distinct if(a.customer_status=2 and follow_up='Y',a.customer_id,NULL)) as '24Hours',
count(distinct if(a.customer_status=2 and follow_up='A',a.customer_id,NULL)) as '48Hours',
count(distinct if(a.customer_status=2 and follow_up='R',a.customer_id,NULL)) as 'greater48Hours',
count(distinct if(a.customer_status=2 ,a.customer_id,NULL)) as 'totalpendingfollowups',


count(distinct if(a.customer_status=3 and a.followup_status=6 and day(a.created_on)<=day(now()) and month(a.created_on)<=month(now()) 
and year(a.created_on)<=year(now()),a.customer_id,NULL)) as total_booked,
(select count(distinct customer_id) from sales_lead_master_tbl where added_by=a.updated_by and day(a.added_on)<=day(now())
 and month(a.added_on)=month(now()) and year(a.added_on)=year(now()) and is_active='Y') as total_enquiry,
(select count(distinct vehicle_id) from vehicle_sales_details_tbl where sold_by=a.updated_by and is_active='Y' and 
day(sold_on)<=day(now()) and month(sold_on)<=month(now()) and year(sold_on)<=year(now())) as total_sold_cars,
 count(distinct if((a.added_by=a.added_by or a.updated_by=a.updated_by) and a.customer_status in (1,2,3) and 
 day(a.follow_date_time)<=day(now()) and month(a.follow_date_time)<=month(now()) and year(a.follow_date_time)<=year(now()),a.customer_id,NULL)) as total_active_list,
count(distinct if(a.customer_status in (2,3) and day(a.follow_date_time)<=day(now()) and date(a.follow_date_time)<date(now()) and month(a.follow_date_time)=month(now()) 
and year(a.follow_date_time)=year(now()) ,a.customer_id,NULL)) as total_monthly_over_dues



from
(select slmt.customer_id,slmt.added_by,csut.created_on,csut.customer_status,csut.date_time,csut.followup_status,csut.updated_by,
slmt.added_on,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status,
     
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on) 
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date_time,
    
    case when csut.followup_date>= DATE_SUB(NOW(), INTERVAL 24 HOUR) then 'Y' 
      when csut.followup_date>= DATE_SUB(NOW(), INTERVAL 48 HOUR) then 'A'
      when csut.followup_date< DATE_SUB(NOW(), INTERVAL 48 HOUR) then 'R'  end as follow_up

from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id
where  ((slmt.added_by=15 and csut.updated_by=15) or (slmt.added_by=15 and csut.updated_by is null) or (csut.updated_by=15)) 
and slmt.is_active='Y' and csut.is_active='Y'
group by csut.customer_id)a
