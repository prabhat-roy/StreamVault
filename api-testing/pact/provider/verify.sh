#!/usr/bin/env bash
set -euo pipefail
pact-provider-verifier https://pact-broker.streamvault.internal \
  --provider streamvault_identity_service \
  --provider-base-url http://identity-service.streamvault.svc:50060 \
  --provider-version "${GIT_SHA:-local}" \
  --publish-verification-results
