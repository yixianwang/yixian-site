+++
title = 'Google Cloud'
date = 2023-10-24T03:10:46-04:00
+++

## Connect to Google cloud
ssh -i ~/.ssh/xxxxxx xxxxxxxxxx@33.333.3.333          

## Generate ssh keys
ssh-keygen -t rsa -f ~/.ssh/xxxxxx -C "xxxxxx"

## copy files from local to server
scp -i ~/.ssh/my-ssh-key LOCAL_FILE_PATH USERNAME@IP_ADDRESS:~
scp -i ~/.ssh/my-ssh-key -r LOCAL_FOLDER_PATH USERNAME@IP_ADDRESS:~

## Others
gcloud compute scp /Users/xxxxxxxxxx/Desktop/folders/model.py nlp-cpu:~/
gcloud compute scp --recurse [INSTANCE_NAME]:[REMOTE_DIR] [LOCAL_DIR]



