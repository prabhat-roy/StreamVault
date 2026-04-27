# Security â€” StreamVault

```
security/
â”œâ”€â”€ vault/
â”‚   â”œâ”€â”€ policies/        Vault HCL policies (drm-service can READ but not WRITE keys)
â”‚   â”œâ”€â”€ auth/            Kubernetes auth method bound per-service via SA name
â”‚   â””â”€â”€ hsm/             PKCS#11 config â€” DRM master keys live in HSM
â”œâ”€â”€ keycloak/            Realm + clients for subscriber SSO + studio SSO
â”œâ”€â”€ opa/policies/        Conftest + Gatekeeper policies (manifest cache, DRM key egress, SSAI server-side)
â”œâ”€â”€ kyverno/             Pod hardening + image signature verification
â”œâ”€â”€ falco/               Runtime detection rules
â”œâ”€â”€ trivy/               Image scanning config
â”œâ”€â”€ cosign/              Keyless signing config + verification policy
â”œâ”€â”€ spire/               Workload identity for service-to-service mTLS
â””â”€â”€ cert-manager/        Let's Encrypt + private CA issuers
```

DRM master keys are provisioned in HSM (CloudHSM / Cloud HSM / Azure Dedicated HSM)
and addressed by Vault via PKCS#11. App services obtain ephemeral wrapping keys via
Vault Agent injection â€” they never see master key material.
