# cdn-orchestrator

Service in the **cdn** domain of StreamVault.

**Language:** Go · **Port:** 50100

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/cdn-orchestrator/](../../../helm/charts/cdn-orchestrator/) — Helm chart
- [manifests/cdn/cdn-orchestrator/](../../../manifests/cdn/cdn-orchestrator/) — Raw K8s manifests
