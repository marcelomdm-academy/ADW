with
    TRANSACTIONHISTORY as (
    select 
        CAST(TRANSACTIONID AS NUMBER(38,0)) AS PK_trasaction 
	    , CAST(PRODUCTID AS NUMBER(38,0)) AS FK_product
	    , REFERENCEORDERID
	    , REFERENCEORDERLINEID 
	    , cast(TRANSACTIONDATE as date) as TRANSACTIONDATE
	    , TRANSACTIONTYPE 
	    , QUANTITY
	    , ACTUALCOST
        , cast(MODIFIEDDATE as date) as modifieddate
    from {{ source('RAW_ADVENTURE_WORKS', 'TRANSACTIONHISTORY') }}
    )

select *
from TRANSACTIONHISTORY