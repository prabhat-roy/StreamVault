# ingest — StreamVault

Content acquisition: mezzanine intake, metadata enrichment, rights/windowing, partner onboarding.

| Service | Language | Port | Description |
|---|---|---|---|
| ingest-service | go | 50010 | Content acquisition orchestrator (mezzanine intake) |
| metadata-service | kotlin | 50011 | Catalogue metadata enrichment (TMDB, IMDb, partner feeds) |
| rights-management | java | 50012 | Content rights, windowing, territory restrictions |
| content-partner | java | 50013 | Studio/partner onboarding and contracts |
