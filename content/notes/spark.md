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
- driver: 
    - running in spark, including DAGScheduler && TaskScheduler
    - combine operations and form DAG(directed acyclic graph)
    - break down job into stages
    - similar to ApplicationMaster(AM) in YARN, responsible for applying resources and scheduling
    - DAGScheduler:
        - split job into stages
    - TaskScheduler:
        - similar to AM, responsible for applying resources and scheduling
> YARN: ApplicationMaster(AM), ResourceManager(RM), NodeManager(NM), Container
![spark-1](images-spark/spark-1.svg)

## Operating Mode
- local/local-cluster/standalone/yarn/mesos
### local
- driver + executor, running in one process
- `pyspark` use `local[*]` by default
    - local: one executor
    - local[K]: K executors, K threads
    - local[*]: the number of cpu executors
- change mode with `pyspark --master`

- with `jps` to check procsses 
```
bin/spark-submit examples/src/main/python/pi.py 10
```

### local-cluster
- driver + master + worker, running in one process
- each worker has multiple executors, each executor is one process
- `pyspark --master local-cluster[x, y, z]`
    - x: the number of executors
    - y, z: each executor has y cores and z memory size
```
bin/spark-submit --master local-cluster[2, 2, 1024] examples/src/main/python/pi.py 10
```

### standalone
- written by spark, similar to RM of YARN
- driver/master/worker/executor all have their own process
- Setup: 
    - `spark-env.sh.template`
    - `spark-default.conf.template`
    - Note: SparkSubmitArguments reads in order:
        - [pyspark-options] or [spark-submit-options], [conf/spark-default.conf], [conf/spark-env.sh]
- Setup workers:
    1. modify `conf/slaves` file
    2. sync the setup of work1 and work2 
    ```bash
    scp -r /opt/module/spark-3.5.0-bin-hadoop3/ worker1:/opt/module/spark-3.5.0-bin-hadoop3
    scp -r /opt/module/spark-3.5.0-bin-hadoop3/ worker2:/opt/module/spark-3.5.0-bin-hadoop3
    ```
- Start:
    1. Start spark
    ```bash
    sbin/start-all.sh
    ```
    2. Start process
    ```bash
    [start-all.sh] 
    -> load [spark-config.sh] 
    -> run [start-master.sh] and [start-slaves.sh]
    -> load [spark-config.sh] and [spark-env.sh]
    -> run [spark-daemon.sh]
    -> run [spark-class.sh] or ([spark-submit.sh] -> [spark-class.sh])
    ```
- Test:
    - On each machine, use `jps` to check process of master and slaves
    - Entry master's WEBUI: 8080
    - run `pyspark`
        ```bash
        bin/pyspark --master spark://localhost:7077
        ```
    - run `spark-submit`
        > must assign `--master` for standalone, otherwise it will be local
        ```bash
        bin/spark-submit --master spark://localhost:7077 examples/src/main/python/pi.py 10
        ```
- Kill:
    - `jps`
    - `kill 00000`

### yarn
- **yarn-client** and **yarn-cluster**
- Setup:
    - `spark-env.sh.template` rename to `spark-env.sh`
    ```
    YARN_CONF_DIR=/home/yixianwang/hadoop/etc/hadoop
    ```
- Start:
    - in `hadoop` folder, run the following
    ```bash
    sbin/hadoop-daemon.sh start namenode
    sbin/hadoop-daemon.sh start datenode
    sbin/yarn-daemon.sh start resourcemanager
    sbin/yarn-daemon.sh start nodemanager
    # or directly
    sbin/start-all.sh
    ```
- Test:
    - On each machine, use `jps` to check process of RM and NM
    - Entry master's WEBUI: 8088