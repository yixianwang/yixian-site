+++
title = 'JDBC'
date = 2024-05-31T22:26:39-04:00
+++

- [github](https://github.com/yixianwang/jdbc)

## Setup
```xml {filename="pom.xml"}
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <version>${postgresql.version}</version>
        </dependency>
```

```java {filename="JdbcConfig.java"}
package com.yixianwang.todolistbackend;

public class JdbcConfig {
    private static final String url = "jdbc:postgresql://localhost:5432/test";
    private static final String user = "postgres";
    private static final String password = "1234";

    public JdbcConfig() {
    }

    public static String getUrl() { return url; }
    public static String getUser() { return user; }
    public static String getPassword() { return password; }
}
```

## Query
- use `ResultSet rs = stmt.executeQuery(strSelect);`

```java {filename="JdbcSelectTest.java"}
package com.yixianwang.todolistbackend;

import java.sql.*;

public class JdbcSelectTest {
    public static void main(String[] args) {
        try (
            Connection conn = DriverManager.getConnection(
                JdbcConfig.getUrl(),
                JdbcConfig.getUser(),
                JdbcConfig.getPassword()
            );
            Statement stmt = conn.createStatement();
        ) {
            String strSelect = "select * from cars";
            ResultSet rs = stmt.executeQuery(strSelect);

            int rowCount = 0;
            while (rs.next()) {
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                Integer year = rs.getInt("year");
                System.out.println(brand + " " + model + " " + year);
                ++rowCount;
            }
            System.out.println("Total number of rows:" + rowCount);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
```

## Update
- use `int countUpdate = stmt.executeUpdate(strUpdate);`

```java {filename="JdbcSelectTest.java"}
package com.yixianwang.todolistbackend;

import java.sql.*;

public class JdbcUpdateTest {
    public static void main(String[] args) {
        try (
                Connection conn = DriverManager.getConnection(
                        JdbcConfig.getUrl(),
                        JdbcConfig.getUser(),
                        JdbcConfig.getPassword()
                );
                Statement stmt = conn.createStatement();
        ) {
            String strUpdate = "update cars set year = 1234 where brand = 'Honda'";
            int countUpdate = stmt.executeUpdate(strUpdate);
            System.out.println(countUpdate + " recoreds are updated");

            String strSelect = "select * from cars";
            ResultSet rs = stmt.executeQuery(strSelect);

            int rowCount = 0;
            while (rs.next()) {
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                Integer year = rs.getInt("year");
                System.out.println(brand + " " + model + " " + year);
                ++rowCount;
            }
            System.out.println("Total number of rows:" + rowCount);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
```

## Insert and Delete
- use `int countDelete = stmt.executeUpdate(sqlDelete);`
- use `int countInsert = stmt.executeUpdate(sqlInsert);`

```java {filename="JdbcInsertAndDeleteTest.java"}
package com.yixianwang.todolistbackend;

import java.sql.*;

public class JdbcInsertAndDeleteTest {
    public static void main(String[] args) {
        try (
                Connection conn = DriverManager.getConnection(
                        JdbcConfig.getUrl(),
                        JdbcConfig.getUser(),
                        JdbcConfig.getPassword()
                );
                Statement stmt = conn.createStatement();
        ) {
            System.out.println("-------------------delete------------------");
            String sqlDelete = "delete from cars where brand = 'Apple'";
            int countDelete = stmt.executeUpdate(sqlDelete);
            System.out.println(countDelete + " records are deleted");

            System.out.println("-------------------insert one record------------------");
            String sqlInsert = "insert into cars" + " values ('Banana', 'haha', 1)";
            int countInsert = stmt.executeUpdate(sqlInsert);
            System.out.println(countInsert + " records are inserted");

            System.out.println("-------------------insert multiple record------------------");
            String sqlMultiInsert = "insert into cars values " + "('Tomato', 'hoho', 2), " + "('Pineapple', 'hihi', 3)";
            int countMultiInsert = stmt.executeUpdate(sqlMultiInsert);
            System.out.println(countMultiInsert + " records are inserted");

            System.out.println("-------------------partial insert------------------");
            String sqlPartialInsert = "insert into cars (brand, model)" + "values ('Jeep', 'Wrangler')";
            int countPartialInsert = stmt.executeUpdate(sqlPartialInsert);
            System.out.println(countPartialInsert + " records are inserted");

            System.out.println("-------------------Print Final Table------------------");
            String sqlSelect = "select * from cars";
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                Integer year = rs.getInt("year");
                System.out.println(brand + " " + model + " " + year);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

```

## Transaction
- use `conn.setAutoCommit(false);`
- use `conn.commit();`
- use `conn.rollback();`

```java {filename="JdbcTransactionTest.java"}
package com.yixianwang.todolistbackend;

import java.sql.*;

public class JdbcTransactionTest {
    public static void main(String[] args) {
        try (
                Connection conn = DriverManager.getConnection(
                        JdbcConfig.getUrl(),
                        JdbcConfig.getUser(),
                        JdbcConfig.getPassword()
                );
                Statement stmt = conn.createStatement();
        ) {
            conn.setAutoCommit(false);

            // before update
            System.out.println("before update:");
            String sqlSelect = "select * from cars";
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                Integer year = rs.getInt("year");
                System.out.println(brand + " " + model + " " + year);
            }
            conn.commit();

            // update something
            stmt.executeUpdate("update cars set year = 2024 where brand = 'Honda'");
            stmt.executeUpdate("update cars set year = 2024 where brand = 'Ford'");
            conn.commit();

            // after update (commit)
            System.out.println();
            System.out.println("after update commit:");
            String sqlSelect2 = "select * from cars";
            ResultSet rs2 = stmt.executeQuery(sqlSelect2);
            while (rs2.next()) {
                String brand = rs2.getString("brand");
                String model = rs2.getString("model");
                Integer year = rs2.getInt("year");
                System.out.println(brand + " " + model + " " + year);
            }
            conn.commit();

            // update but rollback
            System.out.println();
            System.out.println("update but rollback");
            stmt.executeUpdate("update cars set year = 2011 where brand = 'Honda'");
            stmt.executeUpdate("update cars set year = 2011 where brand = 'Ford'");
            conn.rollback();

            // after update (rollback)
            System.out.println();
            System.out.println("after update rollback");
            String sqlSelect3 = "select * from cars";
            ResultSet rs3 = stmt.executeQuery(sqlSelect3);
            while (rs3.next()) {
                String brand = rs3.getString("brand");
                String model = rs3.getString("model");
                Integer year = rs3.getInt("year");
                System.out.println(brand + " " + model + " " + year);
            }
            conn.commit();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
```

## Roll Back in Catch
- use `conn.rollback();` within catch block

## Batch Processing with Prepared Statement
- purpose: to decrease the number of IO
- use prepared statement

```java {filename="JdbcBatchProcessingPreparedStatTest.java"}
package com.yixianwang.todolistbackend;

import java.sql.*;

public class JdbcBatchProcessingPreparedStatTest {
    public static void main(String[] args) {
        try (
                Connection conn = DriverManager.getConnection(
                        JdbcConfig.getUrl(),
                        JdbcConfig.getUser(),
                        JdbcConfig.getPassword()
                );
                PreparedStatement pstmt = conn.prepareStatement(
                        "insert into cars values (?, ?, ?)"
                );
        ) {
            conn.setAutoCommit(false);
            pstmt.setString(1, "Apple");
            pstmt.setString(2, "Z1");
            pstmt.setInt(3, 2025);
            pstmt.addBatch();

            pstmt.setString(1, "Huawei");
            pstmt.setString(2, "Q1");
            pstmt.addBatch();

            int[] result = pstmt.executeBatch();
            conn.commit();
        } catch (SQLException e) {
        }
    }
}
```

## Prepared Statement
- purpose: to solve sql injection

```java {filename="JdbcPreparedStatementTest.java"}
package com.yixianwang.todolistbackend;

import java.sql.*;

public class JdbcPreparedStatementTest {
    public static void main(String[] args) {
        try (
                Connection conn = DriverManager.getConnection(
                        JdbcConfig.getUrl(),
                        JdbcConfig.getUser(),
                        JdbcConfig.getPassword()
                );
                PreparedStatement pstmt = conn.prepareStatement(
                        "insert into cars values (?, ?, ?)"
                );
                PreparedStatement pstmtSelect = conn.prepareStatement("select * from cars");
        ) {
            pstmt.setString(2, "RX350");
            pstmt.setInt(3, 2020);
            int rowsInserted = pstmt.executeUpdate();
            System.out.println(rowsInserted + " records inserted");

            // partial changes
            pstmt.setString(1, "Tesla");
            rowsInserted = pstmt.executeUpdate();
            System.out.println(rowsInserted + " records inserted");

            ResultSet rs = pstmtSelect.executeQuery();
            while (rs.next()) {
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                Integer year = rs.getInt("year");
                System.out.println(brand + " " + model + " " + year);
            }

        } catch (SQLException e) {
        }
    }
}
```