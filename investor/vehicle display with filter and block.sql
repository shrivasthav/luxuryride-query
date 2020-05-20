SELECT 
    a.vehicleId,
    a.brandId,
    a.brandName,
    a.image,
    a.price,
    a.vehicleName,
    a.manufacturedYear,
    a.odometer,
    a.gearSystem,
    a.fuelType,
    a.noOfOwners,
    a.rejectedBlock,
    a.vehicleBlock,
    a.dayBlock,
    a.filterStatus,
    sum(a.que_count) as que_count
FROM
    (SELECT 
        pvdt.vehicle_id 'vehicleId',
            cmt.car_id 'brandId',
            cmt.car_make 'brandName',
            vcit.front_view 'image',
            (pvdt.purchase_price + pvdt.refurbish_amount) AS price,
            CONCAT(cmt.car_make, ' - ', vfdt.car_model) 'vehicleName',
            vmt.manufactured_year 'manufacturedYear',
            vmt.odometer,
            plt.transmission 'gearSystem',
            vmt.fuel_type 'fuelType',
            IFNULL(vmt.no_of_owners, 'NA') 'noOfOwners',
            (select 
               CASE WHEN a.vehicle_counts = 3 THEN 'Y' ELSE 'N' END as rejectedBlock from
                (SELECT 
                    COUNT(DISTINCT vehicle_id) as vehicle_counts
                FROM
                    invester_reject_vehicle_tbl
                WHERE
                    is_active = 'Y' AND invester_id = 2)a) as rejectedBlock,
            (SELECT 
                    CASE
                            WHEN (COUNT(DISTINCT irt.vehicle_id) + COUNT(DISTINCT ivt.vehicle_id)) >= ibt.car_visible_count THEN 'Y'
                            ELSE 'N'
                        END AS blockStatus
                FROM
                    invester_master_tbl imt
                INNER JOIN invester_reject_vehicle_tbl irt ON imt.invester_id = irt.invester_id
                    AND irt.is_active = 'Y'
                INNER JOIN invester_vehicle_interest_tbl ivt ON ivt.invester_id = irt.invester_id
                and ivt.is_interest='Y' 
                INNER JOIN invester_budget_master_tbl ibt ON ibt.budget_id = imt.budget_id
                WHERE
                    imt.invester_id = 2) AS vehicleBlock,
            (SELECT 
                    CASE
                            WHEN COUNT(DISTINCT vehicle_id) = 2 THEN 'Y'
                            ELSE 'N'
                        END AS dayBlock
                FROM
                    invester_reject_vehicle_tbl
                WHERE
                    DATE(rejected_on) = DATE(NOW())
                        AND invester_id = 2
                        AND is_active = 'Y') AS dayBlock,
            (SELECT 
                    CASE
                            WHEN budget_id IN (4 , 5) THEN 'Y'
                            ELSE 'N'
                        END AS filterStatus
                FROM
                    invester_master_tbl
                WHERE
                    invester_id = 2) 'filterStatus',
				count(a.vehicle_id) as que_count
    FROM
        purchased_vehicle_details_tbl pvdt
    INNER JOIN vehicle_master_tbl vmt ON vmt.vehicle_id = pvdt.vehicle_id
    INNER JOIN car_model_master_tbl cmt ON vmt.car_make = cmt.car_id
    INNER JOIN purchase_lead_tbl plt ON plt.purchase_lead_id = vmt.purchase_lead_id
    INNER JOIN vehicle_full_details_tbl vfdt ON vfdt.model_id = vmt.car_model
    INNER JOIN vehicle_condition_images_tbl vcit ON vcit.vehicle_id = vmt.vehicle_id
    inner join (select vehicle_id   from purchased_vehicle_details_tbl  where is_active='Y' and onboard_id=2)a on a.vehicle_id=pvdt.vehicle_id
        AND vcit.is_active = 'Y' 
    WHERE
             pvdt.is_active = 'Y' and vmt.is_active='Y' and pvdt.onboard_id=2
            AND (pvdt.vehicle_visibulity = 'ALL'
            OR pvdt.vehicle_id IN (SELECT 
                imt.vehicle_id
            FROM
                purchased_vehicle_details_tbl imt
            WHERE
                imt.vehicle_id IN (SELECT 
                        CASE WHEN
		FIND_IN_SET(invester_id, (SELECT vehicle_visibulity FROM purchased_vehicle_details_tbl WHERE is_active = 'Y'
	AND vehicle_id IN (pvdt.vehicle_id))) THEN pvdt.vehicle_id END 'id' FROM invester_master_tbl WHERE is_active = 'Y' AND invester_id = 2)))
            AND cmt.car_id IN (select 
case when FIND_IN_SET(cmt.car_id, (SELECT car_id FROM invester_car_brand_tbl WHERE invester_id = 2)) then 
cmt.car_id end as vehicle_name
from car_model_master_tbl cmt where cmt.is_active='Y')
AND pvdt.vehicle_id NOT IN (SELECT vehicle_id FROM invester_vehicle_interest_tbl WHERE (is_active='Y'or invester_id = 3))
            AND (pvdt.purchase_price + pvdt.refurbish_amount) <= (SELECT 
                CASE
                        WHEN ivit.is_active = 'Y' THEN ivit.remain_amount
                        ELSE ibmt.amount
                    END AS amount
            FROM
                invester_master_tbl imt
            INNER JOIN invester_budget_master_tbl ibmt ON imt.budget_id = ibmt.budget_id
                AND ibmt.is_active = 'Y'
            LEFT JOIN invester_debit_amount_tbl ivit ON ivit.invester_id = imt.invester_id
                AND ivit.is_active = 'Y'
            WHERE
                imt.invester_id = 2)
	AND pvdt.vehicle_id NOT IN (SELECT  vehicle_id FROM invester_reject_vehicle_tbl WHERE invester_id = 2)
    GROUP BY pvdt.vehicle_id) a
ORDER BY a.price DESC

