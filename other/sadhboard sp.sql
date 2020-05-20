CREATE DEFINER=`root`@`%` PROCEDURE `DashboardDataInsert`(
in get_date date,
in city_id_set int,
in set_addedOn timestamp,
in id_get int
)
BEGIN

declare cityIds varchar(1000);
declare city_id_get int;

if city_id_set is null then
set city_id_get = 0;
else 
set city_id_get = city_id_set;
end if;

set cityIds = GetCitiesString(city_id_get);
 
 if get_date = date(now()) then 
 
 
INSERT INTO dashboard_data_tbl
(
id, 
registeredCars,
servicingCars,
unassignedCars,
unservicedCars,
droppedCars,
unavailableCars,
registeredBikes,
servicingBikes,
unassignedBikes,
unservicedBikes,
droppedBikes,
unavailableBikes,
totalEmployees,
totalOnLeave,
totalAbsent,
totalAttendancePending,
aomsCount,
supervisorsCount,
washExecutivesCount,
aomsAbsentCount,
supervisorsAbsentCount, 
washExecutivesAbsentCount,
unassignedCleaningAgent,
unassignedSupervisors,
unassignedAsstOM,
unassignedOM,
totalTickets,
openTicketsCount,
aomOpenCount,
washExecutiveOpenCount,
supervisorOpenCount,
totalClosedTickets,
Employeeoperationattendence,
conformationpending,
attendencepending,
asstmanager,
supervisor,
supervisorabsent,
washexecutive,
washexecutiveabsent,
added_on,
updated_on,
city_id)
select 
id_get,
aa.registeredCars,
aa.servicingCars,
aa.unassignedCars,
aa.unservicedCars,
aa.droppedCars,
aa.unavailableCars,
aa.registeredBikes,
aa.servicingBikes,
aa.unassignedBikes,
aa.unservicedBikes,
aa.droppedBikes,
aa.unavailableBikes,
aa.totalEmployees,
aa.totalOnLeave,
aa.totalAbsent,
aa.totalAttendancePending,
aa.aomsCount,
aa.supervisorsCount,
aa.washExecutivesCount,
aa.aomsAbsentCount,
aa.supervisorsAbsentCount,
aa.washExecutivesAbsentCount,
aa.unassignedCleaningAgent,
aa.unassignedSupervisors,
aa.unassignedAsstOM,
aa.unassignedOM,
aa.totalTickets,
aa.openTicketsCount,
aa.aomOpenCount,
aa.washExecutiveOpenCount,
aa.supervisorOpenCount,
aa.totalClosedTickets,
aa.Employeeoperationattendence,
aa.conformationpending,
aa.attendencepending,
aa.asstmanager,
aa.supervisor,
aa.supervisorabsent,
aa.washexecutive,
aa.washexecutiveabsent,
set_addedOn,
now(),
city_id_get
from
(SELECT 
    (SELECT 
            COUNT(DISTINCT uvt.id)
        FROM
            user_vehicle_tbl uvt
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id AND uat.apartment_id NOT IN (80)
        WHERE
            uvt.is_active = 'Y'
                AND uat.is_active = 'Y'
                AND uvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)) AS registeredCars,
    (select count(distinct a.vehicle_id) from

(SELECT 
           usvt.vehicle_id
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
         
                AND ust.payment_done = 'Y'
				AND ust.is_active='Y'
                AND usvt.vehicle_type_id = 1
              AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= date(now())
				AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= date(now())
                    group by usvt.vehicle_id
		union all 
        
        SELECT 
           usvt.vehicle_id
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
         
                AND ust.payment_done = 'Y'
				AND ust.is_active='Y'
                AND usvt.vehicle_type_id = 1
             AND FIND_IN_SET(a.city_id,cityIds)
                and ust.service_start_date>date(now())
           and usvt.vehicle_id  in(select ussvt.vehicle_id from user_services_tbl usst
  							, user_service_vehicle_tbl ussvt where
                             usst.user_service_id=ussvt.user_service_id 
                       and usst.payment_done='Y' and    usst.service_start_date<=date(now())  )
                       
		                    group by usvt.vehicle_id) a
                ) AS servicingCars,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'Y'
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    employee_vehicle_assignment_tbl
                WHERE
                    is_active = 'Y')) AS unassignedCars,
    (SELECT 
            COUNT(DISTINCT v.user_vehicle_id) total_vehicles
        FROM
            vehicle_service_status_temp v
                INNER JOIN
            user_vehicle_tbl uvt ON v.user_vehicle_id = uvt.id
                AND uvt.vehicle_type_id = 1
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y'
                AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND v.in_progress = 'N'
                AND v.service_done = 'N'
                AND FIND_IN_SET(a.city_id,cityIds)
                AND v.service_id = 1
                AND v.service_date = get_date
                AND v.user_vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    vehicle_service_status_temp
                WHERE
                    is_active = 'Y'
                        AND (service_done = 'Y' OR in_progress = 'Y')
                        AND user_vehicle_id = v.user_vehicle_id
                        AND v.service_date = service_date)) AS unservicedCars,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'N'
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT DISTINCT
                    usvt.vehicle_id
                FROM
                    user_services_tbl ust
                        INNER JOIN
                    user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                WHERE
                    ust.is_active = 'Y'
                        AND usvt.is_active = 'Y'
                        AND ust.payment_done = 'Y'
                        AND usvt.vehicle_type_id = 1
                        AND ust.service_start_date <= get_date
                  )) AS droppedCars,
    (SELECT 
            COUNT(DISTINCT vast.user_vehicle_id)
        FROM
            vehcile_available_status_tbl vast
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = vast.user_vehicle_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y'
                AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND uvt.is_active = 'Y'
                AND vast.is_active = 'Y'
                AND vast.status = 2
                AND uvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND DATE(vast.request_date) = get_date) AS unavailableCars,
    (SELECT 
            COUNT(DISTINCT uvt.id)
        FROM
            user_vehicle_tbl uvt
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id AND uat.apartment_id NOT IN (80)
        WHERE
            uvt.is_active = 'Y'
                AND uat.is_active = 'Y'
                AND FIND_IN_SET(a.city_id,cityIds)
                AND uvt.vehicle_type_id = 2) AS registeredBikes,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'

                AND ust.payment_done = 'Y'
				AND ust.is_active='Y'
                AND usvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
				AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
               ) AS servicingBikes,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id AND uat.apartment_id NOT IN (80)
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'Y'
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    employee_vehicle_assignment_tbl
                WHERE
                    is_active = 'Y')) AS unassignedBikes,
    (SELECT 
            COUNT(DISTINCT v.user_vehicle_id) total_vehicles
        FROM
            vehicle_service_status_temp v
                INNER JOIN
            user_vehicle_tbl uvt ON v.user_vehicle_id = uvt.id
                AND uvt.vehicle_type_id = 2
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND uat.is_active = 'Y'
                AND uat.apartment_id NOT IN (80)
                AND v.in_progress = 'N'
                AND v.service_done = 'N'
                AND v.service_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND v.service_date = get_date
                AND v.user_vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    vehicle_service_status_temp
                WHERE
                    is_active = 'Y'
                        AND (service_done = 'Y' OR in_progress = 'Y')
                        AND user_vehicle_id = v.user_vehicle_id
                        AND v.service_date = service_date)) AS unservicedBikes,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'N'
                AND uat.apartment_id NOT IN (80)
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT DISTINCT
                    usvt.vehicle_id
                FROM
                    user_services_tbl ust
                        INNER JOIN
                    user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                WHERE
                    ust.is_active = 'Y'
                        AND usvt.is_active = 'Y'
                        AND ust.payment_done = 'Y'
                        AND usvt.vehicle_type_id = 2
                        AND ust.service_start_date <= get_date
                      )) AS droppedBikes,
    (SELECT 
            COUNT(DISTINCT vast.user_vehicle_id)
        FROM
            vehcile_available_status_tbl vast
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = vast.user_vehicle_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND uvt.is_active = 'Y'
                AND vast.is_active = 'Y'
                AND vast.status = 2
                AND uvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND DATE(vast.request_date) = get_date) AS unavailableBikes,
    (SELECT 
            COUNT(DISTINCT e.employee_id)
        FROM
            employee_master_tbl e
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = e.employee_id
                AND elat.is_active = 'Y'
        WHERE
            e.is_active = 'Y' AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS totalEmployees,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id = 4
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND eat.date = get_date) AS totalOnLeave,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id = 2
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND eat.date = get_date) AS totalAbsent,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
        WHERE
            emt.is_active = 'Y' AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT 
                    employee_id
                FROM
                    employee_attendance_tbl
                WHERE
                    is_active = 'Y' AND date = get_date)) AS totalAttendancePending,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 3
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS aomsCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 2
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS supervisorsCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 1
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS washExecutivesCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id IN (2 , 4)
                AND erat.role_id = 3
                AND eat.date = get_date
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS aomsAbsentCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id IN (2 , 4)
                AND erat.role_id = 2
                AND eat.date = get_date
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS supervisorsAbsentCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id IN (2 , 4)
                AND erat.role_id = 1
                AND eat.date = get_date
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS washExecutivesAbsentCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 1
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT DISTINCT
                    eat.employee_id
                FROM
                    employee_assignment_tbl eat
                        INNER JOIN
                    employee_apartment_assignment_tbl eaat ON eaat.supervisor_id = eat.assigned_to
                WHERE
                    eaat.is_active = 'Y'
                        AND eat.is_active = 'Y')) AS unassignedCleaningAgent,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 2
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT DISTINCT
                    eat.employee_id
                FROM
                    employee_assignment_tbl eat
                        INNER JOIN
                    employee_apartment_assignment_tbl eaat ON eaat.asst_operation_manager_id = eat.assigned_to
                WHERE
                    eaat.is_active = 'Y'
                        AND eat.is_active = 'Y')) AS unassignedSupervisors,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 3
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT DISTINCT
                    eat.employee_id
                FROM
                    employee_assignment_tbl eat
                        INNER JOIN
                    employee_apartment_assignment_tbl eaat ON eaat.operation_manager_id = eat.assigned_to
                WHERE
                    eaat.is_active = 'Y'
                        AND eat.is_active = 'Y')) AS unassignedAsstOM,
    '0' AS unassignedOM,
    (SELECT 
            COUNT(DISTINCT t.ticket_no)
        FROM
            ticket_master_tbl t
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = t.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            t.is_active = 'Y'
                AND DATE(t.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS totalTickets,
    (SELECT 
            COUNT(DISTINCT t.ticket_no)
        FROM
            ticket_master_tbl t
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = t.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            t.is_active = 'Y' AND t.status_id = 1
                AND DATE(t.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS openTicketsCount,
    '0' AS supervisorOpenCount,
    '0' AS washExecutiveOpenCount,
    (SELECT 
            COUNT(DISTINCT tmt.ticket_no)
        FROM
            ticket_master_tbl tmt
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = tmt.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                INNER JOIN
            employee_ticket_assignment_tbl etat ON etat.ticket_no = tmt.ticket_no
        WHERE
            tmt.is_active = 'Y'
                AND tmt.status_id = 2
                AND etat.is_active = 'Y'
                AND DATE(tmt.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS aomOpenCount,
		(SELECT 
            COUNT(DISTINCT t.ticket_no)
        FROM
            ticket_master_tbl t
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = t.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            t.is_active = 'Y'
            AND t.status_id = 5
                AND DATE(t.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS totalClosedTickets,
    (select count(distinct if(emt.is_active='Y' and erat.is_active='Y' and erat.role_id in(1,2,3),emt.employee_id,null)) Employee_operation_attendence
from employee_master_tbl emt inner join employee_role_assignment_tbl erat on
emt.employee_id=erat.employee_id 
) Employeeoperationattendence,


(select 
(COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_morning_absent, 'N') = 'N'
                    AND esat.morning_login_time IS NOT NULL
                    AND IFNULL(esat.morning_confirmation, '-') = '-',
                esat.employee_id,
                NULL))) + COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_evening_absent, 'N') = 'N'
                    AND esat.evening_login_time IS NOT NULL
                    AND IFNULL(esat.evening_confirmation, '-') = '-',
                esat.employee_id,
                NULL)))) as conformation_pending
from employee_master_tbl emt 
inner join employee_role_assignment_tbl erat on erat.employee_id = emt.employee_id and erat.is_active='Y' and emt.is_active='Y' and erat.role_id = 1
inner join employee_shift_attendance_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y' and DATE(esat.attendance_date) = get_date
) conformationpending,



