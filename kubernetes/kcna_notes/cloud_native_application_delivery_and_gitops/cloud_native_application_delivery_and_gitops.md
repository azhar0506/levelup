# Cloud Native Application Delivery & GitOps 

## Cloud Native Application Delivery

Cloud Native Application Delivery focuses on:
•	Fast
•	Scalable
•	Resilient

application deployment in cloud environments.

It commonly uses:
•	Containers
•	Microservices
•	Kubernetes orchestration
•	Declarative configuration

## What is GitOps

GitOps is a way of managing Kubernetes applications and infrastructure where:
•	Git is the single source of truth
•	Desired state is defined declaratively
•	The cluster continuously reconciles itself to match Git

## Core GitOps Principles

You should know that GitOps provides:
•	Version control
•	Auditability
•	Rollbacks
•	Consistency between environments

GitOps tools:
•	Continuously compare desired state (Git) vs actual state (cluster)
•	Automatically reconcile differences

## Argo CD

You must recognise:
•	Argo CD is a GitOps continuous delivery tool
•	It synchronises Kubernetes clusters with Git repositories
•	Detects drift and reconciles automatically (or manually)

## Argo CD Workflows

Argo Workflows
•	Used for orchestrating complex, multi-step workflows
•	Supports:
	•	Sequential execution
	•	Parallel execution
	•	CI/CD style pipelines

## Flux — GitOps Alternative

You must be aware of:
	•	Flux
	•	Another CNCF GitOps tool
	•	Often considered the “textbook GitOps implementation”

Key Flux Characteristics 
	•	Pull-based by design
	•	Continuous synchronisation is core
	•	Highly aligned with GitOps philosophy

## Argo CD vs Flux (Conceptual Comparison)

| Aspect              | Argo CD                | Flux                    |
|---------------------|------------------------|-------------------------|
| Sync model          | Optional auto-sync     | Always pull-based       |
| Architecture        | More centralised       | More decentralised      |
| GitOps philosophy   | Strong                 | Core design principle   |
| CNCF alignment      | Yes                    | Yes                     |

## GitOps Toolkit 

You must recognise:
•	GitOps Toolkit
•	A set of modular controllers used by Flux

You should know it includes:
•	Source Controller
•	Kustomize Controller
•	Helm Controller
•	Notification Controller