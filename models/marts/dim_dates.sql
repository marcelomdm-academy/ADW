WITH 
generate_date AS (
    SELECT 
        SEQ4() - 1 AS day_offset
        , DATEADD(day, SEQ4() - 1, '2000-01-01'::date) AS d
    FROM TABLE(GENERATOR(ROWCOUNT => 18597))  -- Número de dias entre 2000-01-01 e 2050-01-01
),

calendar AS (
    SELECT
        TO_CHAR(d, 'YYYYMMDD') AS id
        , TO_CHAR(d, 'YYYY-MM-DD') AS data_id
        , TO_CHAR(d, 'DD-MM-YYYY') AS data_completa
        , EXTRACT(YEAR FROM d) AS ano
        , EXTRACT(WEEK FROM d) AS semana_ano
        , EXTRACT(DOY FROM d) AS dia_ano
        , CASE
            WHEN EXTRACT(QUARTER FROM d) IN (1, 2) THEN '1'
            ELSE '2'
        END AS semestre
        , EXTRACT(MONTH FROM d) AS mes
        , TO_CHAR(d, 'Month') AS month_name
        , EXTRACT(DAYOFWEEK FROM d) AS dia_da_semana
        , TO_CHAR(d, 'Day') AS day_name
        , CASE
            WHEN EXTRACT(DAYOFWEEK FROM d) IN (1, 7) THEN 'Não'  -- 1=Domingo, 7=Sábado
            ELSE 'Sim'
        END AS dia_util
    FROM generate_date
)

SELECT
    id
    , data_id
    , data_completa
    , ano
    , semana_ano
    , dia_ano
    , semestre
    , mes
    , dia_da_semana
    , dia_util
FROM calendar
