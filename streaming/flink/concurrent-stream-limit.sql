-- Flink SQL — enforce per-user concurrent stream limit in real time.
-- Reads playback.session.started / .ended from Kafka, joins with subscription
-- max_streams via Postgres lookup, emits LIMIT_EXCEEDED events when count > max.

CREATE TABLE playback_session (
  user_id    STRING,
  session_id STRING,
  event_type STRING,
  ts         TIMESTAMP_LTZ(3),
  WATERMARK FOR ts AS ts - INTERVAL '5' SECOND
) WITH ( 'connector' = 'kafka', 'topic' = 'playback.session.started', 'properties.bootstrap.servers' = 'kafka:9092',
         'scan.startup.mode' = 'earliest-offset', 'format' = 'avro' );

CREATE TABLE plan_lookup (
  user_id     STRING PRIMARY KEY NOT ENFORCED,
  max_streams INT
) WITH ( 'connector' = 'jdbc', 'url' = 'jdbc:postgresql://postgres-subscription:5432/subscription', 'table-name' = 'v_user_plan' );

CREATE TABLE limit_breach (
  user_id     STRING,
  active      BIGINT,
  max_streams INT,
  ts          TIMESTAMP_LTZ(3)
) WITH ( 'connector' = 'kafka', 'topic' = 'playback.limit.exceeded', 'properties.bootstrap.servers' = 'kafka:9092', 'format' = 'json' );

INSERT INTO limit_breach
SELECT s.user_id, COUNT(*) OVER w AS active, p.max_streams, s.ts
FROM playback_session s JOIN plan_lookup FOR SYSTEM_TIME AS OF s.ts AS p ON p.user_id = s.user_id
WINDOW w AS (PARTITION BY s.user_id ORDER BY s.ts ROWS BETWEEN INTERVAL '1' MINUTE PRECEDING AND CURRENT ROW)
HAVING COUNT(*) OVER w > p.max_streams;
