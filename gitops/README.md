# GitOps â€” StreamVault

ArgoCD App-of-Apps, Argo Rollouts (canary + blue-green), Argo Workflows (CI workflows),
Argo Events (GitHub webhooks), Flux (alternative HelmRelease path).

```
gitops/
â”œâ”€â”€ argocd/
â”‚   â”œâ”€â”€ app-of-apps.yaml
â”‚   â”œâ”€â”€ projects/streamvault.yaml
â”‚   â””â”€â”€ applicationsets/{streamvault-aws,streamvault-gcp,streamvault-azure}.yaml
â”œâ”€â”€ argo-rollouts/
â”‚   â”œâ”€â”€ analysis-template.yaml      â† Prometheus + QoE metrics gate
â”‚   â””â”€â”€ rollouts/<service>-rollout.yaml
â”œâ”€â”€ argo-workflows/
â”‚   â”œâ”€â”€ ci-build.yaml
â”‚   â””â”€â”€ domain-deploy.yaml
â”œâ”€â”€ argo-events/
â”‚   â”œâ”€â”€ eventsources/github.yaml
â”‚   â””â”€â”€ sensors/ci-trigger.yaml
â””â”€â”€ flux/
    â”œâ”€â”€ streamvault-source.yaml
    â””â”€â”€ streamvault-helmreleases.yaml
```

DRM, licence-server, live-ingest, stream-packager, and low-latency-service use
blue-green (rollouts pause traffic switch on QoE regression).
All other services use canary with QoE/rebuffer/join-time analysis gate.
