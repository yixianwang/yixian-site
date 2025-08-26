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

## Vim setup
1. Press Ctrl + Shift + P (Cmd + Shift + P on Mac)
2. Type "Preferences: Open User Settings (JSON)"
```
    "vim.normalModeKeyBindingsNonRecursive": [
        {
        "before": ["g", "r"],
        "commands": ["references-view.findReferences"]
        },
        {
        "before": ["g", "R"],
        "commands": ["editor.action.referenceSearch.trigger"]
        },
        {
        "before": ["g", "d"],
        "commands": ["editor.action.revealDefinition"]
        },
        {
        "before": ["g", "D"],
        "commands": ["editor.action.revealDeclaration"]
        },
        {
        "before": ["g", "i"],
        "commands": ["editor.action.goToImplementation"]
        }
    ]
```
3. Restart VSCode or reload the window (Ctrl + Shift + P → "Developer: Reload Window")