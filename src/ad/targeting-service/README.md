# targeting-service

Service in the ad domain of StreamVault.

Language: Go Â· Port: 50222

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/targeting-service/](../../../helm/charts/targeting-service/) â€” Helm chart
- [manifests/ad/targeting-service/](../../../manifests/ad/targeting-service/) â€” Raw K8s manifests
