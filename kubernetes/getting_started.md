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

## Inspect Basic Cluster Resources

Using `-A` or `--all-namespaces` flag shows resources across the entire cluster, which helps understand how Kubernetes uses **Namespaces** to organise and isolate resources.
