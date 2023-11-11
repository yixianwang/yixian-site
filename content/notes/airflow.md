+++
title = 'Airflow'
date = 2023-11-08T20:41:27-05:00
+++

- [Official Doc](https://airflow.apache.org/docs/apache-airflow/stable/installation/installing-from-pypi.html)

## Components of Apache Airflow
- Web Server
- Scheduler
- Metadata Database
- Executor

## Commandlines
```bash
python3 -m venv env_airflow
source ./env_airflow/bin/activate
airflow db init
cd ~/airflow
mkdir dags
airflow webserver
```

## Create users
```bash
airflow users create --role Admin --username username --email email --firstname firstname --lastname lastname --password password
```

## Start scheduler
```bash
# any folder
airflow scheduler
```
