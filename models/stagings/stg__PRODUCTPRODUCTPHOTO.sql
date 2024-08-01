with
    PRODUCTPRODUCTPHOTO as (
    select
        CAST(PRODUCTPHOTOID AS NUMBER(38,0)) AS PK_product_photo
        , CAST(PRODUCTID AS NUMBER(38,0)) AS FK_product 
	    , PRIMARY
	    , cast(MODIFIEDDATE as date) as MODIFIEDDATE
    from {{ source('RAW_ADVENTURE_WORKS', 'PRODUCTPRODUCTPHOTO') }}
    )

select *
from PRODUCTPRODUCTPHOTO