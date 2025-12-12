# Docker Image Essentials 

### Contents
- What is Docker image
- Pulling images from Docker Hub
- Running Containers from Images
  - Exampleof running a command on the container
- Listing and removing images
- Troubleshoot errors when removing containers
- Searching for an Image
- Saving & Loading images
- Basic Image tagging

---

## What is Docker Images?

- A Docker image is a lightweight, standalone package that contains everything needed to run a piece of software
- Images are used to create containers

## Pulling images from Docker Hub

```sh
docker pull <image-name>
docker pull python
```

- This command tells Docker to download the latest version of Nginx from Docker Hub
- Latest is pulled by default
- You can specify versions like this `docker pull python:3.7`

## Running Containers from Images

```sh
docker run <image-name>
docker run python
```

- Starts a container based on a specified image.
- In this example nothing happens because it runs the container and exits right away. You need to specify other commands to tell it what to do once the container is run


## Example of running a command on the container

```sh

docker run --rm python python --version

```

- `docker run` creates and starts the container
- `--rm` tells Docker to remove the container after it exits
- `python` specifies which image to use
- `python --version` is the command to run inside the container


## Listing and Removing Images

List images:

```sh
docker images
```


Remove images:

```sh
docker rmi <image-id>
```

- Containers must be stopped/removed before removing an image


## Troubleshoot errors when removing containers

`Error response from daemon: conflict: unable to remove repository reference "python:3.7" (must force) - container <container_id> is using its referenced image <image_id>`


- Usually get this error when container is running or stopped.
- Docker thinks its off use and prevents you from removing it

Resolve this issue by seeing all the containers that you have (including the stopped ones)

```sh

docker ps -a

```


When you see the `CONTAINER ID` of the image you are trying to remove, make a note of it and remove it.

```sh
docker rm <container_id>
```

Now you can remove the image:

```sh
docker rmi <image-id>
```

## Searching for Images

```sh
docker search nginx
```

- This will return a list of images related to Nginx. THe output includes several columns


## Saving & Loading Images

**Save an image to a file**

- Docker lets you save images as tar files and load them later.
- Usful for transferring images between systems without using registry.

```sh
docker save nginx > nginx.tar
```

**Load the image from a file**

```sh
docker load < nginx.tar
```


## Basic Image Tagging

- Tagging is a way to create alisases for your Docker images
- Commonly used for versioning and organising images


```sh
docker tag nginx:latest my-nginx:v1
```

- This command creates a new tag `my-nginx:v1` that points to the same image as `nginx:latest`. Here's what each part means:
- `nginx:latest` is the source image and tag
- `my-nginx` os tje mew o,age ma,e we're creatign
- `v1` os tnje new tag we're assigning


You should see both `nginx:latest` and `my-nginx:v1` when running the command: `docker images`


You can use this new tag to run a container


```sh
docker run -d --name my-nginx-container my-nginx:v1

```
