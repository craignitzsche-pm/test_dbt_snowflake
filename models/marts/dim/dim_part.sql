select 
    {{ dbt_utils.generate_surrogate_key(['PART_KEY', 'DATA_SOURCE']) }} AS DIM_PART_SK 
    ,NAME
    ,BRAND
    ,PART_TYPE
    ,PART_KEY AS SOURCE_PART_KEY
    ,DATA_SOURCE
from {{ ref('int_dim_part')}}