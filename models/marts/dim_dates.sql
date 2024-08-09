WITH 
    Dim_dates AS (
        SELECT DATEADD(DAY, SEQ4(), '2011-05-01') AS MY_DATE
        FROM TABLE(GENERATOR(ROWCOUNT => 5480))  -- Number of days after reference date in previous line
)
    , dates as ( 
        SELECT 
            MY_DATE
            , YEAR(MY_DATE) AS year
            , MONTH(MY_DATE) AS month
            , MONTHNAME(MY_DATE) AS month_name
            , DAY(MY_DATE) AS day
            , DAYNAME(MY_DATE) AS day_name
            , DAYOFYEAR(MY_DATE) AS day_of_year
        FROM Dim_dates
    )
    
    , datas as (
        select
            *
            , case
                when month = 1 then 'Janeiro'
                when month = 2 then 'Fevereiro'
                when month = 3 then 'Março'
                when month = 4 then 'Abril'
                when month = 5 then 'Maio'
                when month = 6 then 'Junho'
                when month = 7 then 'Julho'
                when month = 8 then 'Agosto'
                when month = 9 then 'Setembro'
                when month = 10 then 'Outubro'
                when month = 11 then 'Novembro'
                when month = 12 then 'Dezembro'
            end as Nome_mes
        from dates
    )


    select *
    from datas