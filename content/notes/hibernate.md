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

- [github](https://github.com/yixianwang/hibernate)

## Setup
```xml {filename="pom.xml"}
        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>5.4.20.Final</version>
        </dependency>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <version>1.4.200</version>
        </dependency>
```

### Old style cfg
```xml {filename="src/main/resources/hibernate.cfg-one-to-one.xml"}
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <property name="hibernate.connection.driver_class">org.h2.Driver</property>
        <property name="hibernate.connection.url">jdbc:h2:mem:test</property>
        <property name="hibernate.connection.username">sa</property>
        <property name="hibernate.connection.password"></property>
        <property name="hibernate.dialect">org.hibernate.dialect.H2Dialect</property>
        <property name="show_sql">true</property>
        <property name="hbm2ddl.auto">create-drop</property>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.foreignKeyAsso.EmployeeEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.foreignKeyAsso.AccountEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.sharedPrimaryKey.EmployeeEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.sharedPrimaryKey.AccountEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.joinTable.EmployeeEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.joinTable.AccountEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.mapsById.EmployeeEntity"/>
        <mapping class="com.yixianwang.hibernate.onetoone.dto.mapsById.AccountEntity"/>
    </session-factory>
</hibernate-configuration>
```

```xml {filename="src/main/resources/hibernate.cfg-one-to-many.xml"}

```

```xml {filename="src/main/resources/hibernate.cfg-many-to-many.xml"}
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE hibernate-configuration PUBLIC
        "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
        "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <property name="hibernate.connection.driver_class">org.h2.Driver</property>
        <property name="hibernate.connection.url">jdbc:h2:mem:test</property>
        <property name="hibernate.connection.username">sa</property>
        <property name="hibernate.connection.password"></property>
        <property name="hibernate.dialect">org.hibernate.dialect.H2Dialect</property>
        <property name="show_sql">true</property>
        <property name="hbm2ddl.auto">create-drop</property>
        <mapping class="com.yixianwang.hibernate.manyToMany.joinTable.ReaderEntity"/>
        <mapping class="com.yixianwang.hibernate.manyToMany.joinTable.SubscriptionEntity"/>
    </session-factory>
</hibernate-configuration>
```

### New style cfg
- only use annotation

#### One to One
- two way one to one
```java {filename="EmployeeEntity.java"}
    @OneToOne(cascade = CascadeType.REMOVE)
    @PrimaryKeyJoinColumn
    private AccountEntity account;
```

```java {filename="AccountEntity.java"}
    @OneToOne(mappedBy="account", cascade = CascadeType.REMOVE)
    private EmployeeEntity employee;
```

#### One to Many
- one employee has multiple accounts
```java {filename="EmployeeEntity.java"}
    @OneToMany(cascade=CascadeType.ALL)
    @JoinTable(name="EMPLOYEE_ACCOUNT", joinColumn={@JoinColumn(name="EMPLOYEE_ID", referencedColumnName="ID")}
                                  , inverseJoinColumns={@JoinColumn(name="ACCOUNT_ID", referencedColumnName="ID")})
    private Set<AccountEntity> accounts;
```

### use Hibernate
```java
Session session = HibernateUtil.getSessionFactory().oepnSession();
session.beginTransaction();

// ...

// save(insert)
session.save(firstEmployee);
session.save(secondEmployee);

session.getTransaction().commit();
HibernateUtil.shutdown();
```