from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="churn_scoring_daily",
    start_date=datetime(2026, 1, 1),
    schedule="0 4 * * *",
    catchup=False,
    tags=["streamvault", "churn", "ml"],
) as dag:
    BashOperator(
        task_id="score-active-subscribers",
        bash_command="python -m streamvault.ml.churn.score --as-of {{ ds }} --output s3://streamvault-ml/churn/{{ ds }}/scores.parquet",
    )
