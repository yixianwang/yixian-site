+++
title = 'Conda'
date = 2023-10-24T03:10:46-04:00
+++

## Basics
```bash
conda env list
conda create -n env_name python=3.11 --no-default-packages
conda env remove -n ENV_NAME
```

## Export to yml file
```bash
# after conda activate env_name
conda export env > env_test.yml
```

## Create env with yml file
```bash
conda env create –f xxx.yml
```

## Make a copy of a conda environemnt
```bash
conda create --clone env_name -n new_env_name
```

## Upgrade package
```bash
pip install <package_name> --upgrade
```

## Update conda to the current version
```bash
conda update conda
```