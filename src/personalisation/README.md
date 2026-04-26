# personalisation — StreamVault

Recommendations (two-tower), continue-watching, trending, ML search ranking.

| Service | Language | Port | Description |
|---|---|---|---|
| recommendation-service | python | 50110 | Two-tower recommender serving |
| continue-watching | go | 50111 | Continue-watching list (Redis-backed) |
| trending-service | go | 50112 | Trending content computation |
| search-ranking | python | 50113 | ML search-ranking model serving |
