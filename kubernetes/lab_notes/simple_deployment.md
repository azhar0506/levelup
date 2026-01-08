# Simple Deployment

```sh
kubectl create deployment hello-kubernetes --image=nginx:latest --port=80
```

- `kubectl`: command line tool for interacting with Kubernetes
- `create deployment`: tells Kubernetes to create a new deployment
- `hello-kubernetes`: is the name of the deployment
- `--image=nginx:latest`: use image nginx
- `--port=80`: tells Kubernetes that the container will listen on port 80

