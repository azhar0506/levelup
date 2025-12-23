# Getting Started

## Starting the Kubernetes Cluster

```sh
minikube start
```

- This starts the kubernetes cluster

```sh
minikube status
```
- This verifies the cluster

```sh
kubectl get nodes
```
- Retrieves a list of all nodes that make up the cluster

## Verify Cluster Setup

```sh
kubectl cluster-info
```

- Checks the cluster information

```sh
kubectl get nodes -o wide
```

- Provides details about the Kubernetes control plane and core services like Core DNS.

```sh
NAME       STATUS   ROLES           AGE    VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION
minikube   Ready    control-plane   15m    v1.26.1   192.168.49.2   <none>        Ubuntu 22.04 LTS    5.15.0-72-generic
```

- Example output^

```sh
kubectl describe node minikube
```

- Comprehensive node details

## `kubectl` command patterns

```sh
kubectl [command] [TYPE] [NAME] [flags]
```

- `kubectl`: The command line tool itself
- `[command]`: Specifies what action you want to perform
  - `get`: Displays resources
  - `describe`: Show details about a specific resource
  - `create`: Create a new resource
  - `delete`: Delete resources
  - `apply`: Apply a configuration to a resource
- `[TYPE]`: Specifies the Kubernetes resource type you want to interact with
  - `pods`: The smallest deployable units in Kubernetes
  - `deployments`: Manage sets of pods for scaling and updates
  - `services`: Expose applications running in pods
  - `nodes`: The worker machines in your Kubernetes cluster
  - `namespaces`: Logical groupings of resources
- `[NAME]`: Name of specific resource. (Optional - kubectl will operate on all resource of specified type if not included)
- `[flags]`: Optional flags to modify the command's behaviour 

## Inspect Basic Cluster Resources

Using `-A` or `--all-namespaces` flag shows resources across the entire cluster, which helps understand how Kubernetes uses **Namespaces** to organise and isolate resources.

### Namespaces 
- Logical partitions in Kubernetes cluster used to **organise** and **manage resources**
- They allow grouping of related objects by **project**, **team** or **environment**

### Why namespaces are useful
- Organisation: Keep workloads logically seperated.
- Security & Access Control: Control who can view or modify resources per namespace.
- Resource Management: Apply quotas, limits, and policies at a granular level.

### Common namespaces:
- kube-system: Contains cluster/system components (e.g., CoreDNS, kube-apiserver, scheduler)
- default: Used for general workloads if no namespace is specifies
- kube-node-lease: Used for node leases, which help the control plane track the health of the nodes
- kube-public: Intended for resources that should be publicly accessible
- custom namespaces (e.g., dev): Used for isolated environments or teams.
  

```sh
kubectl get pods -n kube-system
```

- This command lists all the pods running in the `kube-system` namespace.
