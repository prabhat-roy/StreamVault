# StreamVault â€” Enterprise OTT & Media Streaming Platform

Enterprise-grade, cloud-native over-the-top (OTT) media streaming platform built on open source
technologies. Covers the full media lifecycle â€” content acquisition, transcoding, DRM, CDN delivery,
live streaming, VOD, subscription management, personalised recommendations, and creator monetisation
â€” designed for broadcasters, streaming services, sports networks, and content aggregators operating
at Netflix/Disney+ scale.

---

## Overview

| Attribute         | Value                                                              |
|-------------------|--------------------------------------------------------------------|
| Type              | OTT Streaming Â· VOD Â· Live Broadcast Â· Creator Platform            |
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
    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
    â”‚                     Cloudflare Edge (WAF + CDN)                  â”‚
    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                                   â”‚
    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
    â”‚                        API Gateway                               â”‚
    â”‚          (OAuth2 Â· Rate Limit Â· DRM Token Â· Geo Routing)         â”‚
    â””â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
         â”‚              â”‚              â”‚                â”‚
  â”Œâ”€â”€â”€â”€â”€â”€â–¼â”€â”€â”    â”Œâ”€â”€â”€â”€â”€â”€â–¼â”€â”€â”   â”Œâ”€â”€â”€â”€â”€â”€â–¼â”€â”€â”     â”Œâ”€â”€â”€â”€â”€â”€â–¼â”€â”€â”
  â”‚ Web BFF â”‚    â”‚Mobile   â”‚   â”‚  TV BFF â”‚     â”‚Studio   â”‚
  â”‚(Next.js)â”‚    â”‚  BFF    â”‚   â”‚(Flutter)â”‚     â”‚  BFF    â”‚
  â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”˜    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”˜   â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”˜     â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”˜
         â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                                â”‚
    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
    â”‚                Internal gRPC Mesh (Istio mTLS)                 â”‚
    â”‚  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”  â”‚
    â”‚  â”‚ Catalogueâ”‚  â”‚  Playback  â”‚  â”‚   Live   â”‚  â”‚   Ad        â”‚  â”‚
    â”‚  â”‚ & Search â”‚  â”‚Orchestratorâ”‚  â”‚ Streamingâ”‚  â”‚  Server     â”‚  â”‚
    â”‚  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜  â”‚
    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
           â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
           â”‚                                   â”‚
  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â–¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”               â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â–¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
  â”‚  Media Pipeline  â”‚               â”‚   Kafka Event Bus      â”‚
  â”‚  (Transcoding    â”‚               â”‚  (Playback Â· QoE Â·     â”‚
  â”‚   FFmpeg + GPU)  â”‚               â”‚   Subscription events) â”‚
  â””â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜               â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
           â”‚                                   â”‚
  â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â–¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”               â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â–¼â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
  â”‚  Object Storage  â”‚               â”‚  Analytics Platform    â”‚
  â”‚  MinIO / S3 +    â”‚               â”‚  ClickHouse Â· Flink    â”‚
  â”‚  Cloudflare CDN  â”‚               â”‚  Airflow Â· Superset    â”‚
  â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜               â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## Tech Stack

### Streaming Standards & Protocols
- HLS: Apple HTTP Live Streaming â€” primary delivery protocol for iOS, tvOS, and web
- MPEG-DASH: Adaptive bitrate streaming for Android, Smart TVs, and web (DASH.js)
- CMAF: Common Media Application Format â€” low-latency streaming (sub-3 second glass-to-glass)
- ABR: Adaptive Bitrate â€” per-title encoding using VMAF quality score (FFmpeg + custom encoder)
- SCTE-35: Ad insertion cue markers in HLS/DASH streams (server-side ad insertion â€” SSAI)
- WebRTC: Ultra-low-latency live streaming (sports, auctions) â€” sub-500ms glass-to-glass

### DRM & Content Protection
- Widevine: Google DRM (Android, Chrome, Smart TVs) â€” L1 hardware security
- FairPlay: Apple DRM (iOS, macOS, tvOS, Safari)
- PlayReady: Microsoft DRM (Windows, Xbox, Edge)
- Multi-DRM: Unified licence server (Shaka Packager + custom licence proxy) â€” one key set, all DRM systems
- Forensic Watermarking: Invisible per-user watermark embedded in video stream (A/B segment watermarking)
- HDCP: Hardware-level content protection enforcement for connected TV apps

