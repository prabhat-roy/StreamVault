# Redis key patterns

| Pattern                                     | Purpose                          | TTL    |
|---------------------------------------------|----------------------------------|--------|
| `session:{user_id}:{session_id}`            | Playback session metadata        | 4h     |
| `recently_watched:{user_id}`                | Recently-watched list (LRU)      | 30d    |
| `continue_watching:{user_id}:{title_id}`    | Resume position (ms)             | 90d    |
| `concurrent_streams:{user_id}`              | Current concurrent stream count  | 5m     |
| `leaderboard:trending:{region}`             | Trending titles (sorted set)     | 1h     |
| `rate_limit:{ip}:{endpoint}`                | Per-IP rate limit counter        | 60s    |
| `playback_token_jti:{jti}`                  | One-time JWT replay protection   | 60s    |

> Never store DRM keys, content URLs, or user payment data in Redis.
