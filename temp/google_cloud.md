+++
title = 'google_cloud'
date = 2023-10-24T03:10:46-04:00
draft = true
+++

## Connect to Google cloud
ssh -i ~/.ssh/google_compute_engine yixianwang@34.134.2.121          

## Generate ssh keys
ssh-keygen -t rsa -f ~/.ssh/yixian -C "yixian"

## copy files from local to server
scp -i ~/.ssh/my-ssh-key LOCAL_FILE_PATH USERNAME@IP_ADDRESS:~
scp -i ~/.ssh/my-ssh-key -r LOCAL_FOLDER_PATH USERNAME@IP_ADDRESS:~

## Others
gcloud compute scp /Users/yixianwang/Desktop/spring2021/nlp/nlp-qa-finalproj/model.py nlp-cpu:~/
gcloud compute scp --recurse [INSTANCE_NAME]:[REMOTE_DIR] [LOCAL_DIR]



