SELECT 
    IFNULL(a.phoneno, 'NA') phoneno
FROM
    (SELECT 
        CASE
                WHEN
                    9030755940 NOT IN (SELECT 
                            IFNULL(phone_number, 'NA') phone_number
                        FROM
                            employee_master_tbl
                        WHERE
                            is_active = 'Y')
                THEN
                    9632787328
                ELSE NULL
            END 'phoneno'
    ) a;