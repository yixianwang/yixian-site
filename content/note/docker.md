+++
title = 'Docker'
date = 2023-11-09T01:33:02-05:00
+++


# --help
```
docker --help anything
```

## install
```
brew install docker --cask
docker run --rm hello-world
```

## Create a docker container: long version
### container
```
docker container create ###
docker container create hello-world:linux # Does not start containers
```

### list container we have created
```
docker ps
docker ps --all
```

### start container
```
docker container start DockerID
```

### log
### Approach 1
```
docker logs *** # with first three characters of DockerID
```

#### Approach 2: even if the container already started
```
docker container start --attach ***
```


## Create a docker container: short version
```
docker run hello-world:linux
```

> `docker run` = `docker container create` + `docker container start` + `docker container attach`

### use ps to get IDs for containers started with the docker run
```
docker ps --all
```

### also can use log
```
docer logs *** # with first three characters of DockerID
```

## Create a Docker Container from Dockerfiles

### Exercies Files > `03_05`

```
vim Dockerfile
```

#### FROM
Tells Docker which existing Docker image to base your Docker image off.
This can be any existing image, either local or from the internet.
By default, Docker will try to get this image from Docker Hub if it's not already on your machine.

#### LABEL
Some images will contain a **label** adding additional data like the maintainer of this image.

#### USER
Tells Docker which user to use for any Docker file commands underneath it.

By default, Docker will use the `root user` to execute commands.
Since most security teams do not like this, the `USER` keyword is useful in changing a user that your app runs as to one that is less powerful, like "nobody" for example `USER nobody`.

#### COPY
Copies files from a directory provided to the Docker build command to the container image.
The directory provided to Docker build is called `context`.
The `context` is usually your working directory, but it does not have to be.

#### RUN
Run statements are commands that customize our image.
This is a great place to install additional software, or configure files needed by your application.

#### USER
Uses `USER nobody` to set the default users for containers created from this image to the powerless `nobody` user.
This ensure that we cannot break out of the container, and potentialy change important files on our host.

#### ENTRYPOINT
Tells Docker what command containers created from this image should run.
We can also use the `CMD` command to do this, though there are differences.
`CMD command can be used as well`


### Exercies Files > `03_05`
#### turn Dockerfile into a Docker image, and start our container from it
```
docker build --help
```

##### -t, --tag list
Just like containers, every Docker image has an ID.
This option associates a convenient name with that ID.
This way, we don't have to remember the image ID whenever we use it.
```
docker build -t our-first-image
```

##### -f, --file string
Dockerfile looks for a file called `Dockerfile` by default.
Since this is what our dockerfile is actually called, we don't need to change anything.
However, if our dockerfile were called something else, we need to provide `-f, --file` options as well.
```
docker build -t our-first-image --file app.Dockerfile
```

##### after providing options, we need to tell docker where its context is
context is simply the folder containing files that docker will include in our image.
Since the `ENTRYPOINT` is in your working directory already, we can simply put a period here.
```
docker build -t our-first-image .
```
If we were located in another folder, like say path/to/app
```
docker build -t our-first-image /path/to/app
```

##### after image has been sucessfully built and tagged, we are ready to run a container from that image
```
docker run our-first-image
```

### Exercies Files > `03_06`
> We can also run containers that do not immediately exit after `ENTRYPOINT` command, like servers for example

#### server.Dockerfile
#### COPY
Copying a file called `server.bash` instead of `entrypoint.bash`

#### build and start a container
```
docker build --file server.Dockerfile --tag our-first-server .
```

#### stop the container
```
docker run our-first-server # not prefered
docker ps
docker kill ****
```

#### create a container from the image
Create and starts the container, but doesn't attach my terminal to it.
```
docker run -d our-server # run in background
docker ps # to prove our docker is running
```

#### run additional commands
Use docker exec to run additional commands from this container.
This can be helpful while troubleshooting problems or testing images created by your application's Dockerfile.
e.g. use date command to get the time from this container
```
docker exec *** date
```

#### docker terminal
```
docker exec --interactive --tty *** bash
```

## Stop and removing the container
```
docker stop ID # quit
docker stop ID -t 0 # force quit
docker rm ID
```

```
docker ps -aq # only show IDs
docker ps -aq | xargs docker rm
```

## Remove images
```
docker images # list all images
docker rmi tagname1 tagname2 ...
```

