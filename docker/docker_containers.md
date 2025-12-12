# Docker Deep Dive into Containers

### Contents
- What is Container Management
- Running Containers in Different Modes
    - Running Container in detached mode
    - Running Container in interactive mode
- Managing Container Lifecycle
    -  List Containers
    -  Start/Stop/Restart Containers
- Inspecting Container Details
- Working with Container Logs
- Exexuting Commands Inside Containers
- Copying files In and Out of Containers
- Setting Environment Variables
    - Verify if env variables are set
- Limiting Container resources 

## What is Container Management

- Involves controlling how containers run, behave, and interact.
- It is essential for scalable, maintainable, production ready applications

## Running Containers in Different Modes

### Running Container in detached mode:

```sh
docker run -d --name nginx-detached nginx
```

- `-d`: Runs the container in detached mode (in the background)
- `--name nginx-detached` Assigns the name "nginx-detached" to the container
- `nginx`: Specifies the image to use (Pulled from docker hub if not stored locally)

### Running Container in interactive mode:

```sh
docker run -it --name ubuntu-interactive ubuntu /bin/bash
```

- `-it`: Runs the container in interactive mode with a pseudo-TTY
- `--name ubuutu-interactive`: Assigns the name "ubunutu-interactive" to the container
- `ubuntu`: Specifies the image to use
- `/bin/bash`: The command to run inside the container

## Managing Container Lifecycle

### List containers
```sh
docker ps       # show running containers
docker ps -a    # show all containers (even stopped/exited ones) Doesn't show containers that are removed
```

### Start/Stop/Restart
```sh
docker start <id>
docker stop <id>
docker restart <id>
```

### Remove containers
```sh
docker rm <id>
```

## Inspecting Container Details
```sh
docker inspect <container-id>
```

- Shows detailed info: 
    - network
    - volumes
    - environment
    - variables
    - config
    - etc

## Working with Container Logs

```sh
docker logs <container-id>
docker logs -f <container-id>   # follow live logs
```

- Helps with debugging and troubleshooting applications


## Executing Commands Inside Containers

```sh
docker exec nginx-detached echo "Hello from inside the container"
```

- You should see "Hello from inside the container" printed to your terminal

```sh
docker exec -it <container-id> bash
```

- Opens a shell inside the container
- Useful for debugging or interacting with running services

## Copying Files In and Out of Containeers 

- Copy from host to container

```sh
docker cp myfile.txt <container-id>:/path/
```

- Copy from container to host

```sh
docker cp <container-id>:/path/file.txt .
```

## Setting Environment Variables

```sh
docker run --name env-test -e MY_VAR="Hello, Environment" -d ubuntu sleep infinity
```

- `--name env-test`: Names the container "env-test"
- `-e MY_VAR="Hello, Environment"`: Sets an environment variable named MY_VAR
- `-d`: Runs the container in detached mode
- `ubuntu`: Uses the Ubuntu image
- `sleep infinity`: Keeps the container running indefinitely

### Verify if env variable is set

```sh
docker exec env-test env | grep MY_VAR
```

## Limiting Container Resources

```sh
docker run --name limited-nginx -d --memory=512m --cpus=0.5 nginx
```

- `--name limited-nginx`: Names the container "limited-nginx"
- `-d`: Runs the container in detached mode
- `--memory=512m`: Limits the container to 512 megabytes of memory
- `-cpus=0.5`: Limits the container to use at most half of a CPU coree
- `nginx`: Uses Nginx image

