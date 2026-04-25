# StreamVault — Enterprise OTT & Media Streaming Platform

Enterprise-grade, cloud-native over-the-top (OTT) media streaming platform built on open source
technologies. Covers the full media lifecycle — content acquisition, transcoding, DRM, CDN delivery,
live streaming, VOD, subscription management, personalised recommendations, and creator monetisation
— designed for broadcasters, streaming services, sports networks, and content aggregators operating
at Netflix/Disney+ scale.

---

## Overview

| Attribute         | Value                                                              |
|-------------------|--------------------------------------------------------------------|
| Type              | OTT Streaming · VOD · Live Broadcast · Creator Platform            |
| Domains           | 17 business domains                                                |
| Services          | 205+ microservices                                                 |
| Languages         | Go, Python, Java, Kotlin, Rust, Node.js, C++ (media pipeline), TypeScript |
| Standards         | HLS, DASH (MPEG-DASH), CMAF, DRM (Widevine, FairPlay, PlayReady), SCTE-35 |
| Compliance        | GDPR, COPPA, DMCA, WCAG 2.1 AA, Ofcom / FCC broadcast regulations |
| Databases         | PostgreSQL, MongoDB, Redis, Cassandra, Elasticsearch, ClickHouse   |
| Message Broker    | Apache Kafka, NATS JetStream, RabbitMQ                             |
| Cloud             | AWS (primary), GCP, Cloudflare (CDN + edge)                        |
| Orchestration     | Kubernetes (EKS / GKE) + Spot instances for transcoding workloads  |
| Frontend          | Next.js (web player), React Native (mobile), Flutter (TV app), Angular (studio portal) |

---

## Business Domains

| # | Domain                   | Key Services                                                            |
|---|--------------------------|-------------------------------------------------------------------------|
| 1 | Content Acquisition      | ingest-service, metadata-service, rights-management, content-partner    |
| 2 | Media Processing         | transcoding-service, thumbnail-service, subtitle-service, audio-service |
| 3 | DRM & Content Protection | drm-service, licence-server, watermarking-service, forensic-tracker     |
| 4 | CDN & Delivery           | cdn-orchestrator, origin-service, edge-cache, geo-routing, abr-service  |
| 5 | Live Streaming           | live-ingest, stream-packager, dvr-service, low-latency-service, clipping|
| 6 | VOD & Catalogue          | catalogue-service, search-service, collection-service, episode-service  |
| 7 | Player & Playback        | session-service, playback-orchestrator, quality-selector, ad-insertion  |
| 8 | Subscription & Billing   | subscription-service, plan-service, payment-gateway, trial, churn       |
| 9 | Creator & Studio         | upload-service, studio-dashboard, analytics-creator, revenue-share      |
| 10 | Advertising              | ad-server, dai-service, targeting-service, ad-analytics, ssai-service   |
| 11 | Personalisation & AI     | recommendation-service, continue-watching, trending, search-ranking     |
| 12 | Social & Engagement      | watchlist, rating-service, comment-service, watch-party, clips-sharing  |
| 13 | Downloads & Offline      | download-service, offline-licence, sync-service, expiry-manager         |
| 14 | Analytics & QoE          | qoe-service, playback-analytics, engagement-analytics, revenue-analytics|
| 15 | Communications           | notification-orchestrator, email, push, sms, in-app-message             |
| 16 | Identity & Access        | auth-service, user-service, profile-service, parental-controls, mfa     |
| 17 | Platform                 | api-gateway, web-bff, mobile-bff, tv-bff, graphql-gateway               |

---

## Architecture

