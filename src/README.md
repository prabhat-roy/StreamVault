# Source Code â€” StreamVault

Backend services organised by business domain. Each domain has its own folder; each
service inside a domain has its own subfolder with a complete project layout
(Dockerfile, Makefile, `.env.example`, language-specific build file, source tree).

## Domains (17)

- [`platform/`](platform/) â€” gateway, web/mobile/tv/studio BFFs, GraphQL â€” 6 services
- [`ingest/`](ingest/) â€” content acquisition, metadata, rights, partner â€” 4 services
- [`media/`](media/) â€” transcoding, thumbnail, subtitle, audio â€” 4 services
- [`drm/`](drm/) â€” DRM, licence server, watermarking, forensic tracking â€” 4 services
- [`cdn/`](cdn/) â€” orchestrator, origin, edge cache, geo routing, ABR â€” 5 services
- [`live/`](live/) â€” live ingest, packager, DVR, low-latency, clipping â€” 5 services
- [`catalogue/`](catalogue/) â€” VOD catalogue, search, collection, episode â€” 4 services
- [`playback/`](playback/) â€” session, orchestrator, quality, ad insertion â€” 4 services
- [`subscription/`](subscription/) â€” subscription, plan, payment, trial, churn â€” 5 services
- [`creator/`](creator/) â€” upload, dashboard, analytics, revenue share â€” 4 services
- [`ad/`](ad/) â€” ad server, DAI, targeting, ad analytics, SSAI â€” 5 services
- [`personalisation/`](personalisation/) â€” recommendation, continue-watching, trending, ranking â€” 4 services
- [`social/`](social/) â€” watchlist, rating, comment, watch-party, clips â€” 5 services
- [`downloads/`](downloads/) â€” download, offline licence, sync, expiry â€” 4 services
- [`analytics/`](analytics/) â€” QoE, playback, engagement, revenue â€” 4 services
- [`communications/`](communications/) â€” orchestrator, email, push, sms, in-app â€” 5 services
- [`identity/`](identity/) â€” auth, user, profile, parental, MFA â€” 5 services

Total: 76 services (the wider 205+ count includes infra components, edge workers,
and ML serving replicas).

## Conventions

- One folder per service; one main entry file per language (`main.go`, `Application.java`, `main.py`, etc.)
- Every service exposes `/healthz` returning `{ "status": "ok" }`
- Every service ships a `Dockerfile` (multi-stage, non-root, minimal base) and a `Makefile`
- gRPC contracts live in [`../proto/<domain>/<service>.proto`](../proto/)
- Kafka event schemas live in [`../events/`](../events/)

## Languages used

- Go (1.24): high-throughput stateless services (gateway, BFFs, CDN orchestrator, live ingest, telemetry)
- Java 21 / Spring Boot 3.3: subscription, billing, content rights, payouts
- Kotlin / Spring Boot 3.3: catalogue, search, personalisation API
- Python 3.12 / FastAPI: ML/AI services (recommendation, search ranking, churn, ad targeting, analytics)
- Node.js 22 / Fastify: real-time signalling (watch-party, comment), notification dispatchers
- Rust 1.80 / Actix: licence server, manifest manipulation, low-latency packager, edge cache, SSAI stitching
- C++ 20 / FFmpeg: media pipeline (transcoding, audio packaging) â€” see [`media/`](media/)
