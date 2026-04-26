# GitOps — StreamVault

ArgoCD App-of-Apps, Argo Rollouts (canary + blue-green), Argo Workflows (CI workflows),
Argo Events (GitHub webhooks), Flux (alternative HelmRelease path).

```
gitops/
├── argocd/
│   ├── app-of-apps.yaml
│   ├── projects/streamvault.yaml
│   └── applicationsets/{streamvault-aws,streamvault-gcp,streamvault-azure}.yaml
├── argo-rollouts/
│   ├── analysis-template.yaml      ← Prometheus + QoE metrics gate
│   └── rollouts/<service>-rollout.yaml
├── argo-workflows/
│   ├── ci-build.yaml
│   └── domain-deploy.yaml
├── argo-events/
│   ├── eventsources/github.yaml
│   └── sensors/ci-trigger.yaml
└── flux/
    ├── streamvault-source.yaml
    └── streamvault-helmreleases.yaml
```

DRM, licence-server, live-ingest, stream-packager, and low-latency-service use
**blue-green** (rollouts pause traffic switch on QoE regression).
All other services use **canary** with QoE/rebuffer/join-time analysis gate.
