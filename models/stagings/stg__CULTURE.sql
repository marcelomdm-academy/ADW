with
    CULTURE as (
    select 
        cast(CULTUREID as VARCHAR) as PK_culture
        , cast(MODIFIEDDATE as date) as MODIFIEDDATE
        , cast(NAME as varchar) as culture_name
    from  {{ source('RAW_ADVENTURE_WORKS', 'CULTURE') }}
    )

select *
from CULTURE