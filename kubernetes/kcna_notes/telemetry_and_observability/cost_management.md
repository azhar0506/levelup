# Cost Management

## Why Cost Management Matters

•	Cloud-native platforms make cost visibility and optimisation possible
•	Cost management is not just about cheapest resources
•	It’s about:
	•	Using only what you need
	•	Avoiding idle or wasted resources
	•	Scaling resources dynamically

## Cloud Resource Consumption Models

On-demand
•	Pay for resources as needed
•	Flexible but more expensive
Reserved
•	Commit for a period
•	Cheaper long-term
Spot
•	Lower cost
•	No availability guarantees
•	Suitable for fault-tolerant workloads

## Right-Sizing & Autoscaling

Over-provisioning is common
Cloud-native apps should:
•	Scale up when needed
•	Scale down when not
Autoscaling reduces waste
Better to scale dynamically than pay for unused capacity

## Cloud Anomaly Detection 

Cloud anomaly detection identifies:
•	Unexpected cost spikes
•	Abnormal resource usage
•	Unusual ingress / egress patterns
Helps detect:
•	Misconfigurations
•	Runaway workloads
•	Potential security issues

## KubeCost — Cost Observability Tool

Kubecost is a tool for Kubernetes cost observability

What it does:
•	Tracks Kubernetes resource costs
•	Breaks down cost by:
	•	Namespace
	•	Pod
	•	Workload
•	Available as:
	•	Open source
	•	Commercial offering

