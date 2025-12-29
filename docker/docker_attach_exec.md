# Docker: attach vs exec

- `docker attach` -> connect to the existing main process
- `docker exec` -> run a new conmmand inside the container

## docker attach

- Attaches your terminal to a container's main running process
- Shows live STDOUT/STDERR
- Allows interaction only if the container was started with `-it`

### Example:

- Start the container:

```sh
docker run -it --name my_container ubuntu
```

- Attach to a running container:

```sh
docker attach my_container
```

- Detach without stopping th container:

```sh
Ctrl + P, then Ctrl + Q
```

⚠️ **Important:** Do not use `Ctrl + C`. This stops the container

## docker exec

- Runs a new command inside a running container
- Does not affect the main process
- Preferred for administration and debugging

- Open a shell inside a container: 

```sh
docker exec -it my_container bash
```



1. Use `docker attach` to observer or interat with an existing foreground process
2. Use `docker exec` to safely run ocmmands inside a running container