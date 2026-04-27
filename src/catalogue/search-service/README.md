# search-service

Service in the catalogue domain of StreamVault.

Language: Go Â· Port: 50140

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/search-service/](../../../helm/charts/search-service/) â€” Helm chart
- [manifests/catalogue/search-service/](../../../manifests/catalogue/search-service/) â€” Raw K8s manifests
