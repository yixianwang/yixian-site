#!/usr/bin/env bash
set -euo pipefail

# ---- helpers ---------------------------------------------------------------
run() {
  echo "→ $*"
  if ! "$@"; then
    echo "❌ Error running: $*"
    exit 1
  fi
}

has_changes() {
  # true (0) if there are staged/unstaged changes
  ! git diff --quiet || ! git diff --cached --quiet
}

# ---- preflight -------------------------------------------------------------
if ! command -v git >/dev/null 2>&1; then
  echo "❌ git not found in PATH"
  exit 1
fi

if ! command -v hugo >/dev/null 2>&1; then
  echo "❌ hugo not found in PATH"
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "❌ Not inside a git repository"
  exit 1
fi

# ---- step 1: sync with main -----------------------------------------------
echo "🔄 Checking out and pulling latest from main..."
run git pull origin main

# ---- step 2: push changes to main repo ------------------------------------
echo "🔄 Pushing to main repo..."
run git add -A
if has_changes; then
  run git commit -m "update"
else
  echo "ℹ️ No changes to commit in root."
fi
run git push

# ---- step 3: clean and build with Hugo ------------------------------------
echo "🧹 Cleaning old public/ files (except .git and .github)..."
find ./public -mindepth 1 -not -path "./public/.git/*" -not -path "./public/.github/*" -print0 | xargs -0 rm -rf

echo "🏗️ Running Hugo build..."
run hugo

# ---- step 4: push 'public' (if it's a git repo) ---------------------------
PUBLIC_DIR="public"
if [[ -d "$PUBLIC_DIR" ]]; then
  echo "📂 Entering '$PUBLIC_DIR'..."
  if git -C "$PUBLIC_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    run git -C "$PUBLIC_DIR" add -A
    if git -C "$PUBLIC_DIR" diff --quiet && git -C "$PUBLIC_DIR" diff --cached --quiet; then
      echo "ℹ️ No changes to commit in '$PUBLIC_DIR'."
    else
      run git -C "$PUBLIC_DIR" commit -m "update"
    fi
    run git -C "$PUBLIC_DIR" push
  else
    echo "⚠️ '$PUBLIC_DIR' exists but is not a git repo. (If it's a submodule, initialize it.)"
    echo "   To make it a repo: (cd $PUBLIC_DIR && git init && git remote add origin <URL>)"
  fi
else
  echo "❌ '$PUBLIC_DIR' folder does not exist. Did Hugo build fail?"
  exit 1
fi

echo "✅ Sync, build, and push complete."
