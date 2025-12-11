# Custom Docker Image

## Create a Simple Docker Image

Dockerfile:
```sh
FROM nginx
COPY index.html /usr/share/nginx/html/
```

- the file is called `Dockerfile` with a capital `D`
- `FROM nginx`: This is the base image we're building from. In this case its the official Nginx image
- `COPY index.html /usr/share/nginx/html/`: This copies our `index.html` to the file container's web root directory


```sh
docker build -t my-nginx .
```

- `docker build`: This is the command to build a Docker image
- `-t my-nginx`: The `-t` flag tags our image with the name `mynginx`.
- `.`: This specifies the build context (the direcotry containing the Dockerfile)


## Use Environemt Variables in the image

Dockerfile:
```sh
FROM nginx
ENV NGINX_PORT 9000
RUN sed -i "s/listen[[:space:]]*80;/listen $NGINX_PORT;/g" /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
```


- `ENV NGINX 9000`: This sets an environment vairable `NGINX_PORT` with the value 9000
- `sed -i "s/listen[[:space:]]*80;/listen $NGINX_PORT;/g" /etc/nginx/conf.d/default.conf`: Uses `sed` to replace the default port (80) with out environment variable in the Nginx configuration file

## Use ENTRYPOINT in Dockerfile

Dockerfile:
```sh
FROM nginx
COPY index.html /usr/share/nginx/html/
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
```

start.sh file:
```sh
#!/bin/bash
# Set a default port if NGINX_PORT is not set
export NGINX_PORT=${NGINX_PORT:-9100}
# Replace the port in the nginx configuration
sed -i "s/listen[[:space:]]*80;/listen $NGINX_PORT;/g" /etc/nginx/conf.d/default.conf
echo "Starting Nginx on port $NGINX_PORT"
nginx -g 'daemon off;'
```

This script sets a default port, modifies the Nginx configuration at container startup, prints a message showing which port Nginx will run on, and then starts Nginx.

You can run a container based on the new image. We'll set the port to 9100 using an environment variable.

```sh
docker build -t my-nginx-entrypoint . # Build the image

docker run -d -p 9100:9100 -e NGINX_PORT=9100 --name entrypoint-container my-nginx-entrypoint
```