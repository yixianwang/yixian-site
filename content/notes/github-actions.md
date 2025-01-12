+++
title = 'Github Actions'
date = 2025-01-11T23:35:19-05:00
+++

## File Structure
- `.github/workflows/**.yml`: Github Actions workflow files
```yml
on: push # trigger event

jobs: # define jobs, jobs are running in parallel
  job1: # random job name
    runs-on: ubuntu-latest # runner
    steps: # define steps, steps are running in sequence
      - run: pwd
      - run: ls
  job2:
    runs-on: windows-latest
    steps:
      - run: node --version
```