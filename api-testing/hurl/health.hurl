# Health check for all critical services
GET https://streamvault.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"

GET https://api.streamvault.internal/healthz
HTTP 200
[Asserts]
jsonpath "$.status" == "ok"
