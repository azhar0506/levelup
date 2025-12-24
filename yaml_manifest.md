# Applying a production ready YAML manifest

```sh
vi web-app.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
        - name: web
          image: nginx:alpine
          ports:
            - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: web-service
spec:
  selector:
    app: web
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 80
```

This file contains two seperate Kubernetes resource definitions seperated by `---`.

- `kind: Service`: This defines a Service resource.
  - `spec.selector.app: web`: This Service will target pods that have label `app: web`. This matches the labels we set for the pods created by the `web-app` Deployment
  - `spec.type: ClusterIP` Specifies the service type as `ClusterIP`
    - This means service will be exposed on an internal IP address within the cluster and is typically used for communication between services within the cluster.
  - `spec.ports`: Defines how the service maps ports to the target pods.
    - `port: 80`: The port on the Service itself that you will access.
    - `targetPort: 80`: The port on the target pods that the service will forward traffic to.

⚠️ **Important:** You do not need a pod yaml added here because `template` specifies it.


## Applying the file

```sh
kubectl apply -f web-app.yaml
```

- This command will create both the Deployment and the Service defined in `web-app.yaml`.


Output:

```sh
deployment.apps/web-app created
service/web-service created
```

## Dry Run

Dry run can be useful for checking that the manifest is valid and seeing what resources would be created or modified.

```sh
kubectl apply -f web-app.yaml --dry-run=client
```
Output:

```sh
deployment.apps/web-app created (dry run)
service/web-service created (dry run)
```
