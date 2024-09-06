+++
title = 'Prompts'
date = 2024-08-15T16:45:00-04:00
+++

## Resume bullet points
```
how to convert my the following description into one sentence that I can use in resume: "> Managed Kubernetes Cluster, meaning AWS will manage the **Master Nodes** for us. It will create the master nodes. Install all the necessary applications on them, like **Container Runtime**, Kubernetes **Master Processes**. It will take care of scaling it when needed, doing backup on that, etc. If you have small team of people, usually it's a good idea to let the platform do this maintenance for you. So we can focus on deploying your applications in K8s without worrying about whether the master nodes are properly backed up etc. This means we only have to care about the worker nodes.

> **we will have a control plane once AWS creates all master nodes**(by choosing cluster name, k8s version, choose region and VPC, set Security Group for the cluster). 
> **Then, we have to create worker nodes and connect to the cluster**(by creating Node Group, and choose the cluster it attaches to, define Security Group, select instance type of EC2 instances, basically which resources your EC2 instances should have, etc.). On AWS these worker nodes will be some EC2 instances with certain CPU RAM and Storage Resources. With Node Group, we should have auto-scaling. So based on the cluster needs, depend on how much load the cluster has, the new worker nodes will automatically be added or removed in the cluster. So for that we should define max and min number of nodes, and we have some other configurations as well.
> **Finally connect to the cluster from local machine,** to deploy our applications from laptop using kubectl, which is k8s command line tool. It basically uses configured kubectl to talk to remote cluster."
```

```
please give me 2 descriptions that I can use in resume for ELK experience. 
```

