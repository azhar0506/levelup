# Create a Simple YAML Manifest

## Understanding Kubernetes Objects

- **Pod**: Smallest unit in Kubernetes. It contains one or more containers that share network and storage, representing a single app instance.
- **Deployment**: Manages pods by keeping the desired number running, replacing failed pods, and handling updates
- **Service**: Provides a stable IP/DNS to access pods, so apps and users don't need to track changing pod IP addresses.

<img width="296" height="390" alt="image" src="https://github.com/user-attachments/assets/45e9f761-b445-418c-804a-7f84f74327dc" />


## YAML Manifest Overview

A YAML manifest is a human-readable file written in YAML that defines the Kubernetes objects you want to create or manage.

1. **Declarative Management**: You describe the desired state of your resources (such as the number of replicas), and Kubernetes automatically works to match the actual state to that desciption
2. **Version Control**: Because YAML files are text based, they can be stored in systems like Git, making it easy to track changes, and roll back configs
3. **Reusability and Portability**: You can reuse YAML manifests across different environments (dev, test, ref, prod) with minimal changes.

## Creating a YAML Manifest
This is to create a pod that runs a single NGINX container


```sh
vi nginx-pod.yaml

apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - containerPort: 80
```

- `apiVersion: v1`: Specifies the Kubernetes API version to use for creating this object. `v1` is the core API group and is used for fundamental objects like pods, services, and namespaces
- `kind: Pod`: Indicates that you are defining a Pod resource.
- `metadata:`: Contains data about the Pod, such as its name and labels
  - `name: nginx-pod`: Sets the name of the Pod to `nginx-pod`. This is how you will refer to this pod within Kubernetes
  - `labels`: Labels are key-value pairs that are attached to objects. They are used to organise and select subsets of objects. here, we are adding a label `app: nginx` to this pod
- `spec:` Describe the desired state of the Pod
  - `containers:`: A list of containers to be run wihtin the Pod. In this case, we have only one container
  - `- name: nginx`: Sets the name fo the container to `nginx`.
  - `image: nginx:latest`: Specifies the container image.
  - `ports:`: A list of ports that the container will expose.
    - `containerPort: 80`: Specifies that the container will expose port 80. Port 80 is the standard HTTP port.

⚠️ **Important:** You do not need the `spec:` part in nginx-pod.yaml in real-world application as you will **never** create individual Pods manually

```sh
kubectl apply -f nginx-pod.yaml
```

- This command sends the manifest to your Kubernetes cluster
- Kubernetes will create the pod as defined

Output:

```sh
pod/nginx-pod created
```

To verify creation of pods:

```sh
kubectl get pods
```

```sh
vi nginx-deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          ports:
            - containerPort: 80
```

- `apiVersion: apps/v1`: For Deployments, you use the `apps/v1` API version, which is part of the `apps` API group and handles higher-level application management resources.
- `kind: Deployment`: Indicates that you are defining a Deployment resource
- `spec:` The `spec` section for a Deployment is more complex because it defines how the Deployment should manage pods.
  - `replicas: 3`: This specifies that you want 3 replicas of your pod to be running. The Deployment will ensure that there are always 3 pods matching the criteria defined in the `template`.
  - `selector:` A selector is used by the Deployment to identify which pods it should manage.
    - `matchLabels`: Defines the labels that pods must have to be selected by this Deployment. Here, it selects pods with the label `app: nginx`.
  - `template`: The `template` defines the pod specification that the Deployment will use to create new pods.
    - It's essentially the same pod definition as in the `nginx-pod.yaml` above, including `metadata.labels` and `spec.containers`
    - ⚠️ **Important**: The labels defined in `template.metadata.labels` must match the `selector.matchLabels` so that the Deployment can manage these pods

```sh
kubectl apply -f nginx-deployment.yaml
```

Output:

```sh
deployment.apps/nginx-deployment created
```

To verify creation of Deployment is created:

```sh
To verify creation of pods:
```
