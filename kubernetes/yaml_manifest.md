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

## Accessing Kubernetes Applications using `kubectl proxy`

```sh
kubectl proxy --port=8080 &
```

- start the `kubectl proxy` in background
- `&`: this makes it so it runs in the background

Output:

```sh
Starting to serve on 127.0.0.1:8080
```


```sh
# Get pod names for the 'web-app'
kubectl get pods -l app=web
```

Output:

```sh
NAME                       READY   STATUS              RESTARTS   AGE
web-app-7c8cbd776f-7c9jl   0/1     ContainerCreating   0          4s
web-app-7c8cbd776f-8mlsr   0/1     ContainerCreating   0          4s
```

- Take note of pod name as this will be used to construct the API path ot access the NGINX web server running in that pod
- To access a pod through the `kubectl proxy`, you need to construct a URL like this:

```sh
http://localhost:8080/api/v1/namespaces/<namespace>/pods/<pod_name>/proxy/
```

- `http://localhost:8080`: The address where `kubectl proxy` is running. By default, it listens on port 8080 in your current environment
- `/api/v1`: Specifies the Kuberentes API version (v1)
- `/namespaces/<namespace>:` The namespace where your pod is running. In this case its `default`.
- `/pods/<pod_name>`: The name of the pod you want to access.
- `/proxy/`: Indicate that you want to proxy a connection to the pod

To get the name of the first pod and store it in a variable:

```sh
# Get the name of the first pod with label 'app=web'
POD_NAME=$(kubectl get pods -l app=web -o jsonpath='{.items[0].metadata.name}')
echo $POD_NAME # Optional: print the pod name to verify
```

- first pod name is stored in `$POD_NAME`

```sh
curl http://localhost:8080/api/v1/namespaces/default/pods/${POD_NAME}/proxy/
```

Output:

```sh
<!doctype html>
<html>
  <head>
    <title>Welcome to nginx!</title>
    ...
  </head>
  <body>
    <h1>Welcome to nginx!</h1>
    ...
  </body>
</html>
```

This output confirms that you have successfully access the web server in the pod through `kubectl proxy`

### List all pods in the default namespace via proxy:

```sh
curl http://localhost:8080/api/v1/namespaces/default/pods/
```

- return a JSON response containing info about all pods in the `default` namespace.

### Get detailed information about a specific pod via proxy

```sh
curl http://localhost:8080/api/v1/namespaces/default/pods/${POD_NAME}
```

### Stopping `kubectl proxy`:

```sh
jobs
```
- List of background running processes
- Look for `kubectl proxy` and make a note of it

```sh
kill %[whatever the id you found in previous step
```
