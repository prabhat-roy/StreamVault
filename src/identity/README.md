# identity — StreamVault

Subscriber identity & access: OIDC auth, user/profile, parental controls, MFA.

| Service | Language | Port | Description |
|---|---|---|---|
| auth-service | rust | 50160 | OIDC auth, social login, token issuance |
| user-service | java | 50161 | Subscriber profile and account |
| profile-service | java | 50162 | Per-account multi-profile (kids, adults) |
| parental-controls | java | 50163 | Parental PIN, age gating, COPPA |
| mfa-service | go | 50164 | MFA / TOTP / WebAuthn |
