# Update and Rollback Applications

## Update the Application

### Rolling Update Strategy in Kubernetes

When updating a deployment.yaml with a new image:

- It starts a new pod with the new image.
- It stops old pods only after new ones are ready
- Zero downtime for users

### Monitoring Change: `rollout status`

When you make an update to the deployment.yaml, you can use the following command as a progress bar for the update once applied:

```sh
kubectl rollout status deployment <name>
```


## Verify Successful Update

### Verification Checklist

Dont trust that it worked, check these things:
- Version: If the container is running the new image?
- Count: Are the correct number of replicas "Ready"?
- History: Does the revision number increase?

### `kubectl rollout history`

- Kubernetes stores previous configurations as Revisions
- Each time you change `spec.template`, a new version is created.

```sh
kubectl rollout history deployment <name>
```

Example output:

```sh
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

## Rolling Back Deployments

```sh
kubectl rollout undo deployment <name>
```

- reverts the deployment to the state it was in during the immediately preceding revision

### Understanding the Revision History

- After a rollback, Kubernetes doesn't go back to revision 1, it creates a new version that is the clone of the old stable version
- You can go back a specific version:

```sh
kubectl rollout undo deployment <name> --to- revision=1
```


