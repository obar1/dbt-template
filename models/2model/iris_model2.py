def model(dbt, session):
    target_name = dbt.config.get("target_name")
    df = dbt.ref("iris_cleaned")
    df = df.select("class").distinct()

    # limit data in dev
    if target_name == "dev":
        return df.limit(10)
    return df
