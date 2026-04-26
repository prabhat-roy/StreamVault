-- Cassandra schema for playback events (billions of rows).
-- Partition by user_id+day for efficient resume queries; cluster by ts DESC.

CREATE KEYSPACE IF NOT EXISTS streamvault_playback
  WITH REPLICATION = { 'class': 'NetworkTopologyStrategy', 'us-east-1': 3, 'eu-west-1': 3 };

CREATE TABLE IF NOT EXISTS streamvault_playback.event (
  user_id      UUID,
  bucket_day   DATE,           -- partition key suffix to bound row width
  ts           TIMESTAMP,
  session_id   UUID,
  title_id     TEXT,
  event_type   TEXT,           -- START | HEARTBEAT | PAUSE | RESUME | SEEK | BITRATE_SWITCH | END | ERROR
  position_ms  BIGINT,
  bitrate_kbps INT,
  rebuffer_ms  INT,
  device_type  TEXT,
  drm_system   TEXT,
  cdn_pop      TEXT,
  PRIMARY KEY ((user_id, bucket_day), ts, session_id)
) WITH CLUSTERING ORDER BY (ts DESC, session_id ASC)
  AND compaction = { 'class': 'TimeWindowCompactionStrategy', 'compaction_window_size': 1, 'compaction_window_unit': 'DAYS' }
  AND default_time_to_live = 7776000;  -- 90 days

CREATE TABLE IF NOT EXISTS streamvault_playback.session_summary (
  user_id      UUID,
  session_id   UUID,
  started_at   TIMESTAMP,
  ended_at     TIMESTAMP,
  title_id     TEXT,
  watched_ms   BIGINT,
  rebuffer_ms  BIGINT,
  avg_bitrate  INT,
  device_type  TEXT,
  PRIMARY KEY (user_id, session_id)
);
