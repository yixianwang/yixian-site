# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal website for Yixian Wang built with **Hugo** (static site generator) using the **Hextra** theme (`github.com/imfing/hextra`). Deployed to GitHub Pages at `https://yixianwang.github.io/`.

## Common Commands

```bash
# Local development server (with drafts and future posts)
hugo server --buildDrafts --disableFastRender

# Production build
hugo --gc --minify

# Create new content
hugo new content/blog/my-post.md
hugo new content/notes/my-note.md
hugo new content/projects/my-project.md

# Update Hextra theme
hugo mod get -u github.com/imfing/hextra

# Update all Hugo modules
hugo mod get -u

# Tidy modules
hugo mod tidy

# Full deploy (sync, build, push source + public)
./push.sh
```

## Architecture

### Dual-repo deployment model
The `public/` directory is a **separate git repository** that maps to the GitHub Pages site. The `push.sh` script orchestrates: pull source -> commit source -> hugo build -> commit+push `public/`. Never delete `public/.git` or `public/.github`.

### Content structure
- `content/blog/` — Blog posts (TOML front matter `+++...+++`, use `<!--more-->` for summary break)
- `content/notes/` — Technical notes (largest section, 129+ files)
- `content/projects/` — Project portfolio (includes `startDate`/`endDate` fields)
- `content/cv/` — CV section
- `content/_index.md` — Home page

### Front matter format
All content uses **TOML** front matter (delimited by `+++`). New content starts as `draft = true`. Archetypes in `archetypes/` define templates for each content type.

### Configuration
- `hugo.yaml` — Main Hugo config (menu, params, markup settings)
- `go.mod` — Hugo module dependencies (requires Go 1.26+)
- `netlify.toml` — Netlify build config (Hugo 0.159.1)
- `.devcontainer/` — Dev container setup with Hugo extended + Node.js

### Static assets
- `static/images/`, `static/datasets/`, `static/pdfs/` — Served at site root
