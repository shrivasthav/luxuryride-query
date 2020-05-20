select 
vehicle_id in (select a.vehicle_id from 
(SELECT 
vddt.vehicle_id
FROM
vehicle_document_details_tbl vddt
INNER JOIN vehicle_condition_images_tbl vcit ON vddt.vehicle_id = vcit.vehicle_id
INNER JOIN evaluated_vehicle_pricing_details_tbl evpdt ON evpdt.vehicle_id = vcit.vehicle_id
INNER JOIN evaluator_vehicle_assignment_tbl evat ON evat.vehicle_id = evpdt.vehicle_id
AND is_submitted = 'Y') a
INNER JOIN
(select b.vehicle_id from(select 
case when a.counts=a.sub_count then a.vehicle_id else 0 end as vehicle_id
from 
(select count(sub_details_id) as counts ,vehicle_id,
(select count(sub_details_id) from sub_details_master_tbl where is_active='Y') as sub_count
from vehicle_condition_details_tbl where is_active='Y' group by vehicle_id)a)b) c ON c.vehicle_id = a.vehicle_id) as vehicle
from evaluator_vehicle_assignment_tbl where evaluator_id=2;