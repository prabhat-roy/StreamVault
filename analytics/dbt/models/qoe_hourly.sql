{{ config(materialized='incremental', engine='SummingMergeTree', order_by=['hour','country','device_type']) }}

SELECT
  toStartOfHour(minute)              AS hour,
  country,
  device_type,
  SUM(events)                        AS events,
  SUM(rebuffer_ms)                   AS rebuffer_ms,
  AVG(avg_bitrate)                   AS avg_bitrate,
  quantileTDigestMerge(0.95)(p95_join_time_ms) AS p95_join_time_ms
FROM {{ source('streamvault', 'qoe_1m') }}
{% if is_incremental() %} WHERE minute > (SELECT MAX(hour) FROM {{ this }}) {% endif %}
GROUP BY hour, country, device_type
