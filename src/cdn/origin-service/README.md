# origin-service

Service in the cdn domain of StreamVault.

Language: Go Â· Port: 50101

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/origin-service/](../../../helm/charts/origin-service/) â€” Helm chart
- [manifests/cdn/origin-service/](../../../manifests/cdn/origin-service/) â€” Raw K8s manifests