## Binding ports to our container
### Exercise Files > `03_08`

#### build image from dockerfile
```
docker build -t our-web-server -f web-server.Dockerfile .
```

#### start a container with docker run and background it with -d
```
docker run -d our-web-server
```

##### name container
```
docker run -d --name our-web-server our-web-server
```

#### logs with name of container
```
docker logs our-web-server
```
it doens't work then we need to stop and remove the container at the same time

#### stop and remove container at the same time, with the name of container
```
docker rm -f our-web-server
```

#### map some ports
```
                                   outside : inside
docker run -d --name our-web-server -p 5001:5000 our-web-server
```

## Saving data from containers
### Exercise Files > `03_08`

#### trivial example  
```
docker run --rm --entrypoint sh ubuntu -c "echo 'Hello there.' > /tmp/file && cat /tmp/file"
```

#### map folder(or map file, !!!file must be exist) with -v, --volume
```
docker run --rm --entrypoint sh -v /tmp/container:/tmp ubuntu -c "echo 'Hello there.' > /tmp/file && cat /tmp/file"
```

## Docker Hub
### Exercise Files > `03_08`

### log in to Docker Hub form Docker CLI
```
docker login
```

### pushing our-web-server into Docker Hub
- Tell docker that this image is going to be pushed into a registry: We need to rename the image, so that it contains our username.
> `docker tag` renames docker images
```
docker tag our-web-server mrtutu/our-web-server:0.0.1
docker push mrtutu/our-web-server:0.0.1
```

## Challenge & Solution: NGINX
> Exercise Files > `03_14_before`

- Start an instance of NGINX in Docker with the included website
- Name the container **"website"**
- Website should be accessible at **http://localhost:8080**
- Ensure that the container is removed when done
- Map "$PWD/website" to "/user/share/nginx/html" if you volume mount
- Hve fun!

```
docker run --name website -v "$PWD/website:/usr/share/nginx/html" -p 8080:80 --rm nginx
docker ps -a
```

## Create more containers
1. remove images
```
docker rmi tagname1 tagname2 ...
```

2. remove useless
```
docker system prune
```

## Make container faster
```
docker run --name=alpine --entrypoint=sleep -d alpine infinity
```

```
# docker stats ID(or name of the container)
docker stats alpine

# Solve it, alpine here is also the name of the container
docker exec -i -t alpine sh
```

### Docker top
- shows what's running inside of the container without having to exec into it
```
docker exec -d alpine sleep infinity
docker exec -d alpine sleep infinity
docker exec -d alpine sleep infinity
```

### Docker inspect
- show you advanced information about a container that's running in JSON format
```
docker inspect alpine | less
```

## Challenge & Solution: Fix broken container
> Exercise File > `04_03_before`

- Fix the dockerfile and script provided
- you will see the notice of application complete when the container is working properly.

- Hint1: use the `-it` flag when runing our container
- Hint2: use `docker ps` and `docker rm` in another terminal if ours hangs.

### Solution:
```
docker build -t app .
```

- Then change `xeniall` to `xenial` then it can build

```
docker build -t app .
docker run -it --name=app_container app
```

- when the container is running we run 
```
docker stats app_container # we will see cpu is high
```

```
docker top app_contianer # we will see there is timeout and yes
```

- This means we need to modify the app that's used by this dockerfile and **rebuild** this image
```
docker build -t app .
docker run -it --name=app_container app
docker rm app_container
docker run -it --name=app_container app
```

## Best Practice
1. Use: verifeid image or image scanner(Clair, Trivy, Dagda)
2. Avoid latest: use v1.0.1
3. Use non-root users: --user flag: `docker run --rm --it --user somebody-else suspect-image:v1.0.1`

## Docker Compose
- Docker Compose makes starting and connecting multiple containers as easy as docker-compose up
- [Docker Compose Doc](https://docs.docker.com/compose)

## Kubernetes
It's a popular **container orchestrator** capable of managing very large numbers of containers.
- Kubernetes uses a distributed architecture to run and connect hundreds of thousands of containers with minimal hardware.
- Kubernetes also makes grouping, scaling, and connecting containers with the outside world really easy.
- Load balancing and securing container traffic to/from the outside world are much easier with Kubernetes.
- The Kubernetes ecosystem makes it possible to build your own developer experience.
