# episode-service

Service in the **catalogue** domain of StreamVault.

**Language:** Go · **Port:** 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/episode-service/](../../../helm/charts/episode-service/) — Helm chart
- [manifests/catalogue/episode-service/](../../../manifests/catalogue/episode-service/) — Raw K8s manifests
