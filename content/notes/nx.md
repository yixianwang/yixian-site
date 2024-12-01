+++
title = 'Nx'
date = 2024-12-01T00:55:44-05:00
+++

- [doc](https://nx.dev/getting-started/tutorials/angular-monorepo-tutorial)

## helper
- `npx nx list @nx/angular`
- `--dry-run`

## generate monorepo project
- `npx create-nx-workspace@latest monorepo-name --preset=angular-monorepo`

## generate app
- `npx nx g @nx/angular:app apps/app-name`

## generate component
### @nx/angular:component
- full path: `npx nx g c remotes/pool-transfer/src/app/mams-apps-pts/components/request-details/request-details`

### @schematics/angular:component
- relative path: `npx nx g c my-component --project=project-name`

## generate library
- `npx nx g @nx/angular:lib libs/lib-name`
