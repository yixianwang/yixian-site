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

#### transformation: RDD-->RDD

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

#### action: RDD-->anything else

| Operations                 | Summary                                                                                                                        |
| :------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| reduce                     | operation on all elements within RDD, first merges with second element, and then the result merges with the third element, ... |
| collect                    | get all elements within RDD to local client                                                                                    |
| count                      | get the total number of elements within RDD                                                                                    |
| take(n)                    | get first unsorted n elements within RDD, top(n) can have first sorted n elements                                              |
| takeOrdered(n, [ordering]) | get first sorted n elements within RDD using natural order or a custom comparator                                              |
| saveAsTextFile             | save to file, each element with toString method                                                                                |
| countByKey                 |                                                                                                                                |
| foreach                    | iterate each element within RDD                                                                                                |

### Depencencies
![spark-core-1](images-spark/spark-core-1.png)

#### narrow dependencies - 1 : 1
每个父RDD的分区都至多被一个子RDD的分区使用。一对一
1. 输入输出一对一，结果RDD的分区结构不变，主要是map, flatMap
2. 输入输出一对一，但结果RDD的分区结构发生变化，如union, coalesce
3. 从输入中选择部分元素的算子，如filter, distinct, subtract, sample

#### wide dependencies - multiple : multiple
多个子RDD的分区依赖一个父RDD的分区。一对多
1. 对单个RDD基于key进行分组，如groupByKey, reduceByKey
2. 对两个RDD基于key进行join，如join

## Create sparkContext

```python
from pyspark.sql import SparkSession
spark = SparkSession.builder.master("spark://localhost:7077").appName("rdd_demos").getOrCreate()
sc = spark.sparkContext
```

## Create RDD

