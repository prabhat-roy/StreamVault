CREATE TABLE qoe_event (
  user_id   STRING, session_id STRING, country STRING, device_type STRING, cdn_pop STRING,
  rebuffer_ms INT, bitrate_kbps INT, join_time_ms INT, ts TIMESTAMP_LTZ(3),
  WATERMARK FOR ts AS ts - INTERVAL '10' SECOND
) WITH ( 'connector' = 'kafka', 'topic' = 'qoe.event.recorded', 'properties.bootstrap.servers' = 'kafka:9092', 'format' = 'avro' );

CREATE TABLE qoe_minute (
  minute      TIMESTAMP_LTZ(3), country STRING, device_type STRING, cdn_pop STRING,
  events      BIGINT, rebuffer_total BIGINT, p95_join_ms INT, avg_bitrate INT
) WITH ( 'connector' = 'jdbc', 'url' = 'jdbc:clickhouse://clickhouse:8123/streamvault', 'table-name' = 'qoe_1m' );

INSERT INTO qoe_minute
SELECT TUMBLE_END(ts, INTERVAL '1' MINUTE), country, device_type, cdn_pop,
       COUNT(*), SUM(rebuffer_ms), CAST(PERCENTILE_APPROX(join_time_ms, 0.95) AS INT), CAST(AVG(bitrate_kbps) AS INT)
FROM qoe_event GROUP BY TUMBLE(ts, INTERVAL '1' MINUTE), country, device_type, cdn_pop;
