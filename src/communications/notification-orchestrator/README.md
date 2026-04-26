# notification-orchestrator

Service in the **communications** domain of StreamVault.

**Language:** Go · **Port:** 50320

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/notification-orchestrator/](../../../helm/charts/notification-orchestrator/) — Helm chart
- [manifests/communications/notification-orchestrator/](../../../manifests/communications/notification-orchestrator/) — Raw K8s manifests
