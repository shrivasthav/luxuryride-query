SELECT
vmt.vehicle_id 'vehicleId',
vmt.car_make 'carMakeId',
cmt.car_make 'carMake'
FROM
showroom_vehicle_assignment_tbl svat
INNER JOIN
employee_showroom_assignment_tbl esat ON svat.showroom_id = esat.showroom_id
AND svat.is_active = 'Y'
AND esat.is_active = 'Y'
INNER JOIN
vehicle_master_tbl vmt ON vmt.vehicle_id = svat.vehicle_id
INNER JOIN
car_model_master_tbl cmt ON cmt.car_id = vmt.car_make
INNER JOIN
vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_make
WHERE 
esat.employee_id =3  and vmt.vehicle_id not in 
(select vehicle_id from vehicle_sales_details_tbl where is_active='Y')
group by vmt.car_make;


SELECT
vmt.vehicle_id ,
vmt.car_model ,
vfdt.car_model
FROM
showroom_vehicle_assignment_tbl svat
INNER JOIN
employee_showroom_assignment_tbl esat ON svat.showroom_id = esat.showroom_id
AND svat.is_active = 'Y'
AND esat.is_active = 'Y'
INNER JOIN
vehicle_master_tbl vmt ON vmt.vehicle_id = svat.vehicle_id
INNER JOIN
car_model_master_tbl cmt ON cmt.car_id = vmt.car_make
INNER JOIN
vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
WHERE
esat.employee_id =3  and cmt.car_id=2
group by vfdt.model_id;


select vmt.vehicle_id,vmt.vehicle_no 
from showroom_vehicle_assignment_tbl svat inner join vehicle_master_tbl vmt on svat.vehicle_id=vmt.vehicle_id
and svat.is_active='Y' and vmt.is_active='Y'
inner join employee_showroom_assignment_tbl esat ON svat.showroom_id = esat.showroom_id and esat.is_active='Y'
where vmt.car_make=1 and vmt.car_model=1 and esat.employee_id=3
group by vmt.vehicle_id;