### Infrastructure
- Kubernetes: EKS (primary) + GKE â€” GPU node pools (NVIDIA T4/A10G) for ML-assisted encoding
- Transcoding: FFmpeg + MediaInfo; Kubernetes Jobs on Spot instances (80% cost saving vs. on-demand)
- Origin: Custom origin server (Go) â€” serves HLS/DASH manifests and segments from MinIO/S3
- Edge CDN: Cloudflare (global) + AWS CloudFront (backup) â€” 200+ PoPs, 99.9% cache hit rate
- Object Storage: MinIO (on-premise / self-hosted S3-compatible) + AWS S3 for cold content
- Real-time: NATS JetStream (playback session events, heartbeats â€” sub-10ms)

### CI/CD & GitOps
- CI: Jenkins (primary), GitHub Actions, GitLab CI, Tekton
- CD: ArgoCD (App-of-Apps), Argo Rollouts (canary with QoE monitoring as rollback signal)
- IaC: Terraform (EKS/GKE + CloudFront distributions + GPU node groups), Crossplane, Ansible
- Secrets: HashiCorp Vault (DRM licence keys, payment credentials) + External Secrets Operator
- Media IaC: AWS MediaConvert / custom FFmpeg cluster provisioned via Terraform

### Observability
- QoE Metrics: Rebuffering ratio, startup time, bitrate switches, error rate â€” streamed from player via OpenTelemetry
- Metrics: Prometheus + Grafana (concurrent streams, CDN hit rate, transcoding queue depth)
- Logs: Loki + Fluent Bit (playback error logs, DRM failures, ad fill rate)
- Traces: Jaeger + OTel (trace every playback session â€” manifest fetch â†’ segment fetch â†’ heartbeat)
- Real-time Dashboard: ClickHouse + Grafana â€” live concurrent viewers, geography, device breakdown
- SLOs: Startup time < 3s (P95), rebuffering ratio < 0.1%, availability 99.99%

### Security
- Identity: Keycloak (subscriber SSO + social login), parental PIN enforcement, COPPA age gate
- Token Security: Short-lived signed playback tokens (JWT, 60s TTL) â€” prevent URL sharing
- Network: Cloudflare WAF (DDoS protection), Cilium eBPF, Istio mTLS
- Scanning: Trivy, Semgrep, OWASP ZAP, SonarQube
- Policy: OPA/Gatekeeper, Kyverno, Falco

### AI / ML (Media Intelligence)
- Recommendations: Two-tower neural network (user embedding + content embedding) â€” served via Weaviate vector DB
- Content Tagging: Automated scene detection, object recognition, speech-to-text (Whisper) for searchable transcripts
- Per-Title Encoding: VMAF-driven bitrate ladder optimisation per content type (action vs. animation vs. documentary)
- Churn Prediction: Survival analysis on viewing patterns â€” triggers retention campaigns
- Ad Targeting: Contextual targeting from content metadata (no personal tracking â€” privacy-first)
- Thumbnail Optimisation: A/B test CTR on ML-generated thumbnail candidates

---

## Key Design Decisions

1. Per-title encoding: Each piece of content gets its own optimised bitrate ladder (VMAF score) â€” 40% bandwidth saving vs. fixed ladder, better quality at same bitrate
2. SSAI over CSAI: Server-side ad insertion (no ad blockers, seamless transitions, better QoE metrics)
3. CMAF for low-latency live: Single-format packaging (CMAF chunks) serves both HLS and DASH â€” halves storage cost; enables sub-3s latency for live sports
4. Forensic watermarking at edge: Watermark applied at CDN edge per request (A/B variant selection) â€” no per-user encode required
5. Stateless playback tokens: Licence server validates signed JWT per segment request â€” no session state, infinite horizontal scale
6. Spot instances for transcoding: All FFmpeg encoding runs on Kubernetes Jobs on EC2 Spot â€” 70% cost reduction; jobs are resumable on interruption via checkpoint

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
