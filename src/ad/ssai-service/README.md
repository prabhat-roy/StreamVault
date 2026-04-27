# ssai-service

Service in the ad domain of StreamVault.

Language: Go Â· Port: 50224

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/ssai-service/](../../../helm/charts/ssai-service/) â€” Helm chart
- [manifests/ad/ssai-service/](../../../manifests/ad/ssai-service/) â€” Raw K8s manifests
