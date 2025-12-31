# Scale and Load Balance Applications

## Two ways to Scale

- Declarative (Best Practice): Edit the `replicas` field in the `.yaml` file and run `kubectl apply`. This is better for version control
- Imperative (Quick Fix): Use `kubectl scale deployment <name> --replicas=X`. Great for emergencies and quick testing.

## Scale down

```sh
kubectl scale deployment <name> --replicas=X
```


## Loadbalancing 

WIP: Labex labs were pretty bad when it comes to showing loadbalancing
