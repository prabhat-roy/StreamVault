"""Churn prediction via survival analysis (Cox proportional hazards).

Event = subscription cancellation. Covariates: watch-time-trend, rebuffer-p95,
support-tickets, bill-shock, content-completion-rate.
"""
from lifelines import CoxPHFitter
import pandas as pd


def train(features_csv: str, model_out: str) -> None:
    df = pd.read_csv(features_csv)
    cph = CoxPHFitter(penalizer=0.01)
    cph.fit(df, duration_col="tenure_days", event_col="churned")
    cph.print_summary()
    import joblib
    joblib.dump(cph, model_out)


if __name__ == "__main__":
    train("data/churn_features.csv", "churn_cox.pkl")
