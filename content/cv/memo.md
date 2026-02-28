## Projects
### PTS UI && SERVICE
### DCTR SERVICE CI
### HMBS BRE SERVICE
### RECERTIFICATION SERVICE
### HUD11708 SERVICE
### BATCH JOB

## Challenges
### Virtual thread block the other thread
1. jps -l # to list java process, find springboot Application.class process
2. jcmd 12345 Thread.print
<!-- 2.legacy jstack 12345 # thread dump, to debug thead deadlock, stuck threads: look for BLOCKED, and WAITING threads -->
3. jcmd 12345 VM.flags # inspect JVM flags
4. jcmd 12345 GC.heap_info
<!-- 4.legacy jmap -heap 12345 # memory dump, to debug memory leak -->
5. jcmd PID VM.command_line # inspect JVM arguments

### BRE performance: stream dao layer for large query, separate query to avoid large CTE, virtual thread
### Production defect: WAF rule
### DB Unique index constraint bug for efficient code
### Drool syntax: && cannot skip second part, comma can skip second part
### Not code related: not coding error, need to push back to not coding error
### jdk25 bugs:
2. jackson 3, cannot use primitive boolean in payload
### sb4 bugs:
1. queryForObject always throw EmptyResultDataAccessException if set fetchSize globally, we should use for each preparedStatement for each query 
### improve query performance
1. reduce the size of CTE (common table expression)
2. landing on index (most of time)
3. improve table join