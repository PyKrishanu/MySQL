create or replace view sales_by_client as
select
c.client_id,
c.name,
sum(invoice_total) as total_sales
from clients c
join invoices i using (client_id)
group by client_id, name