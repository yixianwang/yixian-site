+++
title = 'Spring Data Jpa'
date = 2024-06-01T21:42:22-04:00
+++

## Setup
```xml {filename="pom.xml"}
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>

        <!-- for postgresql -->
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <version>${postgresql.version}</version>
        </dependency>

        <!-- for mysql -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.32</version>
        </dependency>
```

```yaml {filename="application.properties"}
```

## Entities
```java {filename="Course.java"}
@Entity
@Table(name="course")
public class Course {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String name;

  @Column
  private Integer credit;

  @OneToOne
  @JoinColumn(name = "teacher_id")
  private Teacher teacher;

  @OneToMany(mappedBy = "course")
  private List<Enrollment> enrollmentList;

  // ...
}
```

```java {filename="Enrollment.java"}
@Entity
@Table(name = "enrollment")
public class Enrollment {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @ManyToOne
  private Course course;

  @ManyToOne
  private Student student;

  private Integer score;

  // ...
}
```

```java {filename="Student.java"}
@Entity
@Table(name = "student")
public class Student {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  private String name;

  private LocalDate dob;

  @OneToMany(mappedBy = "student")
  List<Enrollment> enrollmentList;

  // ...
}
```

## MVC
- package structures:
  - **configuration**
  - **controller**
  - **data**
  - **entity**
  - **repository**
    - **mongodb**
    - EnrollmentRepository.java
    - StudentRepository.java
    - TeacherRepository.java
  - **service**
    - EnrollmentService.java
    - EnrollmentServiceImpl.java
    - StudentService.java
    - StudentServiceImpl.java
    - TeacherService.java
    - TeacherServiceImpl.java
    - UserService.java
    - UserServiceImpl.java
    - UserServiceImpl2.java
  - **util**
  - **vo**
  - SpringBootDemoApplication.java

### Dao layer
```java {filename="repository/EnrollmentRepository.java"}
package ...

import ...Enrollment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {

}
```

### Service layer
```java {filename="EnrollmentServiceImpl.java"}
@Service
public class EnrollmentServiceImpl implements EnrollmentService {
  @Autowired
  EnrollmentRepository enrollmentRepository;

  @Autowired
  HistoryRepository historyRepository;
}
```