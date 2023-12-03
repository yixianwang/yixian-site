+++
title = 'Hadoop'
date = 2023-12-02T17:40:22-05:00
draft = true
+++

```bash
bin/hdfs namenode -format
sbin/start-all.sh
bin/hadoop fs -mkdir /usr
bin/hadoop fs -mkdir /usr/yixianwang
bin/hadoop fs -put demo.csv /usr/yixianwang
sbin/stop-all.sh
```