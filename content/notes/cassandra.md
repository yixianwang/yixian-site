+++
title = 'Cassandra'
date = 2023-11-29T21:56:01-05:00
+++

## Basics
- replication factor (RF)
- consistency level (CL) = QUORUM (Quorum referring to majority, 2 replicas in this case or RF/2 +1)
- coordinator
- SSTable
- memtable
- timestamps
- compaction: take small SSTables and merging them into bigger one

## Intro
- keyspaces:
    - top-level namespace/container
    - similar to a relational database schema
    ```sql
    CREATE KEYSPACE killrvideo
    WITH REPLICATION = {
      'class': 'SimpleStrategy',
      'replication_factor': 1
    };
    ```
- USE switches between keyspaces
    ```sql
    USE killrvideo;
    ```
- Tables:
    - keyspaces contain tables
    - tables contain data
    ```sql
    CREATE TABLE table1 (
      column1 TEXT,
      column2 TEXT,
      column3 INT,
      PRIMARY KEY (column1)
    );

    CREATE TABLE users (
      user_id UUID,
      first_name TEXT,
      last_name TEXT,
      PRIMARY KEY (user_id)
    );
    ```
- Basic Data Types:
    - text: UTF8 encoded string, varchar is same as text, unbounded
    - int: Signed, 32 bits
    - timestamp: date and time, 64 bit integer, store number of seconds since Jan 1st 1970 GMT
- UUID && TIMEUUID
    - generate global unique id without communication between nodes
    - TIMEUUID embeds a TIMESTAMP value
- INSERT:
    ```sql
    INSERT INTO users (user_id, first_name, last_name)
    VALUES (uuid(), 'Joseph', 'Chu');
    ```
- SELECT:
    ```sql
    SELECT *
    FROM users;

    SELECT first_name, last_name
    FROM users;

    SELECT * 
    FROM users
    WHERE user_id = 4b516b3-ddf0-4c43-bab6-b91d674b64a5;
    ```
- COPY:
    - imports/exports CSV
    ```sql
    COPY table1 (column1, column2, column3) FROM 'table1data.csv';
    ```
    - header parameter skips the first line in the file
    ```sql
    COPY table1 (column1, column2, column3) FROM 'table1data.csv'
    WITH HEADER=true;
    ```
- get data into Cassandra:
    - COPY
    - Spark
    - Drivers
    - Etc.
