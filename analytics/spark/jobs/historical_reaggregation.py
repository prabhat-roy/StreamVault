"""Historical re-aggregation — re-runs QoE rollups when the formula changes."""
from pyspark.sql import SparkSession
from pyspark.sql import functions as F


def main() -> None:
    spark = SparkSession.builder.appName("streamvault-historical-reagg").getOrCreate()
    df = spark.read.format("kafka").option("kafka.bootstrap.servers", "kafka:9092").option("subscribe", "qoe.event.recorded").load()

    rollup = (df
        .withColumn("ts", F.col("timestamp"))
        .withWatermark("ts", "10 minutes")
        .groupBy(F.window("ts", "1 minute"), "country", "device_type", "cdn_pop")
        .agg(
            F.count("*").alias("events"),
            F.sum("rebuffer_ms").alias("rebuffer_ms"),
            F.expr("percentile_approx(join_time_ms, 0.95)").alias("p95_join_time_ms"),
            F.avg("bitrate_kbps").alias("avg_bitrate"),
        ))
    rollup.writeStream.format("clickhouse").option("table", "streamvault.qoe_1m").start().awaitTermination()


if __name__ == "__main__":
    main()