(select 

(COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_morning_absent, 'N') = 'N'
                    AND esat.morning_login_time IS NULL
                    AND IFNULL(esat.morning_confirmation, '-') = '-',
                esat.employee_id,
                NULL))) + COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_evening_absent, 'N') = 'N'
                    AND esat.evening_login_time IS NULL
                    AND IFNULL(esat.evening_confirmation, '-') = '-',
                esat.employee_id,
                NULL)))) as  attendence_pending
from employee_master_tbl emt 
inner join employee_role_assignment_tbl erat on erat.employee_id = emt.employee_id and erat.is_active='Y' and emt.is_active='Y' and erat.role_id = 1
left join employee_shift_attendance_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y' and DATE(esat.attendance_date) = get_date
) attendencepending,


(select 


count(distinct if(emt.is_active='Y' and erat.is_active='Y' and erat.role_id in(3),emt.employee_id,null)) Asst_manager

from employee_master_tbl emt inner join employee_role_assignment_tbl erat on
emt.employee_id=erat.employee_id 
) Asstmanager,


(select 

count(distinct if(emt.is_active='Y' and erat.is_active='Y' and erat.role_id in(2),emt.employee_id,null)) Supervisor
from employee_master_tbl emt inner join employee_role_assignment_tbl erat on
emt.employee_id=erat.employee_id 
) Supervisor,

