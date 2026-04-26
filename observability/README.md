# Observability — StreamVault

```
observability/
├── prometheus/        Scrape config + alert rules (QoE, packager, DRM)
├── grafana/           Dashboards: QoE, concurrent streams, CDN hit rate, DRM licence rate
├── loki/              Log pipeline + LogQL alert rules
├── tempo/             Distributed traces — playback session end-to-end
├── otel/              OpenTelemetry collector for player + edge ingestion
├── alertmanager/      Routing + receivers (PagerDuty, Slack)
├── slo/               SLO definitions + error budgets (join time, rebuffer, availability)
└── pyroscope/         Continuous profiling for transcoding / packager
```

QoE telemetry (rebuffering ratio, startup time, bitrate switches, error rate) is
streamed from the player via OpenTelemetry → otel-collector → ClickHouse for OLAP.
