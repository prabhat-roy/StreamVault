# quality-selector

Service in the **playback** domain of StreamVault.

**Language:** Go · **Port:** 50162

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/quality-selector/](../../../helm/charts/quality-selector/) — Helm chart
- [manifests/playback/quality-selector/](../../../manifests/playback/quality-selector/) — Raw K8s manifests
