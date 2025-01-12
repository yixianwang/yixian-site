+++
title = 'IDEA'
date = 2025-01-11T20:19:11-05:00
+++

## Intellij SpringBoot DevTools Setup
- Add `spring-boot-devtools` in pom.xml
- `Settings` - `Build,Execution,Deployment` - `Compiler`, enable `Build project automatically`
- `Settings` - `Advanced Settings`, enable `Allow auto-make to start even if developed application is currently running`
- `Disable cache` on browser

```XML
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>
```

```YAML
spring.devtools.restart.enabled=true
spring.devtools.restart.additional-paths=src/main/java
spring.devtools.restart.exclude=WEB-INF/**
```

## Debug
### Line Breakpoint (red circle)
- Condition: must put a expression returns a boolean
- Stream: `Trace Current Stream Chain`
- Force Return: Debug Window -> Debugger -> Function Name(right click) -> `Force Return`
- Throw Exception: same as above
- Multi Thread: Right click break point -> Enable `Suspend` with `Thread`
### Method Breakpoint (red diamond)
- Most of time use in Java interface
### Field Watchpoint (red eye)
### Exception Breakpoint (red thunder)
- Manually add `Java Exception Breakpoints`

## ideaVim
```
diw
di"
ciw
ci"

cit // delete within tag

dt> // delete to >
ct> // delete to >
```



