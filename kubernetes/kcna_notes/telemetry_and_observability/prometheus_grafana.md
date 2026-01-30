# Prometheus & Grafana

## Prometheus

•	Prometheus is an observability and monitoring system
•	CNCF-graduated project
•	Collects metrics as time-series data
•	Commonly used in Kubernetes environments

Prometheus provides:
•	Metric collection
•	Querying (via PromQL)
•	Alerting (often via Alertmanager)

## Grafana (What & Why)

•	Grafana is a visualisation and analytics platform
•	Used to create dashboards and charts
•	Displays metrics collected from other systems

Grafana:
•	Does not collect metrics itself
•	Uses data sources such as Prometheus

## Relationship Between Prometheus & Grafana

You must understand this relationship clearly:
•	Prometheus:
	•	Collects and stores metrics
•	Grafana:
	•	Queries Prometheus
	•	Visualises the metrics

## kube-state-metrics

What it does:
•	Exposes Kubernetes object state as metrics
•	Uses the Kubernetes API
•	Provides insight into:
	•	Pods
	•	Deployments
	•	Nodes
	•	ReplicaSets

What it does not do:
•	Does not monitor node CPU or memory directly
•	Does not scrape containers

## Prometheus + Grafana in Observability

You should understand that:
Prometheus + Grafana are part of a metrics-based observability stack
They complement:
	•	Logs
	•	Traces
They are commonly used by:
	•	DevOps engineers
	•	SREs

