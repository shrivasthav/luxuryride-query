SELECT   
    CONCAT(UPPER(SUBSTRING(TRIM(emt.first_name), 1, 1)),  
            LOWER(SUBSTRING(TRIM(emt.first_name), 2))) 'evaluatorName',  
    emt.phone_number 'evaluatorPhno',  
    emt.email_id 'emailId',  
    UCASE(ert.role) 'designation',  
    IFNULL(emt.employee_code, '-') 'empCode',  
    UCASE(cmt.city) 'city',  
    COUNT(DISTINCT IF(evat.is_submitted = 'Y',  
            evat.vehicle_id,  
            NULL)) AS 'evaluatedVehiclesCount'  
FROM  
    employee_master_tbl emt  
        INNER JOIN  
    employee_roles_tbl ert ON emt.role_id = ert.role_id  
        AND emt.is_active = 'Y'  
        INNER JOIN  
    city_master_tbl cmt ON cmt.city_id = emt.employee_location  
        left JOIN  
    evaluator_vehicle_assignment_tbl evat ON evat.evaluator_id = emt.employee_id  
        AND evat.is_active = 'Y'  
WHERE  
    emt.employee_id =1
GROUP BY employee_id ;