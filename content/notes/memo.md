+++
title = 'MEMO'
date = 2025-10-25T17:21:05-04:00
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

## x

With **16GB RAM + big Java/Maven repo**, your goal is: **reduce file watching/indexing**, **cap Java language server**, and **avoid scanning build outputs**. Do these in this order.

## 1) Exclude build outputs everywhere (highest impact)

Open **Settings (JSON)** and add/merge:

```json
{
  "files.watcherExclude": {
    "**/.git/**": true,
    "**/target/**": true,
    "**/build/**": true,
    "**/out/**": true,
    "**/.gradle/**": true,
    "**/.mvn/**": false
  },
  "search.exclude": {
    "**/target/**": true,
    "**/build/**": true,
    "**/out/**": true,
    "**/node_modules/**": true
  },
  "files.exclude": {
    "**/target/**": true,
    "**/build/**": true
  }
}
```

Why: on big repos, `target/` churn is the #1 VS Code killer.

## 2) Cap Java Language Server memory (don’t let it eat your machine)

Add:

```json
{
  "java.jdt.ls.vmargs": "-Xms256m -Xmx2048m -XX:+UseG1GC -XX:+UseStringDeduplication -Dsun.zip.disableMemoryMapping=true"
}
```

* `-Xmx2048m` is a good ceiling on 16GB (you still need RAM for Chrome, Maven builds, etc.).
* If you notice OOM in Java features, bump to **3072m**, but don’t go higher unless you must.

When things get sluggish:

* `Ctrl+Shift+P` → **Java: Clean Java Language Server Workspace** (it often fixes “mysterious lag”).

## 3) Kill expensive UI features (small but steady wins)

```json
{
  "editor.minimap.enabled": false,
  "editor.codeLens": false,
  "breadcrumbs.enabled": false,
  "git.autofetch": false
}
```

If you like CodeLens for tests, keep it on—but it costs CPU on big projects.

## 4) Stop VS Code from doing “smart” stuff in huge files

```json
{
  "editor.largeFileOptimizations": true,
  "files.maxMemoryForLargeFilesMB": 4096
}
```

## 5) Extensions: go on a diet

In a big repo, too many extensions = death by a thousand cuts.

* Disable anything not essential (Docker/K8s, Python, extra linters, spell-checkers, multiple AI tools, etc.)
* Prefer **Disable (Workspace)** so other projects aren’t affected.

## 6) Windows Defender exclusions (often a *huge* win)

Exclude:

* Your repo directory
* Maven cache: `C:\Users\<you>\.m2\repository`

This can speed up both indexing and `mvn` runs a lot.

## 7) Don’t import the whole world into Java

If you opened a parent folder containing many repos, VS Code Java will try to be “helpful” and index everything. Open the **exact repo root** you’re working on.

---

### A good “senior” workflow for big repos in VS Code

* Run Spring Boot via **terminal/tasks** (Maven controls build)
* Use VS Code primarily for navigation + attach debugging
* Keep Java language server memory capped and avoid indexing `target/`

If you paste:

* your current `.vscode/settings.json` (or global settings JSON), and
* roughly how many Maven modules,
  I can suggest a tighter exclude pattern and whether `-Xmx2G` is enough or you should go `3G`.