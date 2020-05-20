SELECT 
    COUNT(DISTINCT IF(is_active = 'Y'
                AND DATE(assigned_on) = DATE(NOW()),
            assigned_id,
            NULL)) AS 'curDateVehAssignCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y'
                AND is_rejected = 'N'
                AND is_rescheduled = 'N'
                AND DATE(confirmed_on) = DATE(NOW()),
            assigned_id,
            NULL)) AS 'curDateAcceptCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_rejected = 'Y'
                AND DATE(rejected_on) = DATE(NOW()),
            assigned_id,
            NULL)) AS 'curDateRejectCount',
    COUNT(DISTINCT IF(
                 vehicle_id  IN ( 
select a.vehicle_id 
from
(select vehicle_id,
case when is_active='Y' and is_confirmed='Y' and is_rejected='N'  and is_rescheduled='N' and is_submitted='N' then confirmed_on
	when is_active='Y' and is_confirmed='Y' and is_rejected='N' and is_rescheduled='Y' and is_submitted='N' then reschedule_time_date end as checkdate
from evaluator_vehicle_assignment_tbl )a
where date(a.checkdate)=date(now())),
            vehicle_id,
            NULL)) AS 'curDatePendingCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y'
                AND is_rescheduled = 'Y'
                AND DATE(reschedule_time_date) = DATE(NOW()),
            assigned_id,
            NULL)) AS 'curDateRescheduleCount',
    DATE_FORMAT(DATE(NOW()), '%d-%c-%Y') AS 'curentDate',
    
    
    COUNT(DISTINCT IF(is_active = 'Y'
                AND assigned_on BETWEEN DATE_SUB(DATE(NOW()), INTERVAL 8 DAY) AND DATE(NOW()),
            assigned_id,
            NULL)) AS 'lasWeekVehAssignCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y'
                AND confirmed_on BETWEEN DATE_SUB(DATE(NOW()), INTERVAL 8 DAY) AND DATE(NOW()),
            assigned_id,
            NULL)) AS 'lastWeekAcceptCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_rejected = 'Y'
                AND rejected_on BETWEEN DATE_SUB(DATE(NOW()), INTERVAL 8 DAY) AND DATE(NOW()),
            assigned_id,
            NULL)) AS 'lastWeekRejectCount',
    COUNT(DISTINCT IF(
                 vehicle_id  IN ( 
select a.vehicle_id 
from
(select vehicle_id,
case when is_active='Y' and is_confirmed='Y' and is_rejected='N'  and is_rescheduled='N' and is_submitted='N' then confirmed_on
	when is_active='Y' and is_confirmed='Y' and is_rejected='N' and is_rescheduled='Y' and is_submitted='N' then reschedule_time_date end as checkdate
from evaluator_vehicle_assignment_tbl )a
where (a.checkdate BETWEEN DATE_SUB(DATE(NOW()), INTERVAL 8 DAY) AND DATE(NOW()))),
            vehicle_id,
            NULL)) AS 'lastWeekPendingCount',
COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y' and is_submitted='Y'
                AND submitted_on BETWEEN DATE_SUB(DATE(NOW()), INTERVAL 8 DAY) AND DATE(NOW()),
            assigned_id,
            NULL)) AS 'lastWeekEvaluatedCount',
    CONCAT(DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL 8 DAY),
                    '%D %b'),
            ' - ',
            DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL 1 DAY),
                    '%D %b')) AS 'lastWeek',
                    
                    
    COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y'
                AND MONTH(confirmed_on) = MONTH(NOW())
                AND YEAR(confirmed_on) = YEAR(NOW()),
            assigned_id,
            NULL)) AS 'curMonthAcceptCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y'
                AND is_rescheduled = 'Y' 
                AND MONTH(reschedule_time_date) = MONTH(NOW())
                AND YEAR(reschedule_time_date) = YEAR(NOW()),
            assigned_id,
            NULL)) AS 'curMonthRescheduleCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_rejected = 'Y'
                AND MONTH(rejected_on) = MONTH(NOW())
                AND YEAR(rejected_on) = YEAR(NOW()),
            assigned_id,
            NULL)) AS 'curMonthRejectCount',
    COUNT(DISTINCT IF(is_active = 'Y' AND is_confirmed = 'Y'
                AND is_submitted = 'Y'
                AND MONTH(submitted_on) = MONTH(NOW())
                AND YEAR(submitted_on) = YEAR(NOW()),
            assigned_id,
            NULL)) AS 'curMonthEvaluatedVehiclesCount',
    DATE_FORMAT(DATE(NOW()), '%M') AS 'curentMonth'
FROM
    evaluator_vehicle_assignment_tbl
WHERE
    evaluator_id = 2;