# Security — StreamVault

```
security/
├── vault/
│   ├── policies/        Vault HCL policies (drm-service can READ but not WRITE keys)
│   ├── auth/            Kubernetes auth method bound per-service via SA name
│   └── hsm/             PKCS#11 config — DRM master keys live in HSM
├── keycloak/            Realm + clients for subscriber SSO + studio SSO
├── opa/policies/        Conftest + Gatekeeper policies (manifest cache, DRM key egress, SSAI server-side)
├── kyverno/             Pod hardening + image signature verification
├── falco/               Runtime detection rules
├── trivy/               Image scanning config
├── cosign/              Keyless signing config + verification policy
├── spire/               Workload identity for service-to-service mTLS
└── cert-manager/        Let's Encrypt + private CA issuers
```

DRM master keys are provisioned in **HSM** (CloudHSM / Cloud HSM / Azure Dedicated HSM)
and addressed by Vault via PKCS#11. App services obtain ephemeral wrapping keys via
Vault Agent injection — they never see master key material.
