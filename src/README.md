# Source Code — StreamVault

Backend services organised by business domain. Each domain has its own folder; each
service inside a domain has its own subfolder with a complete project layout
(Dockerfile, Makefile, `.env.example`, language-specific build file, source tree).

## Domains (17)

- [`platform/`](platform/) — gateway, web/mobile/tv/studio BFFs, GraphQL — 6 services
- [`ingest/`](ingest/) — content acquisition, metadata, rights, partner — 4 services
- [`media/`](media/) — transcoding, thumbnail, subtitle, audio — 4 services
- [`drm/`](drm/) — DRM, licence server, watermarking, forensic tracking — 4 services
- [`cdn/`](cdn/) — orchestrator, origin, edge cache, geo routing, ABR — 5 services
- [`live/`](live/) — live ingest, packager, DVR, low-latency, clipping — 5 services
- [`catalogue/`](catalogue/) — VOD catalogue, search, collection, episode — 4 services
- [`playback/`](playback/) — session, orchestrator, quality, ad insertion — 4 services
- [`subscription/`](subscription/) — subscription, plan, payment, trial, churn — 5 services
- [`creator/`](creator/) — upload, dashboard, analytics, revenue share — 4 services
- [`ad/`](ad/) — ad server, DAI, targeting, ad analytics, SSAI — 5 services
- [`personalisation/`](personalisation/) — recommendation, continue-watching, trending, ranking — 4 services
- [`social/`](social/) — watchlist, rating, comment, watch-party, clips — 5 services
- [`downloads/`](downloads/) — download, offline licence, sync, expiry — 4 services
- [`analytics/`](analytics/) — QoE, playback, engagement, revenue — 4 services
- [`communications/`](communications/) — orchestrator, email, push, sms, in-app — 5 services
- [`identity/`](identity/) — auth, user, profile, parental, MFA — 5 services

Total: **76 services** (the wider 205+ count includes infra components, edge workers,
and ML serving replicas).

## Conventions

- One folder per service; one main entry file per language (`main.go`, `Application.java`, `main.py`, etc.)
- Every service exposes `/healthz` returning `{ "status": "ok" }`
- Every service ships a `Dockerfile` (multi-stage, non-root, minimal base) and a `Makefile`
- gRPC contracts live in [`../proto/<domain>/<service>.proto`](../proto/)
- Kafka event schemas live in [`../events/`](../events/)

## Languages used

- **Go** (1.24): high-throughput stateless services (gateway, BFFs, CDN orchestrator, live ingest, telemetry)
- **Java 21 / Spring Boot 3.3**: subscription, billing, content rights, payouts
- **Kotlin / Spring Boot 3.3**: catalogue, search, personalisation API
- **Python 3.12 / FastAPI**: ML/AI services (recommendation, search ranking, churn, ad targeting, analytics)
- **Node.js 22 / Fastify**: real-time signalling (watch-party, comment), notification dispatchers
- **Rust 1.80 / Actix**: licence server, manifest manipulation, low-latency packager, edge cache, SSAI stitching
- **C++ 20 / FFmpeg**: media pipeline (transcoding, audio packaging) — see [`media/`](media/)
