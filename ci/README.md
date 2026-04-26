# CI — StreamVault

Multi-system CI: Jenkins (primary), GitHub Actions, GitLab CI, Tekton.

```
ci/
├── jenkins/         Build / Security / Deploy Jenkinsfiles + agent pod
├── github-actions/  PR validation + multi-cloud deploy
├── gitlab-ci/       Kaniko build + Trivy + Cosign signing per service
└── tekton/          Cloud-agnostic Pipeline + helm-upgrade Task
```

All builds publish OCI artefacts to `harbor.streamvault.internal/streamvault/<svc>:<sha>`,
sign with Cosign keyless, and emit SBOMs (CycloneDX). DRM-related services additionally
run an OPA gate (`security/opa/policies/drm-key-no-log.rego`) to ensure no key material
is logged.
