+++
title = 'JDBC'
date = 2024-05-31T22:26:39-04:00
+++

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