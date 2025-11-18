+++
title = 'MEMO'
date = 2025-10-25T17:21:05-04:00
draft = true
+++

## Runtime Error Challenge
- The issue is from the group unique index, (PUID, CD, TIMESTAMP), the timestamp not granually enough.

## Query Performance issue
- The issue comes from the CTE contains many rows, and when join back to the main query, it's very slow

## Context pass along
- How to pass context back and forth

## 