### 1. parallelize array
```python
# parallelize array in memory to crete RDD
arr1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] # run in client
rdd1 = spark.sparkContext.parallelize(arr1) # run in server
# This is an Action, return RDD to Driver
rdd1.collect()
# check the number of partitions of current RDD
rdd1.getNumPartitions()

# OR
# create RDD like this # range(start = 0, end, step = 1)
rdd2 = spark.sparkContext.parallelize(range(3, 11, 1))
rdd2.collect()
```
### 2. load data from outside
1. txt file
```python
file = "/opt/module/spark-3.5.0-bin-hadoop3/data/core/data/workcount.txt"
rdd3 = spark.sparkContext.textfile(file)
rdd3.collect()
```
2. json file
```python
jsonFile = "/opt/module/spark-3.5.0-bin-hadoop3/data/core/data/people.json"
jsonRDD = sc.textFile(jsonFile)
jsonRDD.collect()

# python use json module to handle json file
import json
result = jsonRDD.map(lambda line: json.loads(line))
result.collect()
# for d in result.collect():
#     print(d)
```
- [spark通过textFile读取hdfs数据分区数量规则](https://www.jianshu.com/p/e33671341f0d)
- [Spark：RDD数据分区数量总结(并行化集合parallelize与外部数据集textFile)](https://blog.csdn.net/qq_39192827/article/details/97494565)

## RDD Operations
- [Spark RDD 创建操作](https://www.cnblogs.com/abcdwxc/p/9867475.html)
### transformation: RDD-->RDD
```python
# Suppose we have an RDD, including {1, 2, 3, 3}
# first, create a RDD
data = spark.sparkContext.parallelize([1, 2, 3, 3])

# map
data_rdd1 = data.map(lambda x: x + 1)
data_rdd1.collect() # [2, 3, 4, 4]

# flatMap
data_rdd2 = data.flatMap(lambda x: range(x, 4))
data_rdd2.collect() # [1, 2, 3, 2, 3, 3, 3]

# filter
data_rdd3 = data.filter(lambda x: x != 1)
data_rdd3.collect() # [2, 3, 3]

# distinct
data_rdd4 = data.distinct()
data_rdd4.collect() # [1, 2, 3]

# sample: sample(withReplacement, fraction, seed)
# withReplacement param: 是否放回采样
# fraction param: 抽取比例
# seed param: random seed(optional)
data_rdd5 = data.sample(False, 0.5)
data_rdd5.collect()
# takeSample: Action not Transformation
# sample + take(2)
data_rdd51 = data.takeSample(False, 2)
print(data_rdd51)
```

```python
# Suppose we have two RDDs, {1, 2, 3, 3} and {3, 4, 5}
# first, create two RDDs
data1 = spark.sparkContext.parallelize([1, 2, 3, 3])
data2 = spark.sparkContext.parallelize([3, 4, 5])

# union
# similar to union all in mysql, not union in mysql
data1.union(data2).collect() # [1, 2, 3, 3, 3, 4, 5]

# intersection
data1.intersection(data2).collect() # [3]

# subtract
data1.subtract(data2).collect() # [1, 2]

# cartesian
data1.cartesian(data2).collect()
# [(1, 3),
#  (1, 4),
#  (1, 5),
#  (2, 3),
#  (2, 4),
#  (2, 5),
#  (3, 3),
#  (3, 4),
#  (3, 5),
#  (3, 3),
#  (3, 4),
#  (3, 5)]
```

```python
# groupBy
a = spark.sparkContext.parallelize(["black", "blue", "white", "green", "grey"])
b = a.groupBy(lambda x: len(x)).collect()
print(b) # [(4, <pyspark.resultiterable.ResultIterable object at 0x7f95187af580>), (5, <pyspark.resultiterable.ResultIterable object at 0x7f95087b5c10>)]
sorted([(x, sorted(y)) for (x, y) in b]) # [(4, ['blue', 'grey']), (5, ['black', 'green', 'white'])]
```

### action: RDD-->anything else
```python
# create a RDD
rdd = spark.sparkContext.parallelize([1, 2, 3, 3])

rdd.count() # 4

rdd.collect() # [1, 2, 3, 3]

rdd.first() # 1

rdd.countByValue() # defaultdict(int, {1: 1, 2: 1, 3: 2})

rdd.take(2) # [1, 2]

rdd.takeOrdered(2) # [1, 2]

rdd.takeOrdered(2, key=lambda x: -x) # [3, 3]

rdd.takeSample(False, 2)

rdd.reduce(lambda x, y: x + y) # 9
# reduce
#     x:("", 0), y:("hadoop", 1)
#     x:("hadoop", 1), y:("hadoop", 1)
#     x:("hadoophadoop", 2)
# reduceByKey: ignore key, only care value
#     x:0, y:1
#     x:1, y:1
#     x:2, y:1

rdd.fole(0, lambda x, y: x + y)
# fold
#     has an initial value for each partition and one more for merging

# aggregate(zeroValue, seqOp, combOp)
print("RDD 当前的分区数是: ", rdd.getNumPartitions()) # RDD 当前的分区数是:  8
seqOp = (lambda x, y: x * y) # 每个分区执行的函数
combOp = (lambda x, y: x + y) # 各个分区结果最后聚集时使用的函数
result = rdd.aggregate(2, seqOp, combOp)
result # 28

seqOp = (lambda x, y: (x[0] + y, x[1] + 1))
combOp = (lambda x, y: (x[0] + y[0], x[1] + y[1]))
result1 = spark.sparkContext.parallelize([1, 2, 3, 4]).aggregate((0, 0), seqOp, combOp)
print(result1) # (10, 4)

result2 = spark.sparkContext.parallelize([]).aggregate((0, 0), seqOp, combOp)
print(result2) # (0, 0)
```
> reduce is the special case of fold, fold is the special case of aggregate

### RDD action on numeric data(description statistics)
```python
rdd1 = sc.parallelize(range(1, 21, 2))
rdd1.collect()

rdd1.sum()
rdd1.max()
rdd1.min()
# mean
rdd1.mean()
rdd1.count()
# variance
rdd1.variance()
# sample variance
rdd1.sampleVariance()
# standard deviation
rdd1.stdev()
# sample standard deviation
rdd1.sampleStdev()
# Histogram reference: https://blog.csdn.net/hit0803107/article/details/52807485 
# Approach 1
rdd1.histogram([1.0, 8.0, 20.9])
# Approach 2
rdd1.histogram(3)

# 通过调用stats()方法，返回一个StatsCounter对象
status = rdd1.stats()
print(status.sum())
print(status.max())
print(status.min())
print(status.mean())
print(status.count())
print(status.variance())
print(status.stdev())
```

## Pair RDD Operations
### create Pair RDD
```python
# There are multiple ways to create Pair RDD
# Approach 1: load from file, and then transform to Pair RDD
file = "/data/spark_demo/rdd/wc.txt"
lines = spark.sparkContext.textFile(file)

pairRDD = lines.flatMap(lambda line: line.split(" ")).map(lambda word: (word, 1))
pairRDD.collect()
```

```python
# Approach 2: parallelize array
rdd = spark.sparkContext.parallelize(["Hadoop", "Spark", "Hive", "Spark"])
pairRDD = rdd.map(lambda word: (word, 1))
pairRDD.collect() # [('Hadoop', 1), ('Spark', 1), ('Hive', 1), ('Spark', 1)]
```

```python
# Approach 3: keyBy(): customize the rule for key grouping
a = spark.sparkContext.parallelize(["black", "blue", "white", "green", "grey"])

# with cutomized function to create keys, return Pair RDD
b = a.keyBy(lambda x: len(x))
b.collect() # [(5, 'black'), (4, 'blue'), (5, 'white'), (5, 'green'), (4, 'grey')]
```

```python
# Approach 4: creating with tuple
pets = spark.sparkContext.parallelize([("cat", 1), ("dog", 1), ("cat", 2)])
pets.collect() # [('cat', 1), ('dog', 1), ('cat', 2)]
```

### transformation on Pair RDD
```python
# Suppose we have a pair RDD [(1, 2), (3, 4), (3, 6)]
# Create Pair RDD
pairRDD = spark.sparkContext.parallelize([(1, 2), (3, 4), (3, 6)])
pairRDD.collect()
```

```python
# reduceByKey(func)
pairRDD.reduceByKey(lambda x, y: x + y).collect() # [(1, 2), (3, 10)]

# groupByKey()
pairRDD.groupByKey().collect()
# [(1, <pyspark.resultiterable.ResultIterable at 0x7f94d9638970>),
#  (3, <pyspark.resultiterable.ResultIterable at 0x7f94d021f550>)]

# keys: return all keys
pairRDD.keys().collect() # [1, 3, 3]

# values: return all values
pairRDD.values().collect() # [2, 4, 6]

# sortByKey(): default is increasing
pairRDD.sortByKey().collect() # [(1, 2), (3, 4), (3, 6)]

# pairRDD.sortByKey(ascending=False).collect()
pairRDD.sortByKey(False).collect() # [(3, 4), (3, 6), (1, 2)]

# mapValues(func): apply func to each element of Pair RDD, without chaning key
```

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
