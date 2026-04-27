# rating-service

Service in the social domain of StreamVault.

Language: Go Â· Port: 50261

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/rating-service/](../../../helm/charts/rating-service/) â€” Helm chart
- [manifests/social/rating-service/](../../../manifests/social/rating-service/) â€” Raw K8s manifests
