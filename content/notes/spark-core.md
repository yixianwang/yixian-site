+++
title = 'Spark Core'
date = 2023-12-03T19:43:27-05:00
+++

## ??
### narrow dependencies
- 
### wide dependencies

## sparkContext
```python
from pyspark.sql import SparkSession
spark = SparkSession.builder.master("spark://localhost:7077").appName("rdd_demos").getOrCreate()
sc = spark.sparkContext
```

## Create RDD
### parallelize array
```python
# parallelize array in memory to crete RDD
arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
rdd1 = spark.sparkContext.parallelize(arr1)
# This is an Action, return RDD to Driver
rdd1.collect()
# check the number of partitions of current RDD
rdd1.getNumPartitions()

# OR
# create RDD like this # range(start = 0, end, step = 1)
rdd2 = spark.sparkContext.parallelize(range(3, 11, 1))
rdd2.collect()
```