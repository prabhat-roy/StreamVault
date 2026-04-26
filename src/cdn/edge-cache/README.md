# edge-cache

Service in the **cdn** domain of StreamVault.

**Language:** Go · **Port:** 50102

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/edge-cache/](../../../helm/charts/edge-cache/) — Helm chart
- [manifests/cdn/edge-cache/](../../../manifests/cdn/edge-cache/) — Raw K8s manifests
