# AI_PLAN.md â€” StreamVault (Media, OTT & Streaming Platform)

> Hierarchical AI/ML strategy. Reuses the Paperclip / OpenClaw / NemoClaw
> agent platform first defined in [ShopOS/AI.md](../ShopOS/AI.md). This file
> is the StreamVault-specific specialisation.

---

## 1. Why AI in StreamVault

OTT economics depend on three AI surfaces: personalisation, content
operations (transcode, moderation, captioning), and monetisation
(ads, churn). All three are now table-stakes.

- Recommendations â€” beyond simple two-tower; transformer rankers with
  diversity / freshness / business constraints.
- Content moderation â€” UGC + comments, multilingual, multi-modal.
- Transcription + dubbing + closed captions â€” at scale, in 40+ langs.
- Ad-targeting + dynamic ad insertion â€” privacy-respecting, on-device
  cohort signals.
- Encoding / bitrate ladder optimisation â€” VMAF-driven per-title.

DRM, content licensing geo-rules, GDPR / COPPA, accessibility (CVAA, EAA)
are the binding constraints.

---

## 2. Domain-Specific AI/ML Use Cases

| # | Use case | Domain | Model class | Latency budget |
|---|----------|--------|-------------|----------------|
| 1 | Personalised recommendations (home, row, you-might-like) | recommendations | Two-tower retrieval + transformer ranker + diversity rerank | <100 ms |
| 2 | Per-title encode optimisation (VMAF) | encoding, ops | Custom CV + LightGBM bitrate-ladder | per-asset |
| 3 | Auto-thumbnail / artwork selection | content-ops, marketing | CLIP + custom scorer + face-detection | <2 s/asset |
| 4 | Speech-to-text (transcription + captions) | accessibility, ops | Whisper-large-v3 + diarisation | near-real-time live, batch for VOD |
| 5 | Dub-friendly translation + voice cloning (consent only) | ops | Llama 3.1 + NLLB + XTTS | per-asset |
| 6 | Content moderation (UGC, comments, image, video) | trust-and-safety | RoBERTa + CLIP + custom video classifier | <300 ms |
| 7 | Churn prediction + win-back | growth, crm | LightGBM + GNN on family-plan graph | nightly |
| 8 | Ad-targeting + cohort modelling | ad-tech | Federated cohort + LightGBM | <50 ms |
| 9 | Dynamic ad insertion / SSAI signal AI | ad-tech | Sequence model on ad-pod yield | <100 ms |
| 10 | Highlight / chapter detection | content-ops | Temporal action segmentation + scene detection | per-asset |
| 11 | Genre + theme + mood tagging | catalogue | CLIP + multimodal LLM + taxonomy classifier | per-asset |
| 12 | Voice search / conversational discovery | discovery, tv | Whisper + Llama 3.1 70B + catalog RAG | <1 s |

---

## 3. Hierarchical Agent Architecture

Reuses OpenClaw / Paperclip / NemoClaw from `ShopOS/AI.md`.

### Tier 0 â€” Master Architect Agent

`stream-architect` â€” researches AI tooling, proposes services, on-boards
Tier-1 leads, weekly written report. Read-only on prod.

### Tier 1 â€” Division Leads (5)

| Agent | Scope |
|-------|-------|
| `stream-dev-lead`        | Backend/frontend service code |
| `stream-devops-lead`     | Helm, GitOps, infra, CI |
| `stream-devsecops-lead`  | OPA, Vault, Cilium, Falco, DRM, content licensing |
| `stream-dataml-lead`     | Feature store, training, drift, fairness |
| `stream-platform-lead`   | Cross-cutting (idempotency, saga, outbox), edge |

### Tier 2 â€” Specialist Agents

By language: Go, Java, Kotlin, Python, Node, Rust, C++ (codec),
TypeScript, Swift, Kotlin (Android), Dart.

