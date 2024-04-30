+++
title = 'Poetry'
date = 2023-12-13T23:55:00-05:00
+++

## Install poetry
```bash
pip install poetry
```

## Create a new project
```bash
# in work directory
poetry new name_of_project
```

## Manage dependencies
### 1. modify pyproject.toml
```toml
[tool.poetry.dependencies]
scikit-learn = "*"
```
### 2. CLI
```bash
poetry add pytest
```
#### best practice for testing dependencies
```toml
[tool.poetry.group.dev.dependencies]
pytest = "^7.2.1"
pytest-mock = "*"
```

## Activate environment in terminal
```bash
# activate
poetry shell
# deactivate
exit
```

## Install dependencies specified in pyproject.toml file, or .lock file
```bash
poetry install
```

## Run with Poetry-configured Env via CLI
```bash
poetry run python xxx.py
```

## Building a library
```bash
poetry build
```

## Publish to PyPI
```bash
poetry publish –r private-repository-location
```