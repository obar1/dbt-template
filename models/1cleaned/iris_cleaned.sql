{#
    map to the right column anmes and types etc

    . Attribute Information:
   1. sepal length in cm
   2. sepal width in cm
   3. petal length in cm
   4. petal width in cm
   5. class: 
      -- Iris Setosa
      -- Iris Versicolour
      -- Iris Virginica

#}
SELECT
    CAST(column0 AS FLOAT) AS sepal_length,
    CAST(column1 AS FLOAT) AS sepal_width,
    CAST(column2 AS FLOAT) AS petal_length,
    CAST(column3 AS FLOAT) AS petal_width,
    UPPER(CAST(column4 AS STRING)) AS class
FROM {{ ref('base_raw_iris_raw') }}