(
select 

0) supervisorabsent,

(select 
0) washexecutive,


(select 

0) washexecutiveabsent

        

) aa;

else 
 

INSERT INTO dashboard_data_tbl
(
id, 
registeredCars,
servicingCars,
unassignedCars,
unservicedCars,
droppedCars,
unavailableCars,
registeredBikes,
servicingBikes,
unassignedBikes,
unservicedBikes,
droppedBikes,
unavailableBikes,
totalEmployees,
totalOnLeave,
totalAbsent,
totalAttendancePending,
aomsCount,
supervisorsCount,
washExecutivesCount,
aomsAbsentCount,
supervisorsAbsentCount, 
washExecutivesAbsentCount,
unassignedCleaningAgent,
unassignedSupervisors,
unassignedAsstOM,
unassignedOM,
totalTickets,
openTicketsCount,
aomOpenCount,
washExecutiveOpenCount,
supervisorOpenCount,
totalClosedTickets,
Employeeoperationattendence,
conformationpending,
attendencepending,
asstmanager,
supervisor,
supervisorabsent,
washexecutive,
washexecutiveabsent,
added_on,
updated_on,
city_id)
select 
id_get,
aa.registeredCars,
aa.servicingCars,
aa.unassignedCars,
aa.unservicedCars,
aa.droppedCars,
aa.unavailableCars,
aa.registeredBikes,
aa.servicingBikes,
aa.unassignedBikes,
aa.unservicedBikes,
aa.droppedBikes,
aa.unavailableBikes,
aa.totalEmployees,
aa.totalOnLeave,
aa.totalAbsent,
aa.totalAttendancePending,
aa.aomsCount,
aa.supervisorsCount,
aa.washExecutivesCount,
aa.aomsAbsentCount,
aa.supervisorsAbsentCount,
aa.washExecutivesAbsentCount,
aa.unassignedCleaningAgent,
aa.unassignedSupervisors,
aa.unassignedAsstOM,
aa.unassignedOM,
aa.totalTickets,
aa.openTicketsCount,
aa.aomOpenCount,
aa.washExecutiveOpenCount,
aa.supervisorOpenCount,
aa.totalClosedTickets,
aa.Employeeoperationattendence,
aa.conformationpending,
aa.attendencepending,
aa.asstmanager,
aa.supervisor,
aa.supervisorabsent,
aa.washexecutive,
aa.washexecutiveabsent,
set_addedOn,
now(),
city_id_get
from
(SELECT 
    (SELECT 
            COUNT(DISTINCT uvt.id)
        FROM
            user_vehicle_tbl uvt
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id AND uat.apartment_id NOT IN (80)
        WHERE
            uvt.is_active = 'Y'
                AND uat.is_active = 'Y'
                AND uvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)) AS registeredCars,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
            
                AND ust.payment_done = 'Y'
				AND ust.is_active='Y'
                AND usvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
				AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
               ) AS servicingCars,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'Y'
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    employee_vehicle_assignment_tbl
                WHERE
                    is_active = 'Y')) AS unassignedCars,
    (SELECT 
            COUNT(DISTINCT v.user_vehicle_id) total_vehicles
        FROM
            vehicle_service_status_tbl v
                INNER JOIN
            user_vehicle_tbl uvt ON v.user_vehicle_id = uvt.id
                AND uvt.vehicle_type_id = 1
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y'
                AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND v.in_progress = 'N'
                AND v.service_done = 'N'
                AND FIND_IN_SET(a.city_id,cityIds)
                AND v.service_id = 1
                AND v.service_date = get_date
                AND v.user_vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    vehicle_service_status_tbl
                WHERE
                    is_active = 'Y'
                        AND (service_done = 'Y' OR in_progress = 'Y')
                        AND user_vehicle_id = v.user_vehicle_id
                        AND v.service_date = service_date)) AS unservicedCars,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'N'
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT DISTINCT
                    usvt.vehicle_id
                FROM
                    user_services_tbl ust
                        INNER JOIN
                    user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                WHERE
                    ust.is_active = 'Y'
                        AND usvt.is_active = 'Y'
                        AND ust.payment_done = 'Y'
                        AND usvt.vehicle_type_id = 1
                        AND ust.service_start_date <= get_date
                   )) AS droppedCars,
    (SELECT 
            COUNT(DISTINCT vast.user_vehicle_id)
        FROM
            vehcile_available_status_tbl vast
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = vast.user_vehicle_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y'
                AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND uvt.is_active = 'Y'
                AND vast.is_active = 'Y'
                AND vast.status = 2
                AND uvt.vehicle_type_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND DATE(vast.request_date) = get_date) AS unavailableCars,
    (SELECT 
            COUNT(DISTINCT uvt.id)
        FROM
            user_vehicle_tbl uvt
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id AND uat.apartment_id NOT IN (80)
        WHERE
            uvt.is_active = 'Y'
                AND uat.is_active = 'Y'
                AND FIND_IN_SET(a.city_id,cityIds)
                AND uvt.vehicle_type_id = 2) AS registeredBikes,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
         
                AND ust.payment_done = 'Y'
				AND ust.is_active='Y'
                AND usvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date) AS servicingBikes,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id AND uat.apartment_id NOT IN (80)
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'Y'
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    employee_vehicle_assignment_tbl
                WHERE
                    is_active = 'Y')) AS unassignedBikes,
    (SELECT 
            COUNT(DISTINCT v.user_vehicle_id) total_vehicles
        FROM
            vehicle_service_status_tbl v
                INNER JOIN
            user_vehicle_tbl uvt ON v.user_vehicle_id = uvt.id
                AND uvt.vehicle_type_id = 2
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND uat.is_active = 'Y'
                AND uat.apartment_id NOT IN (80)
                AND v.in_progress = 'N'
                AND v.service_done = 'N'
                AND v.service_id = 1
                AND FIND_IN_SET(a.city_id,cityIds)
                AND v.service_date = get_date
                AND v.user_vehicle_id NOT IN (SELECT 
                    user_vehicle_id
                FROM
                    vehicle_service_status_tbl
                WHERE
                    is_active = 'Y'
                        AND (service_done = 'Y' OR in_progress = 'Y')
                        AND user_vehicle_id = v.user_vehicle_id
                        AND v.service_date = service_date)) AS unservicedBikes,
    (SELECT 
            COUNT(DISTINCT usvt.vehicle_id)
        FROM
            user_services_tbl ust
                INNER JOIN
            user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = usvt.user_id
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            uat.is_active = 'Y'
                AND ust.is_active = 'N'
                AND uat.apartment_id NOT IN (80)
                AND usvt.is_active = 'Y'
                AND ust.payment_done = 'Y'
                AND usvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND ust.service_start_date <= get_date
                AND DATE(DATE_ADD(ust.service_end_date,
                    INTERVAL 1 YEAR)) >= get_date
                AND usvt.vehicle_id NOT IN (SELECT DISTINCT
                    usvt.vehicle_id
                FROM
                    user_services_tbl ust
                        INNER JOIN
                    user_service_vehicle_tbl usvt ON usvt.user_service_id = ust.user_service_id
                WHERE
                    ust.is_active = 'Y'
                        AND usvt.is_active = 'Y'
                        AND ust.payment_done = 'Y'
                        AND usvt.vehicle_type_id = 2
                        AND ust.service_start_date <= get_date
                       )) AS droppedBikes,
    (SELECT 
            COUNT(DISTINCT vast.user_vehicle_id)
        FROM
            vehcile_available_status_tbl vast
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = vast.user_vehicle_id
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                AND uvt.is_active = 'Y'
                AND vast.is_active = 'Y'
                AND vast.status = 2
                AND uvt.vehicle_type_id = 2
                AND FIND_IN_SET(a.city_id,cityIds)
                AND DATE(vast.request_date) = get_date) AS unavailableBikes,
    (SELECT 
            COUNT(DISTINCT e.employee_id)
        FROM
            employee_master_tbl e
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = e.employee_id
                AND elat.is_active = 'Y'
        WHERE
            e.is_active = 'Y' AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS totalEmployees,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id = 4
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND eat.date = get_date) AS totalOnLeave,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id = 2
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND eat.date = get_date) AS totalAbsent,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
        WHERE
            emt.is_active = 'Y' AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT 
                    employee_id
                FROM
                    employee_attendance_tbl
                WHERE
                    is_active = 'Y' AND date = get_date)) AS totalAttendancePending,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 3
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS aomsCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 2
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS supervisorsCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 1
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS washExecutivesCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id IN (2 , 4)
                AND erat.role_id = 3
                AND eat.date = get_date
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS aomsAbsentCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id IN (2 , 4)
                AND erat.role_id = 2
                AND eat.date = get_date
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS supervisorsAbsentCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
                INNER JOIN
            employee_attendance_tbl eat ON eat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND eat.is_active = 'Y'
                AND eat.status_id IN (2 , 4)
                AND erat.role_id = 1
                AND eat.date = get_date
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)) AS washExecutivesAbsentCount,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 1
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT DISTINCT
                    eat.employee_id
                FROM
                    employee_assignment_tbl eat
                        INNER JOIN
                    employee_apartment_assignment_tbl eaat ON eaat.supervisor_id = eat.assigned_to
                WHERE
                    eaat.is_active = 'Y'
                        AND eat.is_active = 'Y')) AS unassignedCleaningAgent,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 2
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT DISTINCT
                    eat.employee_id
                FROM
                    employee_assignment_tbl eat
                        INNER JOIN
                    employee_apartment_assignment_tbl eaat ON eaat.asst_operation_manager_id = eat.assigned_to
                WHERE
                    eaat.is_active = 'Y'
                        AND eat.is_active = 'Y')) AS unassignedSupervisors,
    (SELECT 
            COUNT(DISTINCT emt.employee_id)
        FROM
            employee_master_tbl emt
                LEFT JOIN
            employee_location_assignment_tbl elat ON elat.employee_id = emt.employee_id
                AND elat.is_active = 'Y'
                INNER JOIN
            employee_role_assignment_tbl erat ON erat.employee_id = emt.employee_id
        WHERE
            emt.is_active = 'Y'
                AND erat.is_active = 'Y'
                AND erat.role_id = 3
                AND FIND_IN_SET(ifnull(elat.city_id,1),cityIds)
                AND emt.employee_id NOT IN (SELECT DISTINCT
                    eat.employee_id
                FROM
                    employee_assignment_tbl eat
                        INNER JOIN
                    employee_apartment_assignment_tbl eaat ON eaat.operation_manager_id = eat.assigned_to
                WHERE
                    eaat.is_active = 'Y'
                        AND eat.is_active = 'Y')) AS unassignedAsstOM,
    '0' AS unassignedOM,
    (SELECT 
            COUNT(DISTINCT t.ticket_no)
        FROM
            ticket_master_tbl t
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = t.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            t.is_active = 'Y'
                AND DATE(t.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS totalTickets,
    (SELECT 
            COUNT(DISTINCT t.ticket_no)
        FROM
            ticket_master_tbl t
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = t.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            t.is_active = 'Y' AND t.status_id = 1
                AND DATE(t.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS openTicketsCount,
    '0' AS supervisorOpenCount,
    '0' AS washExecutiveOpenCount,
    (SELECT 
            COUNT(DISTINCT tmt.ticket_no)
        FROM
            ticket_master_tbl tmt
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = tmt.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
                INNER JOIN
            employee_ticket_assignment_tbl etat ON etat.ticket_no = tmt.ticket_no
        WHERE
            tmt.is_active = 'Y'
                AND tmt.status_id = 2
                AND etat.is_active = 'Y'
                AND DATE(tmt.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS aomOpenCount,
		(SELECT 
            COUNT(DISTINCT t.ticket_no)
        FROM
            ticket_master_tbl t
                INNER JOIN
            user_vehicle_tbl uvt ON uvt.id = t.vehicle_ids
                INNER JOIN
            user_apartment_tbl uat ON uat.user_id = uvt.user_id
                AND uat.is_active = 'Y' AND uat.apartment_id NOT IN (80)
                INNER JOIN
            apartment_master_tbl a ON a.apartment_id = uat.apartment_id
        WHERE
            t.is_active = 'Y'
            AND t.status_id = 5
                AND DATE(t.created_on) = get_date
                AND FIND_IN_SET(a.city_id,cityIds)) AS totalClosedTickets,
    (select count(distinct if(emt.is_active='Y' and erat.is_active='Y' and erat.role_id in(1,2,3),emt.employee_id,null)) Employee_operation_attendence
from employee_master_tbl emt inner join employee_role_assignment_tbl erat on
emt.employee_id=erat.employee_id 
) Employeeoperationattendence,


(select 
(COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_morning_absent, 'N') = 'N'
                    AND esat.morning_login_time IS NOT NULL
                    AND IFNULL(esat.morning_confirmation, '-') = '-',
                esat.employee_id,
                NULL))) + COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_evening_absent, 'N') = 'N'
                    AND esat.evening_login_time IS NOT NULL
                    AND IFNULL(esat.evening_confirmation, '-') = '-',
                esat.employee_id,
                NULL)))) as conformation_pending
