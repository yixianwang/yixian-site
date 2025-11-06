+++
title = 'colab_tips'
date = 2023-10-24T03:10:46-04:00
draft = true
+++

colab tips
Seems like colab is popular, so I wanted to share maybe some useful tips that helped me streamline my setup/workflow:

a) If you cloned the notebook and are using gdrive to store the data, you can only mount gdrive using the python package, which requires entering a new oauth code for each session; if you create a new notebook, it actually persists the mount between sessions. You can just copy the contents over - https://datascience.stackexchange.com/questions/64486/how-to-automatically-mount-my-google-drive-to-google-colab


b) You can run this code in a cell to extend sessions (prevent timeouts); it also doesn't majorly use the CPU unnecessarily. Still, as this SO points out, it's not morally right to hog up a GPU/CPU if you're not using it. I use it when I'm actively developing over ssh, but not running anything on the notebook.
```

import time

while True: time.sleep(10)
```
c) You can ssh into the machine; someone even made a package for that - https://pypi.org/project/colab-ssh/#description. I usually use ipdb to do REPL-driven development and explore the data, so this is really useful for me since I can't run this workload locally. Head's up - it does take a bit of setup, but if you persist the extra python packages and the authorized_hosts file, you can get it up and running for new sessions quickly.

```
import os
import sys

# set up persistent pip library path
nb_path = '/content/drive/My Drive/Colab Notebooks/pip'
!mkdir -p '{nb_path}'
sys.path.insert(0, nb_path)
!pip install --target='{nb_path}' ipdb
!pip install --target='{nb_path}' colab_ssh --upgrade
```
```
!ln -sr /content/drive/MyDrive/nlp-qa-finalproj/.ssh ~/
!cat ~/.ssh/authorized_keys
```
Hope this helps, good luck!


