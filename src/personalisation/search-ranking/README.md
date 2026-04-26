# search-ranking

Service in the **personalisation** domain of StreamVault.

**Language:** Go · **Port:** 50243

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/search-ranking/](../../../helm/charts/search-ranking/) — Helm chart
- [manifests/personalisation/search-ranking/](../../../manifests/personalisation/search-ranking/) — Raw K8s manifests
