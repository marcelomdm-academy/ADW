with
    PRODUCTSUBCATEGORY as (
    select
        cast(PRODUCTSUBCATEGORYID as number(38,0)) as PK_subcategory
	    , cast(PRODUCTCATEGORYID as number(38,0)) as FK_category
	    , cast(NAME as varchar) as name_subcategory
	    , ROWGUID 
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE    
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTSUBCATEGORY') }}
    )

select *
from PRODUCTSUBCATEGORY