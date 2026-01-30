### What API endpoint does kubectl top use to read metrics?

/apis/metrics.k8s.io

### What is the primary purpose of Observability in Cloud Native systems?

Refers to the ability to accurately measure a systems internal state through its external outputs, such as logs, metrics, and traces. By analysing these outputs, developers and oeprators can gain insights into how their system is behavingm, identify issues, and make data-driven decisions.

### What characteristic of Metrics makes them essential for Observability?

They provide a quantitative view into system performance and behavior at specific points in time. By measuring metrics at set intervals, teams can understand how tehir systems behave under different loads, identify trends and anomalies, and make data-driven decisions.

### What is a Counter in the context of Cloud Native Observability?

A cumulative metric that increases over time. It's a type of metric that represents a single value that increments over time, often used to count the number of requests, errors, or other significant events.

### Whats an example of a Trace in Cloud Native Observability?

Tracking the process of request through a system. It provides a detailed, step-by-step record of how a request was handled, including any interactions with multiple services or components. This allows developers and operators to understand the flow of requests and identify potential issues.

### What role do Alerts play in Cloud Native Observability?

They provide notifications about system anomalies or issues. They allow developers and operators to quickly identify and respond to problems, reducing downtime and improving overall system reliability.

### What are the three fundamental pillars of Cloud Native Observability?

- Logs
- Metrics
- Traces

### Which pillar of Cloud Native Observability would be most useful for predicting future resource usage?

Metrics - since they provude quantitative data about system performance and resource usage over time. By analysing historical metrics data, it is possible to identify trends and patterns that can be used to predict future resource usage. 


### In Cloud Native Observability, which format would be considered user-friendly for outputting logging data whilst supporting complex and hierarchical data?

JSON

### What does the kubectl top command do in a Kubernetes environment?

`kubectl top` is used to display the current reosurce utilisation, such as CPU and memory usage, for ndoes or pods in a Kubernetes clsuter. It helps administrators monitor the performance and resource consumption of their workloads