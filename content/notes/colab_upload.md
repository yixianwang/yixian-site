+++
title = 'colab_upload'
date = 2023-10-24T03:10:46-04:00
draft = true
+++

import os
from getpass import getpass
import urllib

user = input('User name: ')
password = getpass('Password: ')
password = urllib.parse.quote(password) # your password is converted into url format
repo_name = "gregdurrett/nlp-qa-finalproj.git"
cmd_string = 'git clone https://{0}:{1}@github.com/{2}'.format(user, password, repo_name)

!{cmd_string}
