/* booked */
select slmt.customer_id,slmt.customer_name,slmt.phone_no, csft.followup_status,emt.first_name, date(csut.created_on) as booked_on
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y' and csut.customer_status=3 and csut.followup_status=6
inner join customer_status_tbl cst on cst.status_id=csut.customer_status
inner join customer_followup_status_tbl csft on csft.followup_status_id=csut.followup_status
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.updated_by=15 and month(csut.created_on)=month(now()) and year(csut.created_on)=year(now())
group by csut.customer_id;

/* enquiries*/
select slmt.customer_id,slmt.customer_name,slmt.phone_no,cst.title, emt.first_name, date(slmt.added_on) as enquiries
from sales_lead_master_tbl slmt 
inner join employee_master_tbl emt on emt.employee_id=slmt.added_by and slmt.is_active='Y'
inner join customer_status_update_tbl csut on csut.customer_id=slmt.customer_id
inner join customer_status_tbl cst on cst.status_id=csut.customer_status and csut.customer_status=1
where  slmt.added_by=15 and 
month(slmt.added_on)=month(now()) and year(slmt.added_on)=year(now())
group by slmt.customer_id;



/*active leads*/
select a.customer_id,a.customer_name,a.phone_no,a.title,a.first_name,date(a.follow_date) as followupdate
from
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,cst.title,emt.first_name,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y' and csut.customer_status in (1,2,3) 
inner join customer_status_tbl cst on cst.status_id=csut.customer_status
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.updated_by=15 
group by csut.customer_id)a
where  month(a.follow_date)=month(now()) and year(a.follow_date)=year(now());

/*over dues*/
select a.customer_id,a.customer_name,a.phone_no,a.title,a.first_name,date(a.follow_date) as followupdate
from
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,cst.title,emt.first_name,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y' and csut.customer_status in (2,3) 
inner join customer_status_tbl cst on cst.status_id=csut.customer_status
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.updated_by=15 
group by csut.customer_id)a
where date(a.follow_date)<date(now()) and month(a.follow_date)=month(now()) and year(a.follow_date)=year(now());

/*Test drive*/
select a.customer_id,a.customer_name,a.phone_no,a.followup_status,a.first_name,date(a.follow_date) as followupdate
from
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,csft.followup_status,emt.first_name,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y' and csut.customer_status=3 and csut.followup_status=3 
inner join customer_status_tbl cst on cst.status_id=csut.customer_status
inner join customer_followup_status_tbl csft on csft.followup_status_id=csut.followup_status
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.updated_by=15 
group by csut.customer_id)a
where  month(a.follow_date)=month(now()) and year(a.follow_date)=year(now());

/* followups*/
select a.customer_id,a.customer_name,a.phone_no,a.title,a.first_name,date(a.follow_date) as followupdate
from
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,cst.title,emt.first_name,
case when csut.customer_status=2 then date(csut.followup_date)
     when csut.customer_status=1 then date(csut.created_on)
    when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
    when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as follow_date
 from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id  
and slmt.is_active='Y' and csut.is_active='Y' and csut.customer_status in (2,3)
inner join customer_status_tbl cst on cst.status_id=csut.customer_status
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.updated_by=15 
group by csut.customer_id)a
where date(a.follow_date)>=date(now()) and month(a.follow_date)=month(now()) and year(a.follow_date)=year(now());


       
