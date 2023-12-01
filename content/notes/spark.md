+++
title = 'Spark'
date = 2023-12-01T00:32:23-05:00
+++

## Basics
- application > job > state > task
- cluser manager: scheduling spark applications. e.g. yarn/mesos
    - masater && worker
        - master: RM(ResourceManager in YARN)
        - worker: NM(NodeManager in YARN)
    - executor: Container in YARN
- driver: running in spark, including DAGScheduler && TaskScheduler
    - combine operations and form DAG(directed acyclic graph)
    - break down job into stages

## Operating Mode
- local/local-cluster/standalone/yarn/mesos
### local
- driver + executor, running in one process
- `pyspark` use `local[*]` by default
    - local: one executor
    - local[K]: K executors, K threads
    - local[*]: the number of cpu executors
- change mode with `pyspark --master`

- with `jps` 
```
bin/spark-submit examples/src/main/python/pi.py 10
```