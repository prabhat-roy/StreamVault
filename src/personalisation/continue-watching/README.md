# continue-watching

Service in the **personalisation** domain of StreamVault.

**Language:** Go · **Port:** 50241

## Run locally

```bash
make run
```

## Endpoints

- `GET /healthz` — health check, returns `{ "status": "ok" }`

## See also

- [helm/charts/continue-watching/](../../../helm/charts/continue-watching/) — Helm chart
- [manifests/personalisation/continue-watching/](../../../manifests/personalisation/continue-watching/) — Raw K8s manifests
