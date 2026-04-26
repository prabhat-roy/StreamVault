# creator — StreamVault

Creator/studio platform: uploads, dashboard, analytics, revenue share.

| Service | Language | Port | Description |
|---|---|---|---|
| upload-service | go | 50090 | Resumable uploads (TUS protocol) for creators |
| studio-dashboard | go | 50091 | Creator dashboard backend |
| analytics-creator | python | 50092 | Creator analytics (views, watch-time, revenue) |
| revenue-share | java | 50093 | Creator payout calculation |
