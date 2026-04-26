# comment-service

Service in the **social** domain of StreamVault.

**Language:** Go · **Port:** 50262

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/comment-service/](../../../helm/charts/comment-service/) — Helm chart
- [manifests/social/comment-service/](../../../manifests/social/comment-service/) — Raw K8s manifests
