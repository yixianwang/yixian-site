+++
title = 'MEMO'
date = 2025-10-25T17:21:05-04:00
draft = true
+++

## pre-requisite
1. Extension Pack for Java (Microsoft)
2. Debugger for Java (usually included via the pack)
3. Also make sure VS Code is using your JDK (Java 17/21 etc):
4. Ctrl+Shift+P → Java: Configure Java Runtime
5. Ensure JAVA_HOME is set (System env) and matches what you want.

## .vscode/tasks.json
```
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "boot:run (debug 5005)",
      "type": "shell",
      "command": "mvn -q -DskipTests spring-boot:run -Dspring-boot.run.jvmArguments=\"-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:5005\"",
      "options": {
        "cwd": "${workspaceFolder}"
      },
      "problemMatcher": []
    },
    {
      "label": "boot:run (normal)",
      "type": "shell",
      "command": "mvn -q -DskipTests spring-boot:run",
      "options": {
        "cwd": "${workspaceFolder}"
      },
      "problemMatcher": []
    }
  ]
}
```

## .vscode/launch.json
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to Spring Boot (5005)",
      "type": "java",
      "request": "attach",
      "hostName": "127.0.0.1",
      "port": 5005
    }
  ]
}
```

## profile
```
mvn spring-boot:run ^
  -Dspring-boot.run.profiles=local ^
  -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=127.0.0.1:5005"

```