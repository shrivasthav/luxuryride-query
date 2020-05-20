SELECT 
    vmt.vehicle_id,
    vmt.vehicle_no,
    concat(cmt.car_make,' - ',vfdt.car_model) as vehicle_name,
    svat.vehicle_images,
    svat.vehicle_Video,
    svat.final_selling_price
FROM
    showroom_vehicle_assignment_tbl svat
        INNER JOIN
    vehicle_master_tbl vmt ON svat.vehicle_id = vmt.vehicle_id
        AND svat.is_active = 'Y'
    inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
    inner join vehicle_full_details_tbl vfdt on model_id=vmt.car_model
        INNER JOIN
    employee_showroom_assignment_tbl eshat ON eshat.showroom_id = svat.showroom_id
        AND eshat.is_active = 'Y' 
WHERE eshat.employee_id = 3 and
    vmt.vehicle_id NOT IN (SELECT 
            vehicle_id
        FROM
            vehicle_sales_details_tbl
        WHERE
            is_active = 'Y')
        
