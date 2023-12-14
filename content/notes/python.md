+++
title = 'Python'
date = 2023-10-24T03:10:46-04:00
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

## Typing
```python
from typing import reveal_type
```

## Logging
```python
# importing module
import logging

# Create and configure logger
logging.basicConfig(filename="newfile.log",
					format='%(asctime)s %(message)s',
					filemode='w')

# Creating an object
logger = logging.getLogger()

# Setting the threshold of logger to DEBUG
logger.setLevel(logging.DEBUG)

# Test messages
logger.debug("Harmless debug Message")
logger.info("Just an information")
logger.warning("Its a Warning")
logger.error("Did you try to divide by zero")
logger.critical("Internet is down")
```
