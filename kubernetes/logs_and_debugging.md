# Logs and Debugging

## Check Application Configuration

### Get YAML configuration example

```sh
kubectl get pod nginx-pod -o yaml
```

### Example output (Partial)

```sh
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  namespace: default
  labels:
    app: nginx
spec:
  containers:
    - image: nginx:latest
      imagePullPolicy: Always
      name: nginx
      ports:
        - containerPort: 80
      resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
```

### Get more detailed YAML configuration example

```sh
kubectl describe pod nginx-pod
```

### Example output (Partial)

```sh
Name:         nginx-pod
Namespace:    default
Priority:     0
Node:         minikube/172.17.0.2
Start Time:   [timestamp]
Labels:       app=nginx
Annotations:  <none>
Status:       Running
IP:           172.17.0.5
Containers:
  nginx:
    Container ID:   docker://[container-id]
    Image:          nginx:latest
    Image ID:       docker-pullable://nginx@[image-digest]
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
    Ready:          True
    Restart Count:  0
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
```

Key things for look for when inspecting configs:

- Resource metadata
- Container images and ports
- Replica count (for Deployment)
- Resource status and conditions


## View Logs of an Application


### View logs of a specific pod (Example)

```sh
kubectl logs nginx-pod
```

### Example output

```sh
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
...
2023/xx/xx [notice] xxxx#x: signal process started
```

### Follow logs in real time (Example)

```sh
kubectl logs -f nginx-pod
```

## Debug Using kubectl exec

### Running interactive shell in a pod (Example)

```sh
kubectl exec -it nginx-pod -- /bin/bash
```

## Troubleshooting

1. Check Deployment:

```sh
kubectl describe deployment <name>
```
    - Look for conditions like: Are replica desired vs available

2. Check Pods:

```sh
kubectl describe pods -l app=<label>
```

    - Look for the **Events** section at the bottom. This is where you find errors like `ImagePullBackOff` or `ErrImagePull`

3. Check Infrastructure:

```sh
kubectl describe nodes <node-name>
```

    - Look for the Resrouce pressure (CPU/Memory) or network issues

## Cluster Events

1. Why `kubectl get events`?

While `descrie` shows events for a specific resource, `kubectl get events` shows what is happening across the entire namespace or cluster

### Key Commands & Flags

```sh
kubectl get events
```

- Shows recent activitiies

```sh
kubectl get events -w
```

- real-time monitoring. (Use this on a different terminal tab)


```sh
kubectl get events --sort-by='.metadata.creationTimestamp'
```

- Chronological order - if you want to know the sequence of crash

### Filtering (The "Signal-to-Noise" Filter)

```sh
kubectl get events --field-selector type=Warning
```

- find errors only


```sh
kubectl get events --field-selector involvedObject.kind=Deployment
```

- focus on one type of error
