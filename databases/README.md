# Databases — StreamVault

```
databases/
├── postgres/        Subscription, billing, user data — Flyway migrations
├── mongodb/         Catalogue (rich nested metadata, posters, languages)
├── redis/           Session, recently watched, leaderboards, rate limit
├── cassandra/       Playback events + view history (billions of rows)
├── elasticsearch/   Catalogue full-text search
├── clickhouse/      QoE / engagement / ad analytics OLAP
└── weaviate/        Vector DB for two-tower recommendation embeddings
```

> DRM keys live ONLY in Vault HSM. They are NEVER stored in any of the databases above.
