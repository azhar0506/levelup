# Docker Networking Basics

Docker provides several built-in network drivers.

- `bridge`: This is the default network driver. When you start a container without specifying a network, it automatically connects to the bridge network.
  - Containers on the same bridge network can communicate with each other using their IP address
    
- `host`: This driver removes network isolation between the container and the Docker host. The container shares the host's networking namespace, which means it uses the host's IP address and port space directly.
  -  This can be useful for optimising performance in certain scenarios

- `none`: This driver disables all networking for a container. Containers using this netwprk type will have no access to external network or other containers.
  -   This can be useful when you want to completley isolate a container
 

## Inspecting the Default Bridge Network

```sh
docker network inspect bridge
```

This command provides detailed information about the bridge network, including its subnet, gateway, and connected containers.

### Example output of container (truncated for brevity)

```sh
[
  {
    "Name": "bridge",
    "Id": "79dce413aafdd7934fa3c1d0cc97decb823891ce406442b7d51be6126ef06a5e",
    "Created": "2024-08-22T09:58:39.747333789+08:00",
    "Scope": "local",
    "Driver": "bridge",
    "EnableIPv6": false,
    "IPAM": {
      "Driver": "default",
      "Options": null,
      "Config": [
        {
          "Subnet": "172.17.0.0/16",
          "Gateway": "172.17.0.1"
        }
      ]
    },
    "Internal": false,
    "Attachable": false,
    "Ingress": false,
    "ConfigFrom": {
      "Network": ""
    },
    "ConfigOnly": false,
    "Containers": {},
    "Options": {
      "com.docker.network.bridge.default_bridge": "true",
      "com.docker.network.bridge.enable_icc": "true",
      "com.docker.network.bridge.enable_ip_masquerade": "true",
      "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
      "com.docker.network.bridge.name": "docker0",
      "com.docker.network.driver.mtu": "1500"
    },
    "Labels": {}
  }
]
```

- `Subnet`: The subnet used by containers in this network is `172.17.0.0/16`. This means containers will be assigned IP addresses within this range.
- `Gateway`: The gateway for this network is `172.17.0.1`. This is the IP address that containers use to communicate with network outside their own.
- `Containers`: This field is empty because we haven't started any containers yet
- `Options`: These are several config options for the bridge network.
  - e.g. `enable_icc` set to "true" means that inter-container communication is allowed on this network 


## Creating a Custom Bridge Network

Creating custom network allows for bettwe isolation control than using that default bridge network. Custom network are particularly useful:
-  when you want to group related containers together
-  when you need to control which containers can communicate with each other

```sh
docker network create --driver bridge my-network
```

This command creates a new bridge network called `my-network`.


## Connecting Containers to Networks

```sh
docker run -d --name container1 --network my-network nginx
docker run -d --name container2 --network my-network nginx
```

- `-d`: Runs container in the background. (Detached mode).
- `--name`: This assigs a name to our container, making it easier to reference later.
- `--network`: This specifies which network the container should connect to.
- `nginx`: This is the name of the image we're using to create our containers.

Both of the containers created are connecrted to the network called `my-network`.


## Testing Inter-container Communication

Containers on the same Docker network can communicate using container names instead ofn IP addresses, making service communicatin simpler and more reliable

```sh
docker exec container1 curl -s container2
```

- `docker exec`: Tells Docker to execute a command inside a running container
- `container1`: This is the name of the container we want to execute the command in
- `curl -s container2`: This is the command we're executing inside the container. It sends a GET request to `container2` and the `-s` flag makes curl operate in silent mode.
   - Inside container1, curl tries to make an HTTP request to a host named container2.

This command executes the `curl` command inside container1, sneding a request to `container2`. You should see the default Nginx welcome page HTML output

## Exposing Container Ports

Containers on a custom Docker network can communicate internally by default, but exposing ports is required to allow access from the host or external network.

```sh
docker run -d --name exposed-container -p 8080:80 --network my-network nginx
```

- `-d`: Run container in background (detached mode)
- `--name exposed-container`: Name the container "exposed container"
- `-p 8080:80`: Map port 80 inside the container to port 8080 on the host.
- `--network my-network`: Connect the container to our custom network (created in previous steps).
- `nginx`: Uses the Nginx image.

This command creates a new container named `exposed-container`, maps the container's port 80 to the host's port 8080, and connects it to our `my-network`.


You should be able to access the container's Nginx server from your host machine by opening a web browser and navigating to:
- `http://localhost:8080`
- using curl: `curl localhost:8080`


## Using Host Networking

The host network dirver lets a container share the host's network directly, removing isolation and enabling direct access, but it must be used carefully because of possible port conflicts.

```sh
docker run -d --name host-networked --network host nginx
```

This command creates a new container named `host-netowrked` using the host network.
- You cannot use `-p` with host netowrking, as the container is already using the host's network interfaces.

## Custom Bridge Networks

Creating custom bridge network offers better isolation and control over intercontainer communication

```sh
docker network create my-custom-bridge
```
- This creates a bridge network called `my-custom-bridge`

```sh
docker run --network=my-custom-bridge --name container1 -d nginx
docker run --network=my-custom-bridge --name container2 -d nginx

docker exec container1 apt-get update && docker exec container1 apt-get install -y iputils-ping
docker exec container2 apt-get update && docker exec container2 apt-get install -y iputils-ping
```

- This creates two containers on the bridge network and installs ping

```sh
docker exec container1 ping -c 4 container2
```

- Pings container 1 to container 2. Successful ping responses should follow

### Multiple networks on container

- Containers can have multiple networks

```sh
docker network create my-second-bridge # creates a second bridge network called my-second-bridge

docker network connect my-second-bridge container2 # adds container3 to my-second-bridge network

docker run --network=my-second-bridge --name container3 -d nginx # runs container3 with image nginx on the my-second-bridge network

docker exec container3 apt-get update && docker exec container3 apt-get install -y iputils-ping # installs ping on container3
```

- Essentially adding a second network bridge, connecting it to container2 and container3 (this was created in this step)

```sh
docker exec container1 ping -c 2 container2
docker exec container1 ping -c 2 container3
docker exec container2 ping -c 2 container3
```

- `container1` can communicate with `container2`
- `container1` cannot communicate with `container3`
- `container2` can communcate with both `container1` and `container3`

## None Network Mode

This mode creates containers with no network interface. This is for maxumum security isolation. 
- The container will not be able to communcate over the network at all.

```sh
docker run --network none --name isolated-container
```

## Network Aliases and Service Discovery

Docker networks enable service discovery through network aliases, allowing multiple containers to share the same DNS name and provide basic load balancing for scalable, resilient applications.


