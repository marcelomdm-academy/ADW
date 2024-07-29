with
    PRODUCTCATEGORY as (
    select 
        cast(PRODUCTCATEGORYID as number(38,0)) as PK_category
	    , cast(NAME as varchar) as name_category
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE 
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTCATEGORY') }}
    )

select *
from PRODUCTCATEGORY