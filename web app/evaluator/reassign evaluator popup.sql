select vmt.vehicle_id, 
case when vmt.vehicle_id in (select vcdt.vehicle_id from vehicle_condition_details_tbl vcdt inner join vehicle_condition_images_tbl vcit on vcdt.vehicle_id=vcit.vehicle_id
and vcdt.is_active='Y' and vcit.is_active='Y'
inner join vehicle_document_details_tbl vddt on vcit.vehicle_id=vddt.vehicle_id and vddt.is_active='Y'
inner join evaluated_vehicle_pricing_details_tbl evt on evt.vehicle_id=vddt.vehicle_id and evt.is_active='Y'
group by vcdt.vehicle_id) then 'Y' else 'N' end as popup_status
 from vehicle_master_tbl vmt inner join evaluator_vehicle_assignment_tbl evat on evat.vehicle_id=vmt.vehicle_id and evat.is_active='Y'
where evat.evaluator_id=2 and vmt.vehicle_id=13