# dvr-service

Service in the **live** domain of StreamVault.

**Language:** Go · **Port:** 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dvr-service/](../../../helm/charts/dvr-service/) — Helm chart
- [manifests/live/dvr-service/](../../../manifests/live/dvr-service/) — Raw K8s manifests
