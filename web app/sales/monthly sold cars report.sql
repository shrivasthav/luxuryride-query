select a.customer_id,a.customer_name,a.phone_no,a.car_make,a.car_model,a.under_finance,a.source_name,
a.first_name,a.showroom_code,a.RetailsStatus
from 
(select slmt.customer_id,slmt.customer_name,slmt.phone_no,cmt.car_make,vfdt.car_model,csut.under_finance,
slst.source_name,emt.first_name,st.showroom_code,'BOOKED' as 'RetailsStatus',date(csut.date_time) as date_time
from customer_status_update_tbl csut inner join sales_lead_master_tbl slmt on csut.customer_id=slmt.customer_id
and slmt.is_active='Y' and csut.is_active='Y'
inner join vehicle_master_tbl vmt on vmt.vehicle_id=csut.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join sales_lead_source_tbl slst on slst.lead_source_id=slmt.lead_source
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
where csut.customer_status=3 and followup_status=6 
group by slmt.customer_id
union all
select slmt.customer_id,slmt.customer_name,slmt.phone_no,cmt.car_make,vfdt.car_model,csut.under_finance,
slst.source_name,emt.first_name,st.showroom_code ,'Delivered' as 'RetailsStatus',date(vsdt.sold_on) as date_time
from vehicle_sales_details_tbl vsdt inner join 
 customer_status_update_tbl csut on csut.customer_id=vsdt.customer_id and vsdt.is_active='Y'
 inner join sales_lead_master_tbl slmt on csut.customer_id=slmt.customer_id
inner join vehicle_master_tbl vmt on vmt.vehicle_id=csut.vehicle_id
inner join car_model_master_tbl cmt on cmt.car_id=vmt.car_make
inner join vehicle_full_details_tbl vfdt on vfdt.model_id=vmt.car_model
inner join sales_lead_source_tbl slst on slst.lead_source_id=slmt.lead_source
inner join employee_master_tbl emt on emt.employee_id=csut.updated_by
inner join employee_showroom_assignment_tbl esat on esat.employee_id=emt.employee_id
inner join showrooms_tbl st on st.showroom_id=esat.showroom_id
group by slmt.customer_id)a
where month(a.date_time)=03 and year(a.date_time)=2020
group by a.customer_id

