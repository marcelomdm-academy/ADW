with
    ILLUSTRATION as (
    select
        cast(ILLUSTRATIONID as VARCHAR) as PK_illustration 
	    , DIAGRAM 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'ILLUSTRATION') }}
    )

select *
from ILLUSTRATION