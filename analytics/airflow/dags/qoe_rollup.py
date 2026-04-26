from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="qoe_rollup_hourly",
    start_date=datetime(2026, 1, 1),
    schedule="@hourly",
    catchup=False,
    default_args={"retries": 2, "retry_delay": timedelta(minutes=5)},
    tags=["streamvault", "qoe"],
) as dag:
    rollup = BashOperator(
        task_id="rollup_hour",
        bash_command="dbt run --select qoe_hourly --vars '{run_hour: {{ ts }}}'",
    )
