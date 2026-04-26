# Kubernetes — StreamVault

Raw cluster-scoped manifests — namespaces, RBAC, NetworkPolicies, ResourceQuotas,
PDBs, KEDA scalers (Kafka lag + concurrent stream count), Velero backup schedules.

```
kubernetes/
├── namespaces/                One namespace per business domain
├── rbac/                      ClusterRoles for service-reader, platform-admin
├── network-policies/          default-deny-all + allow-istio-mesh + DRM service egress lock
├── resource-quotas/           Quota + LimitRange per namespace
├── pod-disruption-budgets/    PDBs for live + DRM + edge cache
├── keda/                      Kafka-lag scaler for notifications, concurrent-stream scaler for packager
└── velero/                    Daily snapshot schedule + DR restore plan
```
