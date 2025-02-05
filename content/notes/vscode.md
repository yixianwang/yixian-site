+++
title = 'Vscode'
date = 2025-02-05T13:59:12-05:00
+++

## Attach Java Debugger
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "java",
      "name": "Attach to Spring Boot",
      "request": "attach",
      "hostName": "localhost",
      "port": 5005
    }
  ]
}

/*
mvn -Plocal spring-boot:run -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
*/
```
