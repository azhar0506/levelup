### GitOps can be best described as?

A set of practices that uses Git as a single source of trusth for clsuter management and applicaiton delivery

### What is the primary role of Argo in the context of Cloud Native Application Delivery and GitOps?

A cloud native tool used for applciaiton delviery. It provides a set of tools that enable developers to automate the deployment of their applications in cloud-native environments, such as Kubernetes cluster. Argo's primary role is to simplify and streamline the process of delivering applicaitons, making it eaasier for developers to focus on writing code rather than managing infrastructure.

### In Argo CD, how is the initial admin password retrieved?

By querying the `argocd-initial-admin-secret` using a kubectl get secret command

### Which GitOps engine is capable of orchestrating parallel jobs on Kubernetes?

Argo Workflows - a GitOps enginer that allows users to define workflows as code and execute them on Kubernetes. It's specificallty designed to orchestrate complex workflows, including parallel jobs, making it an ideal choice for managing large-scale deployments on Kubernetes.

### Which GitOps delivery tool utilises the GitOps Toolkit?

Flux - designed for GitOps practices, and the GitOps Toolkit is a collection of specialised APIs and controllers built specifically to manage and automate the continuious delivery of Kubernetes resources in Flux

### In the GitOps paradigm for Kubernetes, which tool is specifically designed to ensure that the state of a cluster matches the configuration stored in a Git repository?

Flux - GitOps tool designed to ensure that the desired state of a Kubernetes cluster, as defined in a Git repository, is continuously synchronised with the actual cluster state. Flux automatically applies changes to the cluster when it detects differnces between the repositories configuration and the current state of the cluster.