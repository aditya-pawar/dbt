with orders as(
    select * from {{ ref('raw_orders') }}


)

select orderId,ordersellingprice as total_sp
from orders
group by orderId having total_sp<0

