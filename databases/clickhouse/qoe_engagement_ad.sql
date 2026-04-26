-- ClickHouse schema for QoE / engagement / ad OLAP — fed from Kafka via Materialized Views.

CREATE DATABASE IF NOT EXISTS streamvault;

-- Raw playback events ingested from Kafka topic playback.heartbeat
CREATE TABLE IF NOT EXISTS streamvault.playback_event_raw
(
    ts            DateTime64(3),
    session_id    UUID,
    user_id       UUID,
    title_id      String,
    event_type    LowCardinality(String),
    position_ms   UInt64,
    bitrate_kbps  Nullable(UInt32),
    rebuffer_ms   Nullable(UInt32),
    join_time_ms  Nullable(UInt32),
    device_type   LowCardinality(String),
    drm_system    LowCardinality(String),
    cdn_pop       LowCardinality(String),
    country       LowCardinality(String)
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(ts)
ORDER BY (ts, user_id, session_id)
TTL toDate(ts) + INTERVAL 180 DAY;

-- 1-minute QoE rollup
CREATE MATERIALIZED VIEW IF NOT EXISTS streamvault.qoe_1m
ENGINE = SummingMergeTree
PARTITION BY toYYYYMMDD(minute)
ORDER BY (minute, country, device_type, cdn_pop)
AS SELECT
    toStartOfMinute(ts) AS minute,
    country, device_type, cdn_pop,
    count()                 AS events,
    sum(rebuffer_ms)        AS rebuffer_ms,
    avg(bitrate_kbps)       AS avg_bitrate,
    quantileTDigest(0.95)(join_time_ms) AS p95_join_time_ms
FROM streamvault.playback_event_raw GROUP BY minute, country, device_type, cdn_pop;

-- Ad impressions (SSAI server-side stitching events)
CREATE TABLE IF NOT EXISTS streamvault.ad_impression
(
    ts          DateTime64(3),
    session_id  UUID,
    user_id     UUID,
    title_id    String,
    ad_id       String,
    creative_id String,
    advertiser  LowCardinality(String),
    duration_ms UInt32,
    completed   UInt8,
    revenue_cents UInt32,
    country     LowCardinality(String)
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(ts)
ORDER BY (ts, advertiser);

-- Engagement (rating, watchlist, share)
CREATE TABLE IF NOT EXISTS streamvault.engagement_event
(
    ts           DateTime64(3),
    user_id      UUID,
    title_id     String,
    event_type   LowCardinality(String),  -- RATED | ADDED_TO_WATCHLIST | SHARED | COMMENTED
    rating       Nullable(UInt8)
)
ENGINE = MergeTree
PARTITION BY toYYYYMMDD(ts)
ORDER BY (ts, user_id);
