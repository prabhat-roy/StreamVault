# abr-service

Service in the cdn domain of StreamVault.

Language: Go Â· Port: 50104

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/abr-service/](../../../helm/charts/abr-service/) â€” Helm chart
- [manifests/cdn/abr-service/](../../../manifests/cdn/abr-service/) â€” Raw K8s manifests
