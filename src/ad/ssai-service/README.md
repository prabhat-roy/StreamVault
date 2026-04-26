# ssai-service

Service in the **ad** domain of StreamVault.

**Language:** Go · **Port:** 50224

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ssai-service/](../../../helm/charts/ssai-service/) — Helm chart
- [manifests/ad/ssai-service/](../../../manifests/ad/ssai-service/) — Raw K8s manifests
