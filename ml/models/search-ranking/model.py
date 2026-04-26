"""Learning-to-rank for catalogue search results — LightGBM LambdaRank.

Features: BM25 score, popularity, watchlist signals, language match,
recency, click-through rate, dwell time after click.
"""
import lightgbm as lgb
from sklearn.model_selection import train_test_split
import pandas as pd


def train(features_csv: str, model_out: str) -> None:
    df = pd.read_csv(features_csv)
    y = df["relevance"]
    X = df.drop(columns=["relevance", "query_id"])
    group = df.groupby("query_id").size().to_numpy()

    train_set = lgb.Dataset(X, label=y, group=group)
    params = {
        "objective": "lambdarank",
        "metric": "ndcg",
        "ndcg_eval_at": [5, 10],
        "learning_rate": 0.05,
        "num_leaves": 64,
    }
    model = lgb.train(params, train_set, num_boost_round=500)
    model.save_model(model_out)


if __name__ == "__main__":
    train("data/search_judgements.csv", "search_ranking.lgb")
