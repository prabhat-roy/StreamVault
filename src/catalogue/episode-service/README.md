# episode-service

Service in the catalogue domain of StreamVault.

Language: Go Â· Port: 50142

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/episode-service/](../../../helm/charts/episode-service/) â€” Helm chart
- [manifests/catalogue/episode-service/](../../../manifests/catalogue/episode-service/) â€” Raw K8s manifests
