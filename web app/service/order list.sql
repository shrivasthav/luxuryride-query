/* hub manager */
select ssodt.sub_part_id,sspt.sub_part_name,sspt.part_no,sspt.brand,ssodt.quantity,st.showroom_code,
DATE_FORMAT(ssodt.order_on,'%b %d %Y') as order_date,
case when  ssodt.is_active='Y'and ssodt.order_placed='N' and ssodt.order_recieve='N' then 'Order Requested' 
     when  ssodt.is_active='Y'and ssodt.order_placed='Y' and ssodt.order_recieve='N' then 'Order Placed' 
     when  ssodt.is_active='Y'and ssodt.order_placed='Y' and ssodt.order_recieve='Y' then 'Order Received' 
end as 'Action'
from service_stock_order_details_tbl ssodt inner join service_sub_parts_tbl sspt on ssodt.sub_part_id=sspt.sub_part_id
inner join employee_showroom_assignment_tbl esat on esat.employee_id=ssodt.order_by
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
and ssodt.is_active='Y' and sspt.is_active='Y'
group by ssodt.id;


/* stock manager */
select ssodt.sub_part_id,sspt.sub_part_name,sspt.part_no,sspt.brand,ssodt.quantity,
DATE_FORMAT(ssodt.order_on,'%b %d %Y') as order_date,
case when  ssodt.is_active='Y'and ssodt.order_placed='N' and ssodt.order_recieve='N' then 'Order Requested' 
     when  ssodt.is_active='Y'and ssodt.order_placed='Y' and ssodt.order_recieve='N' then 'Order Placed' 
     when  ssodt.is_active='Y'and ssodt.order_placed='Y' and ssodt.order_recieve='Y' then 'Order Received' 
end as 'Action'
from service_stock_order_details_tbl ssodt inner join service_sub_parts_tbl sspt on ssodt.sub_part_id=sspt.sub_part_id
and ssodt.is_active='Y' and sspt.is_active='Y'
inner join employee_showroom_assignment_tbl esat on esat.employee_id=ssodt.order_by
where esat.showroom_id=4
group by ssodt.id;