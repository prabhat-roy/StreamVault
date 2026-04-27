# upload-service

Service in the creator domain of StreamVault.

Language: Go Â· Port: 50200

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/upload-service/](../../../helm/charts/upload-service/) â€” Helm chart
- [manifests/creator/upload-service/](../../../manifests/creator/upload-service/) â€” Raw K8s manifests
