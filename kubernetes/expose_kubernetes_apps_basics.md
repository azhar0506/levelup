# Expose Kubernetes Applications

## Expose NGINX deployment internally and externally

```sh
vi nginx-clusterip-service.yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-clusterip-service
spec:
  selector:
    app: nginx
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 80
```

- `type: ClusterIP`: By setting this, Ip address is only reachable within the cluster
- Service Discovery: Instead of trying to keep track of individual Pod IP address (which change if a Pod crashes or restarts), other applications in your cluster can simply talk to `nginx-clusterip-service`
- Load Balancing: If you have multiple NGINX Pods (like this one wher eyou have 3 replicas), this Service will automatically distribute incoming traffic across all of them.
- `port: 80` (The Service Port)
  - This is the port number that the Service itself listen on inside the cluster.
  - When other applications inside your cluster wants to talk to NGINX, they send their request to the Services's IP at this port (e.g., `http://nginx-clusterip-service:80`)
- `targetPort: 80` (The Container Port)
  - This is the port that your application is actually listening on, inside the container.
  - When the service receives traffic on its own `port`, it forwards that traffic to the Pods at this `targetPort`

```sh
vi nginx-nodeport-service.yaml

apiVersion: v1
kind: Service
metadata:
  name: nginx-nodeport-service
spec:
  selector:
    app: nginx
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080
```

- `type: NodePort:`: This tells Kubernetes to expose the service outisde the cluster by opening a specific port on the IP address of the cluster nodes.
- `nodePort: 30080`: This external port allows you to acess the app from your browser

## Delete services

```sh
kubectl delete service nginx-clusterip-service nginx-nodeport-service
```

## Ingress Basics

Ingress is an API object that manages external access to services in a Kubernetes cluster, typically HTTP. Ingress Provides:
- Load balancing: Distributes traffic to multiple backend services
- SSL/TLS termination: Handles secure connections
- Name based virtual hosting: Routes requests to different services based on the hostname
- Path based routing: Routes requests to different services based on the URL path

### 2 Ingress Components:

1. Ingress Resource: A Kubernetes API object that defines the routing rules
2. Ingress Controller: The implementation that enfores the rules defined in the Ingress Resource


Enable Ingress:

```sh
minikube addons enable ingress
```

Create deployment for two sample applications:

```sh
kubectl create deployment web1 --image=nginx:alpine
kubectl create deployment web2 --image=httpd:alpine
```

Expose these deployments as services:

```sh
kubectl expose deployment web1 --port=80 --type=ClusterIP --name=web1-service
kubectl expose deployment web2 --port=80 --type=ClusterIP --name=web2-service
```

Ingress YAML file:

```sh
vi ingress-example.yaml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
    - http:
        paths:
          - path: /web1
            pathType: Prefix
            backend:
              service:
                name: web1-service
                port:
                  number: 80
          - path: /web2
            pathType: Prefix
            backend:
              service:
                name: web2-service
                port:
                  number: 80
```

- metadata.annotations: Specifc configuration for the Ingress controller
- spec.rules: Define how traffic is routed to services
- path: URL path that will be matched
- pathType: How the path show be matched
- backend.service: The service and port to route traffic to

## Summary:

_ Ingress acts as a smart Traffic Controller or Front door for your entire Kubernetes cluster
- NodePort service lets you open specifc things for individual services. Ingress provides a single point of entry that can route traffic to many different service based on the URL

Analogy:

- Service (ClusterIP/NodePort): Like a direct phone extension or a specific buzzer for one apartment.
- Ingress: Like a Concierge at the front desk of a large hotel. You tell the Concierge where you want to go ("I want the Spa" or "I want the Restaurant"), and they guide you to the correct room.
