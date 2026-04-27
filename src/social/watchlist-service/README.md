# watchlist-service

Service in the social domain of StreamVault.

Language: Go Â· Port: 50260

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/watchlist-service/](../../../helm/charts/watchlist-service/) â€” Helm chart
- [manifests/social/watchlist-service/](../../../manifests/social/watchlist-service/) â€” Raw K8s manifests
