/* stock on click */
select sspt.sub_part_id,sspt.part_no,sspt.sub_part_name,sspt.brand,ssbdt.vendor_name,ssbdt.bill_no,ssbdt.quantity,sspdt.purchase_price,
sspdt.selling_price,DATE_FORMAT(ssbdt.bill_date_on,'%b %d %Y') as inward_date
 from service_stock_bill_detail_tbl ssbdt inner join service_sub_parts_tbl sspt on ssbdt.sub_part_id=sspt.sub_part_id
and ssbdt.is_active='Y' and sspt.is_active='Y'
inner join employee_showroom_assignment_tbl esat on esat.employee_id=ssbdt.added_by and esat.is_active='Y'
inner join service_showroomwise_parts_detail_tbl sspdt on sspdt.sub_part_id=sspt.sub_part_id
where sspt.sub_part_id=1 and esat.showroom_id=4
group by ssbdt.id
