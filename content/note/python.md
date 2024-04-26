+++
title = 'Python'
date = 2023-10-24T03:10:46-04:00
+++

## Typing
```python
from typing import reveal_type
```

## Logging
### V0
```python
import logging
logging.basicConfig(level=logging.INFO)
logging.info("Just an information")
```

### V1
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
