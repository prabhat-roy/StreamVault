# collection-service

Service in the catalogue domain of StreamVault.

Language: Go Â· Port: 50141

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/collection-service/](../../../helm/charts/collection-service/) â€” Helm chart
- [manifests/catalogue/collection-service/](../../../manifests/catalogue/collection-service/) â€” Raw K8s manifests
