+++
title = 'Windows'
date = 2024-11-04T08:17:49-05:00
+++

## Find and Kill process
```bash
netstat -ano | findstr :4200
taskkill /PID <PID> /F
```
