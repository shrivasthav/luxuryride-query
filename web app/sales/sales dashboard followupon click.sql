select a.customer_id,a.customer_name,a.phone_no,a.city,a.budget,a.followup_date,a.planning_to_by,a.first_name,a.status
from
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,cmt.city,bt.budget,csut.followup_date,slmt.planning_to_by,emt.first_name,
case when datediff(date(slmt.planning_to_by),date(now()))<=15  then 'HOT+'
     when datediff(date(slmt.planning_to_by),date(now()))<=30  then 'HOT'
     when datediff(date(slmt.planning_to_by),date(now()))<=60  then 'WARM'
     when datediff(date(slmt.planning_to_by),date(now()))>=60  then 'COLD' end  as status,
    
    case when csut.followup_date>= DATE_SUB(NOW(), INTERVAL 24 HOUR) then 'twentyFourHours' 
      when csut.followup_date>= DATE_SUB(NOW(), INTERVAL 48 HOUR) then 'fortyEightHours'
      when csut.followup_date< DATE_SUB(NOW(), INTERVAL 48 HOUR) then 'greaterThanFortyEightHours'  end as follow_up

from customer_status_update_tbl  csut inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id
left join city_master_tbl cmt on cmt.city_id=slmt.location
left join budget_master_tbl bt on bt.budget_id=slmt.budget
left join employee_master_tbl emt on emt.employee_id=csut.updated_by
where csut.updated_by=15 and slmt.is_active='Y' and csut.is_active='Y' and csut.customer_status=2
group by csut.customer_id)a
where a.follow_up like '%twentyFourHours%'