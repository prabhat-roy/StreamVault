# continue-watching

Service in the personalisation domain of StreamVault.

Language: Go Â· Port: 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` â€” health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/continue-watching/](../../../helm/charts/continue-watching/) â€” Helm chart
- [manifests/personalisation/continue-watching/](../../../manifests/personalisation/continue-watching/) â€” Raw K8s manifests
