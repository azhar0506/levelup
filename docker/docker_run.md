# Deep Dive into docker run

### Contents
- What is `docker run`
- Port Mapping
- Volume Mounting
- Environment Variables
- Network Settings
- Restart Policies
- Working Directory



---


## What is `docker run`?

  - `docker run` creates and starts a container from an image.
  - It includes options like controlling how containers behave, connect and use resources

  
## Port Mapping (Expose Container Services)

The `-p` parameter in `docker run` allows us to map ports from the container to host.

```sh
docker run -d --name nginx-mapped -p 8080:80 nginx
```

- `-p 8080:80`: This maps port 8080 on your host to port 80 in the container. 
  - Format is `host_port:container_port`

Nginx, by default, runs on port 80 inside the container. By mapping it to port 8080 on our host, we can access it by going to localhost:8080 in a web browser

`curl http://localhost:8080`

## Volume Mounting

The `-v` parameter in `docker-run` allows us to mount volumes, sharing data between the host and the container. Very useful for:
  - Persisting data (so keeping the data even after container is stopped )
  - Providing configuration files to the container

```sh
mkdir -p ~/project/nginx-data
echo "<html><body><h1>Hello from mounted volume</h1></body></html>" > ~/project/nginx-data/index.html
docker run -d --name nginx-volume -p 8081:80 -v ~/project/nginx-data:/usr/share/nginx/html nginx
```

## Environment Variables

The `-e` parameter in `docker run` allows us to set environment variables in the container. This is useful for configuring the application running in the container without changing its code

- `-e NGINX_HOST=mywebsite.com`: This sets an environment variable named `NGINX_HOST` with value `mywebsite.com`
- `-e NGINX_PORT=80`: This sets another environment variable `NGINX_PORT` with the value `80`

You can verify env variables with this command:

```sh
docker exec nginx-env env | grep NGINX_
```

- `docker exec nginx-env`: This tells Docker to execute a command in the running `nginx-env` container.
- `env`: This command prints out all environment variables.

## Network Settings

The `--network` parameter in `docker run` allows you to connect a container to a network. Useful for:
  - Container to Container communication
  - Isolating groups of containers

```sh
docker network create my-custom-network
```

This creates a new bridge network named `my-custom-network`. Bridge networks are the most common network type in Docker

Now you can run a container and connect it to this network:

```sh
docker run -d --name nginx-networked --network my-custom-network nginx
```

## Restart Policies

The `--restart` parameter in `docker run` allows you to specify a restart policy for the container. useful for:
  - restarting the container even if they crash 
  - makes sure container is running when Docker daemon restarts

```sh
docker run -d --name nginx-restart --restart unless-stopped nginx
```

The `--restart unless-stopped` option sets the restart policy to "unless-stopped", meaning the container will restart automatically unless it is explicitly stopped by the user.

Other restart policies include:
  - `no`: The default. Don't automatically restart the container
  - `on-failure`: Restart only if the container exits with a non-zero status
  - `always`: Always restart the container regardless of the exit status

Verify with this command:

```sh
docker inspect -f '{{.HostConfig.RestartPolicy.Name}}' nginx-restart
```

## Working Directory and Command

The `-w` paramater in `docker run` sets the working directory inside the container, and you can specify a command to run after the image name.

```sh
docker run -d --name nginx-custom -w /app nginx sh -c "mkdir -p /app && touch newfile.txt && nginx -g 'daemon off;'"
```

- `-d`: Runs the container in detached mode (in the background)
- `--name nginx-custom`: Name the container "nginx-custom"
- `-w /app`: Set the working directory inside the container to `/app`.
- `nginx`: The name fo the image to use
- `sh -c "..."`: Runs a shell command
  - `touch newfile.txt`: Creates a new file
  - `&&` Run the next command if the previous one succeeded.
  - `nginx -g 'daemon off;'`: Start Nginx in the goreground, keeping the container running

Verify with this command:

```sh
docker ps | grep nginx-custom
docker exec nginx-custom ls -l /app/newfile.txt
```