```
    ┌──────────────────────────────────────────────────────────────────┐
    │                     Cloudflare Edge (WAF + CDN)                  │
    └──────────────────────────────┬───────────────────────────────────┘
                                   │
    ┌──────────────────────────────▼───────────────────────────────────┐
    │                        API Gateway                               │
    │          (OAuth2 · Rate Limit · DRM Token · Geo Routing)         │
    └────┬──────────────┬──────────────┬────────────────┬──────────────┘
         │              │              │                │
  ┌──────▼──┐    ┌──────▼──┐   ┌──────▼──┐     ┌──────▼──┐
  │ Web BFF │    │Mobile   │   │  TV BFF │     │Studio   │
  │(Next.js)│    │  BFF    │   │(Flutter)│     │  BFF    │
  └──────┬──┘    └──────┬──┘   └──────┬──┘     └──────┬──┘
         └──────────────┴──────────────┴────────────────┘
                                │
    ┌───────────────────────────▼────────────────────────────────────┐
    │                Internal gRPC Mesh (Istio mTLS)                 │
    │  ┌──────────┐  ┌────────────┐  ┌──────────┐  ┌─────────────┐  │
    │  │ Catalogue│  │  Playback  │  │   Live   │  │   Ad        │  │
    │  │ & Search │  │Orchestrator│  │ Streaming│  │  Server     │  │
    │  └──────────┘  └────────────┘  └──────────┘  └─────────────┘  │
    └──────────────────────┬─────────────────────────────────────────┘
                           │
           ┌───────────────┴───────────────────┐
           │                                   │
  ┌────────▼─────────┐               ┌─────────▼──────────────┐
  │  Media Pipeline  │               │   Kafka Event Bus      │
  │  (Transcoding    │               │  (Playback · QoE ·     │
  │   FFmpeg + GPU)  │               │   Subscription events) │
  └────────┬─────────┘               └─────────┬──────────────┘
           │                                   │
  ┌────────▼─────────┐               ┌─────────▼──────────────┐
  │  Object Storage  │               │  Analytics Platform    │
  │  MinIO / S3 +    │               │  ClickHouse · Flink    │
  │  Cloudflare CDN  │               │  Airflow · Superset    │
  └──────────────────┘               └────────────────────────┘
```

---

## Tech Stack

### Streaming Standards & Protocols
- **HLS**: Apple HTTP Live Streaming — primary delivery protocol for iOS, tvOS, and web
- **MPEG-DASH**: Adaptive bitrate streaming for Android, Smart TVs, and web (DASH.js)
- **CMAF**: Common Media Application Format — low-latency streaming (sub-3 second glass-to-glass)
- **ABR**: Adaptive Bitrate — per-title encoding using VMAF quality score (FFmpeg + custom encoder)
- **SCTE-35**: Ad insertion cue markers in HLS/DASH streams (server-side ad insertion — SSAI)
- **WebRTC**: Ultra-low-latency live streaming (sports, auctions) — sub-500ms glass-to-glass

### DRM & Content Protection
- **Widevine**: Google DRM (Android, Chrome, Smart TVs) — L1 hardware security
- **FairPlay**: Apple DRM (iOS, macOS, tvOS, Safari)
- **PlayReady**: Microsoft DRM (Windows, Xbox, Edge)
- **Multi-DRM**: Unified licence server (Shaka Packager + custom licence proxy) — one key set, all DRM systems
- **Forensic Watermarking**: Invisible per-user watermark embedded in video stream (A/B segment watermarking)
- **HDCP**: Hardware-level content protection enforcement for connected TV apps

### Infrastructure
- **Kubernetes**: EKS (primary) + GKE — GPU node pools (NVIDIA T4/A10G) for ML-assisted encoding
- **Transcoding**: FFmpeg + MediaInfo; Kubernetes Jobs on Spot instances (80% cost saving vs. on-demand)
- **Origin**: Custom origin server (Go) — serves HLS/DASH manifests and segments from MinIO/S3
- **Edge CDN**: Cloudflare (global) + AWS CloudFront (backup) — 200+ PoPs, 99.9% cache hit rate
- **Object Storage**: MinIO (on-premise / self-hosted S3-compatible) + AWS S3 for cold content
- **Real-time**: NATS JetStream (playback session events, heartbeats — sub-10ms)

