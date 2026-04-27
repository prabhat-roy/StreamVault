# dvr-service

Service in the live domain of StreamVault.

Language: Go Â· Port: 50122

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/dvr-service/](../../../helm/charts/dvr-service/) â€” Helm chart
- [manifests/live/dvr-service/](../../../manifests/live/dvr-service/) â€” Raw K8s manifests
