with
    CREDITCARD as (
    select 
       cast(CREDITCARDID as number(38,0)) as PK_creditcard
       , CARDNUMBER
       , CARDTYPE  
       , TO_DATE(EXPYEAR || '-' || LPAD(EXPMONTH, 2, '0') || '-01', 'YYYY-MM-DD') AS EXPIRATION_DATE
    from {{ source('RAW_ADVENTURE_WORKS', 'CREDITCARD') }}
    )

select *
from CREDITCARD