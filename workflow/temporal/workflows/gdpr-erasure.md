# GDPR right-to-erasure workflow

Triggered when a user requests data deletion. Steps:

1. `VerifyIdentity` — re-auth via MFA
2. `LockAccount` — prevent further playback
3. `EraseFromPostgres` — pseudonymise user rows in subscription DB
4. `EraseFromMongo` — remove watchlists, comments, ratings
5. `EraseFromCassandra` — TTL playback events to expire within 24h
6. `EraseFromClickHouse` — drop rows by user_id partition
7. `EraseFromVectorDB` — delete user embedding from Weaviate
8. `RevokeDownloadLicences` — invalidate offline DRM licences
9. `EmitErasureCompleted` — Kafka identity.user.erased
10. `NotifyUser` — confirmation email
