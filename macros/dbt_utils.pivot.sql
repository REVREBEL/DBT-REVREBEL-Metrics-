SELECT
    stay_date,
    snapshot_date,
    {{ dbt_utils.pivot(
        column='segment',
        values=dbt_utils.get_column_values(ref('stg_hotel_pacing'), 'segment'),
        then_value='rooms_booked'
    ) }}
FROM {{ ref('fct_pacing_pickup') }}
GROUP BY 1, 2