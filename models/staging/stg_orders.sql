select
    -- from raw order
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice,
    o.ordercustprice,
    o.ordersellingprice - ordercustprice as orderprofit,
    -- from raw customer
    c.customerid,
    c.customername,
    c.segment,
    c.country,
    -- from raw product
    p.productid,
    p.category,
    p.productname,
    p.subcategory,
    {{markup('ordersellingprice','ordercustprice')}} markup
    -- ,{{target.name}}
from {{ ref("raw_orders") }} o
left join {{ ref("raw_customer") }} c
on o.customerid = c.customerid
left join {{ ref("raw_product") }} p
on o.productid = p.productid
{{limit_data_in_dev("to_timestamp(orderdate,'yyyy/mm/dd')")}}

