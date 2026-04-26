# ad-server

Service in the **ad** domain of StreamVault.

**Language:** Go · **Port:** 50220

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ad-server/](../../../helm/charts/ad-server/) — Helm chart
- [manifests/ad/ad-server/](../../../manifests/ad/ad-server/) — Raw K8s manifests
