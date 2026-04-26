# playback-orchestrator

Service in the **playback** domain of StreamVault.

**Language:** Go · **Port:** 50161

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/playback-orchestrator/](../../../helm/charts/playback-orchestrator/) — Helm chart
- [manifests/playback/playback-orchestrator/](../../../manifests/playback/playback-orchestrator/) — Raw K8s manifests
