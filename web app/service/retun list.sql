/* return list */

select ssrt.sub_part_id,ssrt.vendor_name,sspt.sub_part_name,sspt.part_no,sspt.brand,ssrt.bill_no,sspdt.purchase_price,ssrt.quantity,
DATE_FORMAT(ssrt.retuned_on,'%b %d %Y') as retun_date,ssrt.comment
from service_stock_retun_tbl ssrt inner join service_sub_parts_tbl sspt on ssrt.sub_part_id=sspt.sub_part_id
and ssrt.is_active='Y' and sspt.is_active='Y'
inner join employee_showroom_assignment_tbl esat on esat.employee_id=ssrt.retuned_by
inner join service_showroomwise_parts_detail_tbl sspdt on sspdt.sub_part_id=sspt.sub_part_id
where esat.showroom_id=4
group by ssrt.id;