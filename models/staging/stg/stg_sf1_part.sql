select 
    p_partkey as part_key,
    p_name as name,
    p_brand as brand,
    p_type as part_type,
    'TPCH_SF1' AS DATA_SOURCE
from 
    {{ source('tpch_sf1','part')}}