### CI/CD & GitOps
- **CI**: Jenkins (primary), GitHub Actions, GitLab CI, Tekton
- **CD**: ArgoCD (App-of-Apps), Argo Rollouts (canary with QoE monitoring as rollback signal)
- **IaC**: Terraform (EKS/GKE + CloudFront distributions + GPU node groups), Crossplane, Ansible
- **Secrets**: HashiCorp Vault (DRM licence keys, payment credentials) + External Secrets Operator
- **Media IaC**: AWS MediaConvert / custom FFmpeg cluster provisioned via Terraform

### Observability
- **QoE Metrics**: Rebuffering ratio, startup time, bitrate switches, error rate — streamed from player via OpenTelemetry
- **Metrics**: Prometheus + Grafana (concurrent streams, CDN hit rate, transcoding queue depth)
- **Logs**: Loki + Fluent Bit (playback error logs, DRM failures, ad fill rate)
- **Traces**: Jaeger + OTel (trace every playback session — manifest fetch → segment fetch → heartbeat)
- **Real-time Dashboard**: ClickHouse + Grafana — live concurrent viewers, geography, device breakdown
- **SLOs**: Startup time < 3s (P95), rebuffering ratio < 0.1%, availability 99.99%

### Security
- **Identity**: Keycloak (subscriber SSO + social login), parental PIN enforcement, COPPA age gate
- **Token Security**: Short-lived signed playback tokens (JWT, 60s TTL) — prevent URL sharing
- **Network**: Cloudflare WAF (DDoS protection), Cilium eBPF, Istio mTLS
- **Scanning**: Trivy, Semgrep, OWASP ZAP, SonarQube
- **Policy**: OPA/Gatekeeper, Kyverno, Falco

### AI / ML (Media Intelligence)
- **Recommendations**: Two-tower neural network (user embedding + content embedding) — served via Weaviate vector DB
- **Content Tagging**: Automated scene detection, object recognition, speech-to-text (Whisper) for searchable transcripts
- **Per-Title Encoding**: VMAF-driven bitrate ladder optimisation per content type (action vs. animation vs. documentary)
- **Churn Prediction**: Survival analysis on viewing patterns — triggers retention campaigns
- **Ad Targeting**: Contextual targeting from content metadata (no personal tracking — privacy-first)
- **Thumbnail Optimisation**: A/B test CTR on ML-generated thumbnail candidates

---

## Key Design Decisions

1. **Per-title encoding**: Each piece of content gets its own optimised bitrate ladder (VMAF score) — 40% bandwidth saving vs. fixed ladder, better quality at same bitrate
2. **SSAI over CSAI**: Server-side ad insertion (no ad blockers, seamless transitions, better QoE metrics)
3. **CMAF for low-latency live**: Single-format packaging (CMAF chunks) serves both HLS and DASH — halves storage cost; enables sub-3s latency for live sports
4. **Forensic watermarking at edge**: Watermark applied at CDN edge per request (A/B variant selection) — no per-user encode required
5. **Stateless playback tokens**: Licence server validates signed JWT per segment request — no session state, infinite horizontal scale
6. **Spot instances for transcoding**: All FFmpeg encoding runs on Kubernetes Jobs on EC2 Spot — 70% cost reduction; jobs are resumable on interruption via checkpoint

---

## Status

- [ ] Architecture design & streaming pipeline
- [ ] Service registry & proto definitions
- [ ] FFmpeg transcoding pipeline (HLS + DASH)
- [ ] DRM licence server (Widevine + FairPlay + PlayReady)
- [ ] Service skeletons (healthz, metrics, graceful shutdown)
- [ ] Docker Compose (local dev stack)
- [ ] Helm charts (per-service)
- [ ] CI/CD pipelines
- [ ] GitOps (ArgoCD)
- [ ] CDN configuration (Cloudflare + CloudFront)
- [ ] AI recommendation engine
