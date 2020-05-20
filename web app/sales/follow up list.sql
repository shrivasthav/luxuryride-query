select a.customerId,
a.customerName,
a.customerPhNo,
a.location,
a.followUpOn,
a.budget,
a.custStatusId,
a.custStatusName,
a.customerStatus,
a.readStatus,
a.planToPurchase,
a.employeeId,
a.employeeName
from
(select slmt.customer_id 'customerId',slmt.customer_name 'customerName',slmt.phone_no 'customerPhNo',cmt.city 'location',
case when csut.customer_status=1 then date(csut.created_on)
when csut.customer_status=2 then date(csut.followup_date)
when csut.customer_status=3 and csut.followup_status in(1,2,3) then date(csut.date_time)
when csut.customer_status=3 and csut.followup_status=6 then date(csut.created_on) end as 'followUpOn',
bmt.budget 'budget',ct.status_id 'custStatusId',ct.title 'custStatusName',
case when (csut.updated_by=3 or csut.added_by=3 ) then 'W' else 'R' end as 'readStatus',
case when datediff(date(slmt.planning_to_by),date(now()))<=15 then 'HOT+'
when datediff(date(slmt.planning_to_by),date(now()))<=30 then 'HOT'
when datediff(date(slmt.planning_to_by),date(now()))<=60 then 'WARM'
when datediff(date(slmt.planning_to_by),date(now()))<=90 then 'COLD'
else 'FREEZ' end as 'customerStatus',
slmt.planning_to_by 'planToPurchase',
csut.updated_by 'employeeId',
concat(st.showroom_code,' - ',emt.first_name) as 'employeeName'
from customer_status_update_tbl csut 
inner join sales_lead_master_tbl slmt on slmt.customer_id=csut.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
left JOIN city_master_tbl cmt ON cmt.city_id = slmt.location
left JOIN budget_master_tbl bmt ON bmt.budget_id = slmt.budget
inner JOIN customer_status_tbl ct ON ct.status_id = csut.customer_status
inner join employee_showroom_assignment_tbl esat on esat.employee_id=csut.updated_by and esat.is_active='Y'
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
inner join employee_master_tbl emt on emt.employee_id=esat.employee_id
where csut.customer_status in (2,3)
AND (slmt.customer_name LIKE '%%'
OR cmt.city LIKE '%%'
OR slmt.phone_no LIKE '%%' )
group by csut.customer_id
order by slmt.planning_to_by asc)a
order by field(a.readStatus,'W','R'), a.planToPurchase asc
