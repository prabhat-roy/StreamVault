# catalogue — StreamVault

VOD catalogue, search, collections, series/episode hierarchy.

| Service | Language | Port | Description |
|---|---|---|---|
| catalogue-service | kotlin | 50060 | VOD catalogue and metadata (MongoDB-backed) |
| search-service | kotlin | 50061 | Catalogue search (Elasticsearch) |
| collection-service | kotlin | 50062 | Curated collections, hubs, rows |
| episode-service | kotlin | 50063 | Series/season/episode hierarchy |
