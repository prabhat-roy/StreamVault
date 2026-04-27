# low-latency-service

Service in the live domain of StreamVault.

Language: Go Â· Port: 50123

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/low-latency-service/](../../../helm/charts/low-latency-service/) â€” Helm chart
- [manifests/live/low-latency-service/](../../../manifests/live/low-latency-service/) â€” Raw K8s manifests
