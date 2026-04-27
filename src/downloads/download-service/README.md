# download-service

Service in the downloads domain of StreamVault.

Language: Go Â· Port: 50280

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/download-service/](../../../helm/charts/download-service/) â€” Helm chart
- [manifests/downloads/download-service/](../../../manifests/downloads/download-service/) â€” Raw K8s manifests
