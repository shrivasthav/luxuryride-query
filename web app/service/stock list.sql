/* hub manager stock list page*/
select a.sub_part_id,a.part_no,a.sub_part_name,a.brand,a.QoH,a.purchase_price,a.selling_price,a.tax_type,a.tax,a.tax_amount,
a.stock_type
from 
(select sub_part_id,part_no,sub_part_name,brand,quantity 'QoH',purchase_price,selling_price,tax_type,tax,tax_amount,
case when quantity=0 then 'Out of Stock' else 'In Stock' end as 'stock_type'
 from service_sub_parts_tbl 
 where is_active='Y'
 group by sub_part_id)a
where a.stock_type like '%Out of Stock%';

/*stock manager stock list*/
select a.sub_part_id,a.part_no,a.sub_part_name,a.brand,a.QoH,a.purchase_price,a.selling_price,a.tax_type,a.tax,a.tax_amount,
a.stock_type
from 
(select sspt.sub_part_id,sspt.part_no,sspt.sub_part_name,sspt.brand,sspdt.quantity 'QoH',sspdt.purchase_price,sspdt.selling_price,
sspdt.tax_type,sspdt.tax,sspdt.tax_amount,
case when sspdt.quantity=0 then 'Out of Stock' else 'In Stock' end as 'stock_type'
 from service_showroomwise_parts_detail_tbl  sspdt 
 inner join service_sub_parts_tbl sspt on sspt.sub_part_id=sspdt.sub_part_id and sspdt.is_active='Y'
 where sspdt.showroom_id=4
 group by sspdt.sub_part_id)a
where a.stock_type like '%Out of Stock%'

