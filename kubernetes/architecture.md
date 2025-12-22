# Kubernetes Architecture 

### Kubernetes uses a client-server architecture:

- Control Plane: the brain (decides what should happen)
- Worker Nodes: the muscle (runs your application)
- User (Developer/Admin): interacts via CLI or API

You declare a desired state (e.g: "run 3 copies of this app"), and Kubernetes continuously works to make reality match that state.

## Control Plane (Brain)
The Control Plane manages the entire cluster and makes global decisions

- **kube apiserver (API)**
  - Front door to the cluster
  - All commands and requests go through it (kubectl, CI/CD, controllers)
- **etcd (Key-Value Store)**
  - Stores all cluster state and configuration
  - Losing etcd = losing the cluster's memory
- **kube scheduler**
  - Decides which Node a new Pod should run on
  - Considers CPU, memory, constraints, and policies
- **kube controller manager**
  - Runs controllers that:
    - Monitor the cluster
    - Compare desired state vs actual state
    - Fix mimatches automatically
   
 
## Worker Nodes (Where Apps Run)
Worker Nodes execute workloads assigned by the Control Plane

Each Node inlcudes:
- kubelet
  - Node-level agent
  - Talks to the API server
  - Ensures Pods are running as instructed
  - Reports status back to the Control Plane
- Container Runtime
  - Runs containers inside Pods
  - Examples: containerd, Docker
  - Pulls images, starts/stops containers

## Pods (Smallest Deployable Unit)

- A Pod = one or more containers
- Containers in a Pod:
  - Share the same network namespace (IP + ports)
  - Can share storage volumes
- Typically represents one instance of an application

## Services (Stable Access)

- A Service provides a stable endpoints for Pods
- Why Services exist:
  - Pods are ephemeral (they die, move, get replaced)
  - Pod IPs change frequently

Services provide:
- Stable IP address
- DNS name
- Load balancing across matching Pods


# How Everything Works Together (Flow)

1. Developer
   - Uses `kubectl` or API to submit a request
   - Example: deploy an application
2. kube-apiserver
   - Recieves the request
   - Stores desired state in etcd
3. Scheduler
   - Chooses the best Node for each Pod
4. kubelet (on Nodes)
   - Creates and monitors Pods
   - Ensures containers stay running
5. Services
   - Route traffic to the correct pods
   - Hide Pod restarts and IP changes from clients

