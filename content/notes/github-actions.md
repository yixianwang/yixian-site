+++
title = 'Github Actions'
date = 2025-01-11T23:35:19-05:00
+++

## File Structure
- `.github/workflows/**.yml`: Github Actions workflow files

### Example
```yml
name: workflow Name # workflow name
on: push # trigger event

permissions: # to avoid bugs when add fake-deploy step
  contents: write

jobs: # define jobs, jobs are running in parallel
  npm-build: # random job name
    name: npm build job # job name
    runs-on: ubuntu-latest # runner
    
    steps: # define steps, steps are running in sequence
      - name: get code from github # step name
        uses: actions/checkout@v4 # action
        
      - name: group steps together with vertical bar # step name
        run: |
          npm install
          npm run build
        
      - name: fake-deploy # step name 
        uses: JamesIves/github-pages-deploy-action@4 # action
        with: # action input
          branch: gh-pages # branch name
          folder: build # artifact folder
```

### Docker Example
- auto generate Docker Image and push to Docker Hub

1. create a docker hub repository with name`react-app` 
2. `New Access Token` in Docker Hub

```  {filename="Dockerfile"}
FROM node:18-alpine

WORKDIR /react-app

COPY public/ /react-app/public/
COPY src/ /react-app/src/
COPY package.json /react-app/package.json

RUN npm install

CMD ["npm", "start"]
```

```yml
name: Generate Docker Image and Push to Docker Hub 
on: push 

jobs: 
  npm-build: 
    name: npm build job name
    runs-on: ubuntu-latest 

    steps: 
      - name: get code from github 
        uses: actions/checkout@v4 

      - name: login to docker hub
        uses: docker/login-actiion@v3
        with: 
          username: ${{ secrets.DOCKER_USERNAME }} # github -> Security -> Secrets and variables -> Action
          password: ${{ secrets.DOCKER_PASSWORD }}
      - name: build docker image and push to docker hub
        uses: docker/build-push-action@v5
        with: 
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/react-app:latest # tag here must be the same as the repository name in Docker Hub
```
