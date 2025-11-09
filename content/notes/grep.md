+++
title = 'Grep'
date = 2025-11-08T22:13:55-05:00
+++

## Alias for chekcing logs
```bash
alias grepless='grep --color=always "$@" | less -R'
# grepless "error" *.log
```