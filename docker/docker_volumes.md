# Docker Volumes

Theres three main storage options for storing data:
- Volumes: The preferred way for persisting data in docker. Docker handles all the details of where and how this volume is stored on the host system
- Bind mounts: Connect a specific path of the host machine to a container
- tmpfs mounts: Store data temporarily in the host machine's memory

## Creating and Managing Named Volumes

```sh
docker volume create my_data
```

- Creates a new volume named `my_data`


```sh
docker volume inspect my_data
```

It will output useful information such as:
- when it is created
- the driver its using
- the mountpoint (where the data is actually stored)
- name of the volume

## Using Volumes with Containers

```sh
docker run -d --name my_container -v my_data:/app/data ubuntu:latest sleep infinity
```

- `docker run`: This tells DOcker to run a new container
- `-d`: This run the container in detached mode (in background)
- `--name my_countainer`: Gives the container a name
- `-v my_data:/app/data`: This mounts `my_data` (created in previous step) volume to the `/app/data` directory inside the container
- `ubuntu:latest`: This is the image the container will be using
- `sleep infinity`: This keep the container running constantly


### Creating some data in the volume

```sh
docker exec my_container sh -c "echo 'Hello World' > /app/data/test.txt"
```

- `docker exec`: This lets us execute a command in a running container
- `my_container`: This is the name of our container
- `sh -c "..."`: This runs a shell command inside the container
    - This particular command creates a `text.txt` with content "Hello World"

## Sharing Data Between Containers

Docker volumes allow data to be shared and persisted across multipple containers, making it easier for them to work with the same data.

```sh
docker run -d --name another_container -v my_data:/app/shared_data ubuntu:latest sleep infinity
```

- This is a similar command to previous.
    - Its given a different container name and mounting the volume to a different path inside the container


Verify if you can see the same "Hello World"

```sh
docker exec another_container cat /app/shared_data/test.txt
```

## Volume Backup and Restore

Backing up and restoring Docker volumes is crucial for data preservation.

```sh
docker stop my_container another_container
docker rm my_container another_container
```

- Containers need to be stopped and volumes need to be removed.

```sh
docker run --rm -v my_data:/source:ro -v $(pwd):/backup ubuntu tar cvf /backup/my_data_backup.tar -C /source .
```

- `docker run --rm`: Run a temporary container and remove it when it's done
- `-v. my_data:/source:ro`: Mount our volume as read-only in the container
- `-v $(pwd):/backup`: Mount the current directory as `/backup` in the container
- `ubuntu`: Image used for container
- `tar cvf /backup/my_data_backup.tar -C /source . `: Create a tar archive of the volume data

Remove original volume to so we can restore volume later:

```sh
docker volume rm my_data
```

To restore data, a new volume needs to be created, and the backup needs to be extracted into it

```sh
docker volume create my_restored_data
docker run --rm -v my_restored_data:/dest -v $(pwd):/backup ubuntu bash -c "tar xvf /backup/my_data_backup.tar -C /dest"
```