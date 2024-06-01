+++
title = 'Hibernate'
date = 2024-06-01T15:07:08-04:00
+++

## Concepts
- JDBC -> JPA -> Hibernate -> Spring Data JPA / Spring Data Mongodb / Spring Data Elastic Search

- `Session Factory` grabs the configFile: username + password, then creates `sessions`
- Hibernate use reflection API to auto generate SQL statements
- Hibernate allows us to write:
  1. HQL(Hibernate Query Language), just in case the APIs are not flexible enough to catering some situations.
  2. Native SQL. cons: with dialect language(mysql, postgres, oracle)
- Cache in Hibernate: 
  - First Level(default): in **session level**. The session is private, it means it cannot access any content belong to other sessions.
  - Second Level: in **session factory level**. Add extra configurations to the ConfigFile.
