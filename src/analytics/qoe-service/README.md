# qoe-service

Service in the analytics domain of StreamVault.

Language: Go Â· Port: 50300

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/qoe-service/](../../../helm/charts/qoe-service/) â€” Helm chart
- [manifests/analytics/qoe-service/](../../../manifests/analytics/qoe-service/) â€” Raw K8s manifests