By tool: PostgreSQL, MongoDB, Redis, Cassandra, ScyllaDB, ClickHouse,
TimescaleDB, Kafka, NATS, RabbitMQ, Pulsar, Vault, Keycloak, OPA,
Kyverno, Falco, Cilium, Istio, ArgoCD, Argo Workflows, Prometheus,
Grafana, Loki, Jaeger, OpenTelemetry, MinIO, Trivy, Cosign, Druid,
FFmpeg pipelines, Bento4, Shaka Packager, MediaMTX,
OvenMediaEngine, AV1 / SVT-AV1, VVenC (VVC), VMAF,
MPEG-DASH / HLS packaging, OpenFGA, Wazuh, Streamlink ingest,
OBS-NDI bridge.

By service â€” one agent per microservice (~195). Owns README,
OpenAPI, tests, CHANGELOG, deps, /healthz.

### Tier 3 â€” Ephemeral Workers

Spawned per encode job, per moderation backlog burst, per recommender
retraining slot.

### Lifecycle

Research â†’ Document â†’ Implement â†’ Test â†’ Review â†’ Deploy â†’ Monitor â†’
Respond â†’ Upgrade â†’ Report. Plus a license-region gate: agents
proposing taxonomy / catalog changes must respect content-licensing
geo-rules.

---

## 4. Separate AI Infrastructure

```
ai-platform/
â”œâ”€â”€ cluster: stream-ai-{aws,gcp,azure}    â† cloud GPU pool
â”œâ”€â”€ cluster: stream-ai-encode             â† dedicated H100/A100/L40 encode pool
â”œâ”€â”€ namespace: stream-ai-control           â† Paperclip
â”œâ”€â”€ namespace: stream-ai-agents            â† OpenClaw runtime
â”œâ”€â”€ namespace: stream-ai-sandbox           â† NemoClaw
â”œâ”€â”€ namespace: stream-ai-models            â† vLLM, Ollama, LiteLLM, Triton
â”œâ”€â”€ namespace: stream-ai-data              â† Qdrant, Weaviate, MinIO, MLflow
â”œâ”€â”€ namespace: stream-ai-obs               â† Langfuse, Phoenix
â””â”€â”€ namespace: stream-ai-pipelines         â† Argo Workflows
```

### Hardware

- Cloud inference: A10G/L4 for ranker + moderation; A100 for batch
  retraining.
- Encode pool: NVIDIA NVENC + L40 / A100 for high-throughput VOD.

### Software stack

Standard set + media stack listed in tool-agents above. Whisper-large-v3
for transcription, XTTS / Coqui for synthesised dubbing.

### Data isolation

- Per-region AI data planes (geo-licensing).
- Subscriber PII tokenised before LLM; vector DB sharded per region.
- DRM-protected content never enters LLM context window.

---

## 5. Compliance & Guardrails

| Control | Mechanism |
|---------|-----------|
| GDPR / CCPA / DPDP | PII tokenisation; right-to-erasure |
| COPPA / GDPR-K | Children's profiles excluded from personalised ads |
| Accessibility (CVAA, EAA, Section 508) | Captioning agent gates every VOD release |
| Content licensing | Region rules enforced by OPA on catalog AI outputs |
| Voice cloning | Only with verified consent; cryptographically signed consent record |
| DRM integrity | AI plane has no access to keys / encrypted essence |
| Moderation appeal | All AI moderation decisions appealable; humans review escalations |

---

## 6. Implementation Roadmap

| Month | Milestone |
|---------|-----------|
| 1 | `stream-ai-*` cluster up; vLLM Llama 3.1 70B; encode pool live |
| 2 | Paperclip + NemoClaw; Tier-0 architect live |
| 3 | Tier-1 leads; recommender v0 shadow |
| 4 | Per-language / per-tool Tier-2 agents |
| 5 | Per-service Tier-2 agents (recs â†’ encode â†’ moderation first) |
| 6 | Auto-captions for VOD in 8 langs; per-title encode v1 |
| 7 | Recommender v1; moderation v1 |
| 8 | Voice search pilot; multi-cloud failover drill |

---

## 7. Cost Envelope (target)

- Cloud infra: $7,000 â€“ $11,000 / month per primary cloud
- Encode pool: $3,500 â€“ $6,000 / month, scaling with VOD ingest
- No subscription LLM spend

---

## 8. Cross-References

- Master AI strategy: [ShopOS/AI.md](../ShopOS/AI.md)
- Same Paperclip/OpenClaw/NemoClaw platform across all 15 sibling projects.
