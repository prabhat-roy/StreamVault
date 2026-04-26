# targeting-service

Service in the **ad** domain of StreamVault.

**Language:** Go · **Port:** 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/targeting-service/](../../../helm/charts/targeting-service/) — Helm chart
- [manifests/ad/targeting-service/](../../../manifests/ad/targeting-service/) — Raw K8s manifests
