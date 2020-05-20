select a.customer_id,a.customer_name,a.phone_no,a.followup_date,a.read_status,a.planning_to_by,a.customer_status from
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,
case when csut.customer_status=1 then csut.created_on
when csut.customer_status=2 then csut.followup_date
when csut.customer_status=3 and csut.followup_status in(1,2,3) then csut.date_time
when csut.customer_status=3 and csut.followup_status=6 then csut.created_on end as followup_date,
slmt.planning_to_by,
case when (csut.updated_by=3 or csut.added_by=3 ) then 'W' else 'R' end as read_status,
case when datediff(date(slmt.planning_to_by),date(now()))<=15 then 'HOT+'
when datediff(date(slmt.planning_to_by),date(now()))<=30 then 'HOT'
when datediff(date(slmt.planning_to_by),date(now()))<=60 then 'WARM'
when datediff(date(slmt.planning_to_by),date(now()))<=90 then 'COLD'
else 'FREEZ' end as customer_status
from customer_status_update_tbl csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
where (csut.customer_status in (2,3))
group by csut.customer_id
order by slmt.planning_to_by asc)a
order by field(a.read_status,'W','R'),field(date(a.followup_date),date(now()))desc,date(a.followup_date) asc