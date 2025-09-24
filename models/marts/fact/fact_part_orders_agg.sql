select 
     PO.CUSTOMER_KEY
    ,PO.ORDER_KEY
    ,P.DIM_PART_SK
    ,PO.STATUS
    ,PO.TOTAL_PRICE
    ,PO.TOTAL_DISCOUNT
    ,PO.TOTAL_QUANTITY
    ,PO.DATA_SOURCE
from 
    {{ ref('int_fact_part_orders_agg')}} AS PO
join 
    {{ref('dim_part')}} AS P 
        ON PO.PART_KEY = P.SOURCE_PART_KEY
            AND PO.DATA_SOURCE = P.DATA_SOURCE