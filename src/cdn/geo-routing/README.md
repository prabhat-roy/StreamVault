# geo-routing

Service in the **cdn** domain of StreamVault.

**Language:** Go · **Port:** 50103

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/geo-routing/](../../../helm/charts/geo-routing/) — Helm chart
- [manifests/cdn/geo-routing/](../../../manifests/cdn/geo-routing/) — Raw K8s manifests
