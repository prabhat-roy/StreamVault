"""Two-tower recommendation model.

User tower: dense features (watch-time, country one-hot, completion rate) →
            embedding(d=128).
Title tower: dense + categorical (genre, language, duration bucket) →
             embedding(d=128).
Score: cosine similarity. Trained with sampled-softmax on positive pairs from
playback completions. Negatives sampled from in-batch + random.
"""
from __future__ import annotations
import torch
import torch.nn as nn

EMBED_DIM = 128

class UserTower(nn.Module):
    def __init__(self, n_countries: int, n_genres: int):
        super().__init__()
        self.country = nn.Embedding(n_countries, 16)
        self.genre   = nn.Embedding(n_genres, 16)
        self.dense   = nn.Sequential(
            nn.Linear(2 + 32, 256), nn.ReLU(),
            nn.Linear(256, EMBED_DIM),
        )

    def forward(self, watch_time, completion_rate, country_idx, fav_genre_idx):
        cat = torch.cat([self.country(country_idx), self.genre(fav_genre_idx)], dim=-1)
        x = torch.cat([watch_time.unsqueeze(-1), completion_rate.unsqueeze(-1), cat], dim=-1)
        emb = self.dense(x)
        return nn.functional.normalize(emb, dim=-1)


class TitleTower(nn.Module):
    def __init__(self, n_genres: int, n_languages: int):
        super().__init__()
        self.genre    = nn.Embedding(n_genres, 16)
        self.language = nn.Embedding(n_languages, 16)
        self.dense = nn.Sequential(
            nn.Linear(2 + 32, 256), nn.ReLU(),
            nn.Linear(256, EMBED_DIM),
        )

    def forward(self, popularity, duration_min, genre_idx, language_idx):
        cat = torch.cat([self.genre(genre_idx), self.language(language_idx)], dim=-1)
        x = torch.cat([popularity.unsqueeze(-1), duration_min.unsqueeze(-1), cat], dim=-1)
        emb = self.dense(x)
        return nn.functional.normalize(emb, dim=-1)
