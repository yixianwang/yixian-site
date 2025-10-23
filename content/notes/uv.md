+++
title = 'UV'
date = 2025-10-22T22:49:34-04:00
+++

# 1) What uv is (why use it)

* Ultra-fast project/env manager—replaces `python -m venv`, much of `pip`, `pip-tools`, `pipx`, and parts of Poetry/pyenv workflows. It does envs, dependency locking, and tool running. ([Astral Docs][1])

# 2) Install uv

* macOS/Linux (user local):
  `curl -LsSf https://astral.sh/uv/install.sh | sh`
* Windows (PowerShell):
  `irm https://astral.sh/uv/install.ps1 | iex`
  (These are from the official docs “Getting started”.) ([Astral Docs][1])

# 3) Create & manage virtual environments

* **New env in `.venv`:** `uv venv`
* **Named path:** `uv venv .venv-dev`
* **Pick Python version:** `uv venv --python 3.11` (uv can download/resolve versions for you). ([Astral Docs][2])
* **Project conventions:** `.venv` holds the env; optional `.python-version` pins default Python for the project. ([Astral Docs][3])

> Note: You usually **don’t activate** the env. Instead, run commands **inside** it with `uv run` (next section). ([Astral Docs][4])

# 4) Running things in the env (no “activate” needed)

* **Run Python/script within the project env:**
  `uv run python -V`
  `uv run pytest -q`
  `uv run -- python script.py` (use `--` to separate uv options from your command).
  `uv run` ensures the env is up-to-date before running. ([Astral Docs][4])

# 5) Declaring dependencies (pyproject.toml)

* Put deps in **`pyproject.toml`** (standard):

  ```toml
  [project]
  dependencies = ["httpx", "ruff>=0.3.0"]

  [project.optional-dependencies]
  dev = ["pytest"]
  ```
* uv understands this and manages install/lock accordingly. ([Astral Docs][5])

# 6) Adding/removing packages (edit pyproject + install + lock)

* **Add:** `uv add fastapi`

  * With versions/extras: `uv add "httpx>0.27"`, `uv add "uvicorn[standard]"`
  * Dev deps: `uv add --dev pytest`
* **Remove:** `uv remove httpx`
  These commands update `pyproject.toml`, install into `.venv`, and keep the lock in sync. ([Astral Docs][6])

# 7) Locking & syncing (reproducibility)

* **Lock:** `uv lock` → writes **`uv.lock`** (pin versions).
* **Sync env to lock:** `uv sync` (installs exactly what’s in `uv.lock`).
* Use `--frozen` to prevent lock updates during runs: `uv run --frozen pytest`. ([Astral Docs][7])
* You can also export/compile to `requirements.txt` if needed:
  `uv pip compile pyproject.toml -o requirements.txt`. ([Astral Docs][8])
* Treat `uv.lock` like Poetry’s lock: commit it; don’t edit by hand. ([SaaS Pegasus][9])

# 8) Installing/inspecting like pip (drop-in)

* **Install into current env:** `uv pip install .` or `uv pip install "pydantic<2"`
* **List/freeze/tree/check:** `uv pip list | freeze | tree | check`
  This mirrors common `pip` commands, but faster/stricter. ([Astral Docs][10])

# 9) Tools & one-off binaries (like `pipx`)

* **Run tools without installing into your project:**
  `uvx ruff`  (alias for `uv tool run ruff`)
  Pin versions: `uvx ruff@latest`, or `uvx --from "ruff==0.5.0" ruff check`
* You can also **install** tools globally with uv’s tool interface if desired. ([Astral Docs][11])

# 10) Typical project workflow (cheat sheet)

```bash
# new or existing repo
uv venv --python 3.12         # create .venv with Python 3.12
uv add --dev pytest           # add test dep
uv add httpx ruff             # add runtime deps
uv lock                       # produce uv.lock
uv run pytest                 # run tests in the env
uv sync                       # re-sync others to uv.lock (CI/teammates)
uv run ruff check .           # run tool from project env
# one-off tool outside project
uvx black@latest --version
```

# 11) Tips & gotchas

* **No activation needed:** prefer `uv run …`. If you *do* activate: `source .venv/bin/activate` (POSIX) still works, but uv is designed to avoid it. ([Astral Docs][4])
* **Pin Python:** put `3.12` (etc.) in `.python-version` so `uv venv` uses it. ([Astral Docs][3])
* **Lock discipline:** in CI or releases, use `uv run --frozen …` so `uv.lock` won’t change unexpectedly. ([GitHub][12])
* **Strictness vs pip:** uv enforces some specs more strictly than pip; if something fails that pip would install, check the package index/links. ([Astral Docs][13])
* **Exporting for non-uv users:** if teammates still want `requirements.txt`, use `uv pip compile` (above). ([Astral Docs][8])

# 12) Cleaning up

* Remove caches and uv-managed Pythons/tools if you ever uninstall:
  `uv cache clean` then remove uv dirs/binaries per docs. ([Stack Overflow][14])

If you tell me your repo layout (do you already have a `pyproject.toml`? target Python?), I’ll give you a drop-in **Makefile** or **CI snippet** using `uv run --frozen` and `uv sync`.

[1]: https://docs.astral.sh/uv/?utm_source=chatgpt.com "uv - Astral Docs"
[2]: https://docs.astral.sh/uv/pip/environments/?utm_source=chatgpt.com "Using environments | uv - Astral Docs"
[3]: https://docs.astral.sh/uv/guides/projects/?utm_source=chatgpt.com "Working on projects | uv - Astral Docs"
[4]: https://docs.astral.sh/uv/concepts/projects/run/?utm_source=chatgpt.com "Running commands in projects - uv - Astral Docs"
[5]: https://docs.astral.sh/uv/pip/dependencies/?utm_source=chatgpt.com "Declaring dependencies | uv - Astral Docs"
[6]: https://docs.astral.sh/uv/concepts/projects/dependencies/?utm_source=chatgpt.com "Managing dependencies | uv - Astral Docs"
[7]: https://docs.astral.sh/uv/concepts/projects/sync/?utm_source=chatgpt.com "Locking and syncing | uv - Astral Docs"
[8]: https://docs.astral.sh/uv/pip/compile/?utm_source=chatgpt.com "Locking environments | uv - Astral Docs"
[9]: https://docs.saaspegasus.com/python/uv/?utm_source=chatgpt.com "Working with Python Packages (uv)"
[10]: https://docs.astral.sh/uv/getting-started/features/?utm_source=chatgpt.com "Features | uv - Astral Docs"
[11]: https://docs.astral.sh/uv/guides/tools/?utm_source=chatgpt.com "Using tools | uv - Astral Docs"
[12]: https://github.com/astral-sh/uv/issues/10845?utm_source=chatgpt.com "`uv run` changes uv.lock files · Issue #10845 · astral-sh/uv"
[13]: https://docs.astral.sh/uv/pip/compatibility/?utm_source=chatgpt.com "Compatibility with pip | uv - Astral Docs"
[14]: https://stackoverflow.com/questions/78076401/uninstall-uv-python-package-installer?utm_source=chatgpt.com "linux - Uninstall uv Python package installer"
