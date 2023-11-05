+++
title = 'Sql'
date = 2023-11-03T17:51:02-04:00
+++

# Syntax
## WITH and DATE_SUB
[Leetcode 550](https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50)
```sql
WITH first_logins AS ( # first with table
  SELECT
    player_id,
    MIN(event_date) AS first_login
  FROM
    Activity
  GROUP BY
    player_id
), consec_logins AS ( # second with table
  SELECT
    COUNT(A.player_id) AS num_logins
  FROM
    first_logins F
    INNER JOIN Activity A ON F.player_id = A.player_id
    AND F.first_login = DATE_SUB(A.event_date, INTERVAL 1 DAY)
)
SELECT
  ROUND(
    (SELECT num_logins FROM consec_logins)
    / (SELECT COUNT(player_id) FROM first_logins)
  , 2) AS fraction;
```

## MOD
```sql
SELECT
  (CASE
    WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
    WHEN MOD(id, 2) != 0 AND counts = id THEN id
    ELSE id - 1
  END) AS id,
  student
FROM
  seat,
  (SELECT
    COUNT(*) AS counts
  FROM
    seat) AS seat_counts
ORDER BY id ASC;
```

## Cross Join vs Outer Join
### Cross Join
> returning all possible combinations of all rows
```sql
SELECT
  ...
FROM
  table1,
  table2 as t2 # must have alias here
;
```

### Outer Join
> mysql doesn't have outer join, but we can emulate it by union with left and right join

## UNION vs UNION ALL
> UNION remove duplicates
> UNION ALL won't remove duplicates
```mysql
# should have () in practice
()
union
()
```

## SUM
```mysql
sum(case when date between "2020-02-01" and "2020-02-28" then 1 else 0 end) over(partition by id) as cnt
```

## LIKE
```mysql
where date like "2020-02-%"
```

## WINDOW
```mysql
range between unbounded preceding and current row
```