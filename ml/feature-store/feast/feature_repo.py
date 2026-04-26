from datetime import timedelta
from feast import Entity, FeatureView, Field, ValueType
from feast.types import Float32, Int64, String

user = Entity(name="user_id", value_type=ValueType.STRING)
title = Entity(name="title_id", value_type=ValueType.STRING)

user_features = FeatureView(
    name="user_features",
    entities=[user],
    ttl=timedelta(days=30),
    schema=[
        Field(name="watch_time_30d_min", dtype=Int64),
        Field(name="completion_rate_30d", dtype=Float32),
        Field(name="country", dtype=String),
        Field(name="favourite_genre", dtype=String),
        Field(name="rebuffer_p95_ms", dtype=Int64),
    ],
)

title_features = FeatureView(
    name="title_features",
    entities=[title],
    ttl=timedelta(days=365),
    schema=[
        Field(name="popularity_30d", dtype=Float32),
        Field(name="genre_primary", dtype=String),
        Field(name="duration_min", dtype=Int64),
        Field(name="completion_rate_30d", dtype=Float32),
    ],
)
