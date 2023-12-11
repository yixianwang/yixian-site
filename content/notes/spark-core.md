+++
title = 'Spark Core'
date = 2023-12-03T19:43:27-05:00
+++

## RDD

- Resilient distributed dataset
  1. Fault tolerance
  2. distributed
  3. immutable data structure, stored in disk or memory
- There are multiple partitions(#partitions is the same as #machines) within one RDD
- DN(Data Node to store data) and Worker(to compute) are all in one machine(best practice)
  - only shuffle need data transfering with network, others are in local machine

### reduceByKey

```
hadoop ---> (hadoop, 1)
hadoop ---> (hadoop, 1)
hadoop ---> (hadoop, 1)
hive ---> (hive, 1)
hive ---> (hive, 1)
hive ---> (hive, 1)
```

- reduceByKey

```
<hadoop, [1, 1, 1]>
<hive, [1, 1, 1]>
```

- shuffle

```
hash(hadoop) ---> hashcode % 3 = 1(machine 1)
hash(hive) ---> hashcode % 3 = 2(machine 2)
```

### operations

#### transformation

| Operations  | Summary                                                                                          |
| :---------- | ------------------------------------------------------------------------------------------------ |
| map         | return a new RDD                                                                                 |
| filter      | return a new RDD; true: keep, false: remove                                                      |
| flatMap     | map + flat(from two dimentional to one dimentional)                                              |
| groupByKey  |                                                                                                  |
| reduceByKey | groupByKey(get <hadoop, [1, 1, 1]>) + map(get <hadoop, 3>)                                       |
| sortByKey   | not default in spark, but default in hadoop                                                      |
| join        | cogroup + remove nulls: join by key of <key, value>, all pairs will handle by cutomized function |
| cogroup     | full join                                                                                        |

#### action

| Operations                 | Summary                                                                           |
| :------------------------- | --------------------------------------------------------------------------------- |
| reduce                     |                                                                                   |
| collect                    | get all elements within RDD to local client                                       |
| count                      | get the total number of elements within RDD                                       |
| take(n)                    | get first unsorted n elements within RDD                                          |
| takeOrdered(n, [ordering]) | get first sorted n elements within RDD using natural order or a custom comparator |
| saveAsTextFile             | save to file, each element with toString method                                   |
| countByKey                 |                                                                                   |
| foreach                    | iterate each element within RDD                                                   |

### Depencencies

#### narrow dependencies

- 1 : 1

#### wide dependencies

- multiple : multiple

## Create sparkContext

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

### load data from outside

## RDD Operations

### transformation

### action

### RDD action on numeric data(description statistics)

## Pair RDD Operations

### create Pair RDD

### transformation on Pair RDD

## RDD cache

### overview

### approaches

## Fault tolerance

### overview

### lineage mechanism

### checkpoint mechanism

## Data Partitions

### assign partitions when creating RDD

### assign partitions when transforming RDD

### customize partition function

## Shared Variables

### overview

### broadcast

#### utilize broadcast

#### update broadcast

#### release broadcast

### accumulator

## Shuffle
