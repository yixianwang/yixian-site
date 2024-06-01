+++
title = 'MySQL'
date = 2023-11-03T17:51:02-04:00
+++

## Common command
```mysql
mysql -u root -p
password:xxxx0000

create database xxxx character set utf8mb4;
drop database xxxx;

use xxxx;
source pathto.sql;
```

# Schemas
Fact and dimension tables are organized in particular structures known as schemas.
## Star schema && Snowflake schema
Star schema and snowflake schema are popular ways of organising this information.


# Mysql Syntax
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

## create table
```mysql
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
```

```mysql
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;
```

```mysql
CREATE TABLE IF NOT EXISTS sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);
 
INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
      ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
```

## show columns
```mysql
# version 1
show columns from table_name;

# version 2: better
desc table_name;
```

## insert into table
```mysql
# version 1: insert into all columns
INSERT INTO table_name
VALUES (value1, value2, value3, ...);

# version 2: insert into specified columns
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');
```

## delete row
```mysql
# version 1: delete all rows without deleting table
delete from table_name;

# version 2: delete + WHERE
delete from table_name WHERE conditions;
```

## limit
```mysql
# will show the first row
limit 0, 1 === limit 1 === limit 1 offset 0
```

## ISNULL & IFNULL
```
ISNULL(expr) 的用法： 
如expr 为null，那么isnull() 的返回值为 1，否则返回值为 0。 mysql> select isnull(1+1); -> 0 mysql> select isnull(1/0); -> 1 使用= 的null 值对比通常是错误的。
isnull() 函数同 is null比较操作符具有一些相同的特性。请参见有关is null 的说明。

IFNULL(expr1,expr2)的用法：
假如expr1 不为 NULL，则 IFNULL() 的返回值为 expr1; 否则其返回值为 expr2。IFNULL()的返回值是数字或是字符串，具体情况取决于其所使用的语境。
```

## IF & datediff & lag
```sql
select
  ...
  ,if(datediff(suc_time,lag(suc_time,1) over(partition by pin order by suc_time))<=365,1,0) as bank_cr_new_flag
  ...
from
...
```

```
LAG(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
)
```

## sql declare variable within function
```
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    # set n := n - 1
    declare ll int;
    set ll := n - 1;
  RETURN (
    # Write your MySQL query statement below.
    select 
      salary
    from
      employee
    group by 
      salary
    order by
      salary desc
    # limit 1 offset n 
    limit 1 offset ll
  );
END
```

## example
```
select 
    substr(a.suc_time,1,10) as date
    ,a.bankcode
    ,count(distinct a.outbizno) as total_order_cnt
    ,count(distinct case when b.item_first_cate_name = '食品饮料' then a.outbizno end) as food_order_cnt
    ,sum(case when b.item_first_cate_name = '食品饮料' then nvl(b.suc_paymoney,0) end) food_amt
    ,count(distinct case when b.item_first_cate_name = '酒类' then a.outbizno end) as wine_order_cnt
    ,sum(case when b.item_first_cate_name = '酒类' then nvl(b.suc_paymoney,0) end) wine_amt
    ,count(distinct case when b.item_first_cate_name = '美妆个护' then a.outbizno end) as care_order_cnt
    ,sum(case when b.item_first_cate_name = '美妆个护' then nvl(b.suc_paymoney,0) end) care_amt
    ,count(distinct case when b.item_first_cate_name = '家用电器' then a.outbizno end) as household_order_cnt
    ,sum(case when b.item_first_cate_name = '家用电器' then nvl(b.suc_paymoney,0) end) household_amt
    ,count(distinct case when b.item_first_cate_name = '生鲜' then a.outbizno end) as fresh_order_cnt
    ,sum(case when b.item_first_cate_name = '生鲜' then nvl(b.suc_paymoney,0) end) fresh_amt
from dmv.DWB_PAY_SYT_ORDR_DET_I_D a
left join
    (select matchid,first_cate as item_first_cate_name,suc_paymoney from dmv.a_sc_order_union_i_d where dt >=${startdate})as b
on a.outbizno=b.matchid 
where 
    dt>=${startdate}
    and a.suc_time is not null
    and a.payenum in(209,210,263,264,131,132,138,139,152,153,205,206,229,643,688,689,471,690,691,670,667,665,569,548,392,241,750,1008,1011,299,496,352,183,546,185,686,701,1015,186,258,147,140,110,553,651,648,663,568,1009,1060,1018,199,200,201,202,404,405,394,395,406,407,616,617,618,637,672,531,628,731,619,642,664,415,668,669,759,532,755,530,192,193,174,1022,563,564,124,195,196,164,166,219,599,191,159,262,127,119,501,122,603,207,711,710,1019,1061,1039)
    and a.cardtype = 2
    -- and a.bankcode in('CEB','CMB','CCB','CITIC','BCOM','GDB','BOC','PAB','SPDB','ICBC','ABC','CMBC','CIB')
group by 
    substr(a.suc_time,1,10)
    ,a.bankcode
;
```

## case when
```
    select 
        ...
        ,case when bankcode = 'COMM' then 'BCOM' else bankcode end as bankcode
        ,case when cardtype  = 'DEBIT' then 1 
              when cardtype = 'CREDIT' then 2 
              else cardtype
              end as cardtype
    from dev_tmp.wyx_wx_bank_tmp00
```