from employee_master_tbl emt 
inner join employee_role_assignment_tbl erat on erat.employee_id = emt.employee_id and erat.is_active='Y' and emt.is_active='Y' and erat.role_id = 1
inner join employee_shift_attendance_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y' and DATE(esat.attendance_date) = get_date
) conformationpending,



(select 
(COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_morning_absent, 'N') = 'N'
                    AND esat.morning_login_time IS NULL
                    AND IFNULL(esat.morning_confirmation, '-') = '-',
                esat.employee_id,
                NULL))) + COUNT(DISTINCT IF(esat.employee_id IS NULL,
            emt.employee_id,
            IF(IFNULL(esat.on_leave, 'N') = 'N'
                    AND IFNULL(esat.is_evening_absent, 'N') = 'N'
                    AND esat.evening_login_time IS NULL
                    AND IFNULL(esat.evening_confirmation, '-') = '-',
                esat.employee_id,
                NULL)))) as attendence_pending
from employee_master_tbl emt 
inner join employee_role_assignment_tbl erat on erat.employee_id = emt.employee_id and erat.is_active='Y' and emt.is_active='Y' and erat.role_id = 1
left join employee_shift_attendance_tbl esat on esat.employee_id=emt.employee_id and esat.is_active='Y' and DATE(esat.attendance_date) = get_date
) attendencepending,


(select 


count(distinct if(emt.is_active='Y' and erat.is_active='Y' and erat.role_id in(3),emt.employee_id,null)) Asst_manager

from employee_master_tbl emt inner join employee_role_assignment_tbl erat on
emt.employee_id=erat.employee_id 
) Asstmanager,


(select 

count(distinct if(emt.is_active='Y' and erat.is_active='Y' and erat.role_id in(2),emt.employee_id,null)) Supervisor
from employee_master_tbl emt inner join employee_role_assignment_tbl erat on
emt.employee_id=erat.employee_id 
) Supervisor,

(
0) supervisorabsent,

(select 

0) washexecutive,


(select 

0) washexecutiveabsent

        

) aa;
 end if;
 
 
END