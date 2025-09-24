select 
     O.CUSTOMER_KEY
    ,O.ORDER_KEY
    ,L.PART_KEY
    ,O.STATUS
    ,SUM(L.EXTENDED_PRICE) AS TOTAL_PRICE
    ,SUM(L.DISCOUNT) AS TOTAL_DISCOUNT
    ,SUM(L.QUANTITY) AS TOTAL_QUANTITY
    ,O.DATA_SOURCE
from 
    {{ ref('stg_sf1_order')}} as O
join
    {{ ref('stg_sf1_lineitem')}} as L
        ON O.ORDER_KEY = L.ORDER_KEY
group by 
     O.CUSTOMER_KEY
    ,O.ORDER_KEY
    ,L.PART_KEY
    ,O.STATUS
    ,O.DATA_SOURCE