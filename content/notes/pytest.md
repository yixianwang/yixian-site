+++
title = 'Pytest'
date = 2023-12-13T23:22:40-05:00
+++

## Pytest
### 1. for all files' name leading with test_
```bash
pytest
```
### 2. for single module the functions should leading with `test_`
```python
def test_fun1():
    assert 1 == 3
```
#### run pytest
```
python -m pytest XXX.py
```