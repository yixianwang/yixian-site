+++
title = 'Nx'
date = 2024-12-01T00:55:44-05:00
+++

- [doc](https://nx.dev/getting-started/tutorials/angular-monorepo-tutorial)

## helper
- `npx nx list @nx/angular`

## useful properties and tips
- `--dry-run`
- `--skip-tests`
- `@nx/angular:xxx` is optional, we can directly use xxx, and then choose.

## generate monorepo project
- `npx create-nx-workspace@latest monorepo-name --preset=angular-monorepo`

## generate app
- `npx nx g app apps/app-name`

## generate component/directive/pipe/service
- `npx nx g c|d|p|s full-path --skip-tests`

## generate library
- `npx nx g lib libs/lib-name`
