insert into sales_lead_master_tbl (customer_name,phone_no,email,location,lead_source,budget,planning_to_by,added_by,is_active)
select customer_name,phone_no,email,location,lead_source,budget,planning_to_by,added_by,'B' from bulk_sales_lead_upload_tbl;

