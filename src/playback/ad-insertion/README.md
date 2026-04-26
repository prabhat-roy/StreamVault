# ad-insertion

Service in the **playback** domain of StreamVault.

**Language:** Go · **Port:** 50163

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ad-insertion/](../../../helm/charts/ad-insertion/) — Helm chart
- [manifests/playback/ad-insertion/](../../../manifests/playback/ad-insertion/) — Raw K8s manifests
