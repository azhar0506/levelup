### What is a major challenge with monolithic applications?

In monolithic applications, all components are interconnected and share the same codebase. This means that a change in one area can inadvertently affect other parts of the application leading to unexpected issues and making testing and deployment more complex


### In a Monolithic application, what issue can arise due to multiple applications being dependent on the same library?

If multiple components or applications rely on the same library, updating or changing the library for one application can cause compatibility issues with others. This can lead to unexpected behavior or break functionalities in parts of the application that were previously working fine.

### What could the term “tight coupling” refer to in the context of monolithic applications?

Tight coupling means that different components of an application, such as the User Interface (UI) and Business Logic, are closely linked and interdependent. This makes it challenging to work on them separately, as changes to one component often require changes to others, complicating development and maintenance. 

### What is a significant advantage of microservices in cloud-native applications?

Microservices enhance flexibility by allowing each service to be developed, deployed, and scaled independently. This modularity makes the application easier to manage, as changes or updates to one service do not impact the entire system.

### What is a significant advantage of using autoscaling in Cloud Native patterns?

Autoscaling enabled an application to automatically adjust its resources based on real-time workload, ensuring that the application can handle varying levels of demand efficiently, This helps maintain performance and optimise resource usage without manual intervention 

### What are the fundamental characteristics that define a Cloud Native Application?

Resilient - they can withstand failures
Agile - Allowing for rapid development and deployment
Operable - ensuring ease of management 
Observable - enabling effective monitoring and troubleshooting

### What does “Self Healing” refer to in the context of Cloud Native practices?

In Cloud Native practice, self-healing refers to the ability of an application to detect failures or issues and automatically recover from them. This includes restarting failed processes, reallocating resources, or rerouting traffic to maintain availability and performance without manual intervention


### What is the purpose of automation in a Cloud Native application?

Automation in Cloud Native applications aim to provide speed and agility by automating tasks such as infrastructure provisioning, application deployment, and updates. This allows for faster interaction, reduces human error, and ensures consistency across environments. 

### Which automation tool is primarily focused on Infrastructure as Code (IaC)?

Terraform is specifically designed for IaC. It allows users to define and provision infrastructure using code, enabling automated, consistent, and repeatable deployments of cloud resources across various providers.

### How could Ansible facilitate Cloud native Automation?

Ansible is a versatile automation tool that can be used to automate various aspects of cloud-native environments, including managing container and application lifecycles, deploying infrastructure, and automating configuration tasks. It provides a consistent way to automate complex workflows across different platforms 

### Which of the following is a key function of Terraform in Cloud Native Automation?

Terraform specialises in Infrastructure as Code (IaC), enabling users to define and manage cloud resources through code. This allows for consistent and reproducible infrastructure deployments across different environments, improving automation and reducing configuration errors. 

### In the context of CI/CD, what does “Continuous Integration” encourage?

CI encourages developers to frequently check in their code to a shared repository. Automated tests are run on each code commit, ensuring that the new code integrates smoothly with the existing codebase and helping to catch bugs early in the development process. 

### What best describes the concept of Continuous Delivery in the context of CI/CD?

CD is a practice where code changes are automatically built, tested, and prepared for release. It emphasises automation in testing and integration, ensuring that the application is always in a releasable state, even if it’s not immediately deployed to production. 


### What does the term ‘Continuous Deployment’ mean in the context of CI/CD?

CD is the practice where code changes that pass automated testing are automatically deployed to the production environment without the need for manual intervention. It ensures rapid and frequent release of new features, bug fixes, and updates directly to users.


### What is the zero trust security model in a Cloud Native context?

In the zero trust security model, no component, user, or service is trusted by default, regardless of whether it is inside or outside the network perimeter. Every request is authenticated, authorised, and encrypted, ensuring that only verified and legitimate actions are allowed.


### What does the Cloud Native principle of “Speed, Efficiency and Cost Saving” promote?
 
Promotes the use of autoscaling to adjust resources based on real-time demand, adopting serverless architecture for efficient resource usage, and applying proactive cost management strategies. These practices ensure optimal performance while minimising costs. 


### What is a key consideration when designing an application or infrastructure in cloud native practices?

Acknowledging and planning for potential component failure is crucial. This approach involves building systems with redundancy, self-healing capabilities, and scalability to ensure high availability and reliability, even when individual components fail. 

### How does the concept of 'Least Privilege' contribute to Cloud Native security?

This means assigning the minimum permissions necessary for each user or component to perform their required tasks. This minimises the potential damage from security breaches, as even if an account or component is compromised, its access is limited to only what is necessary.

### In the context of a Cloud Native ecosystem, what does "Secure by Default" mean?

This means designing and configuring systems with security best practices from the outset. This includes secure configurations, access controls, and leveraging security tools and processes to ensure that the components are protected against threats without requiring additional adjustments.


### What are Kubernetes “replicas” used for in the context of Self Healing?

Replicas ensure that a specified number of pod instances are always running for a giver deployment. If a pod fails or is terminated, the replica controller automatically creates a new one to maintain the desired state, providing self-healing capabilities.

### Why is service discovery important in Cloud Native applications?

It enables automatic detection of services. This is especially important in dynamic environments, like Kubernetes, where services may be added, removed, or relocated frequently. Service discovery ensures that applications can find and communicate with each other without manual configuration

### In Kubernetes, which tools or methods can be used for service discovery?

In Kubernetes, service discovery is facilitated using Environment Variables and built-in DNS. Environment Variables can automatically populate service-related information, and Kubernetes’ built-in DNS server allows service to communicate using DNS names. These methods enable automatic service detection and routing within the cluster. 

### What is Autoscaling?

The process of automatically adjusting the resources (such as computing instances, pods, or storage) allocated to an application based on real-time workload and demand. This helps maintain optimal performance, cost efficiency, and availability without manual intervention.

### What does vertical scaling involve?

Vertical Scaling, also known as “scaling up or down”, involves adding or removing resources (such as CPU, memory or storage) to or from an existing instance or resource. This increases or decreases the capacity of that single resource without changing the number of instances. 

### What is Horizontal Scaling?

Involves adding or removing resources, such as servers or instances, to a system to handle increased or decreased workload. This type of scaling enhances capacity by increasing the number of resources rather than changing the capacity of existing resources. 

### In the context of Autoscaling, what does the Cluster Autoscaler tool do?

It automatically adjusts the size of a Kubernetes cluster by adding or removing nodes based on the resource requirements of the workloads running in the cluster. It helps ensure that the cluster has the right amount of resources to handle the current workload. 

### What is the function of Horizontal Pod Autoscalers (HPA) in Kubernetes?

The HPA in Kubernetes automatically scales the number of replicas of a pod based on observed metrics such as CPU utilisation or customer metrics. This helps ensure that the application can handle varying loads efficiently by adjusting the number of pod instances dynamically.

### What are Vertical Pod Autoscalers (VPA) in Kubernetes used for?

VPA automatically adjusts the resource requests and limits (such as CPU and memory) for containers in a pod based on their usage patterns. This helps ensure that the pod has the appropriate amount of resources, improving performance and resource utilisation.

### What is Keda in the context of Autoscaling? 

Keda (Kubernetes-based Event Driven Autoscaler) is an event-driven autoscaling solution for Kubernetes. It allows applications to scale based on external event sources, such as message queues or databases, using a custom resource called ScaledObjects to define scaling criteria behaviour. 

### What is the key difference in using Serverless computing services as compared to managing your own servers?

Serverless computing services, such as AWS Lambda, handle server management and maintenance tasks, such as provisioning, scaling, and patching. THis allows developers to focus on writing code without worrying about server management.

### What is a key characteristic of Serverless architecture?

A key characteristic of serverless architecture is that it runs in response to events. Functions or applications are executed only when certain events occur, such as API calls, database updates, or file uploads, making it a highly efficient and cost-effective model.

### Which two aspects of Serverless computing are critical to understand from a cost perspective?

Code execution and autoscaling are the two most critical factors that affect costs in serverless computing. In a serverless model, you are charged based on the number of function executions and the time taken to execute them. Autoscaling, which dynamically adjusts resources based on demand, ensures that you only pay for the resources used, which directly impacts costs.

### What is one of the challenges posed by Serverless solutions from a Cloud Native viewpoint?

They may lead to vendor lock-in due to lack of standardised APIs

### What is a possible disadvantage of using Serverless architecture?

Serverless architecture can incur latency during periods of inactivity due to the “cold start” issue. When a serverless function is invoked after a period of inactivity, the infrastructure may need to initialise a new instance of the function, causing a slight delay before the function is executed. 

### What is the purpose of the CloudEvents specification?

The CloudEvents specification provides a standardised way of describing event data across different services, platforms, and systems. This helps ensure interoperability and consistency in how events are produced, transmitted, and consumed in cloud-native environments, making it easier to build event-driven applications. 

### How does Serverless architecture handle concurrency?

They handle concurrency by automatically scaling the number of instances based on incoming requests. THis allows them to manage concurrent executions effectively without requiring manual intervention 

### Which specification outlines how a filesystem bundle should be packaged into an image?

The image specification outlines the requirements for packaging a filesystem bundle in a container image. It defines the format of the image, including the layers, metadata, and other components that make up the image. 

### What is the purpose of the Container Storage Interface (CSI)

An open standard that provides a common interface for container orchestration systems, such as Kubernetes, to interact with different storage solutions. It allows storage vendors to write a single CSI plugin that can be used across multiple container orchestration systems.

### What does the Container Runtime Interface (CRI) enable in the Kubernetes ecosystem?

This is an API that enables the Kubernetes ecosystem to work with multiple container runtimes. It allows the kubelet, a component of the Kubernetes nodes, to use a wide variety of container runtimes, providing flexibility and choice in terms of containerisation.

### What specification does the Open Container Initiative outline for running a filesystem bundle?

It outlines the runtime specification, which defines how a filesystem bundle should be executed as a container runtime environment. The runtime specification provides a standardised interface for running containers, ensuring that different runtimes can execute containers in a consistent and predictable manner. 

### What is chroot?

Chroot is a process that allows you to change the root directory for a running process and its children, effectively isolating them from the rest of the system. This is commonly used in containerisation and virtualisation technologies 

### What are the two key ingredients that Docker brought together to create its solution?

Linux Namespaces and control groups. Linux Namespaces provide a way to isolate processes at the kernel level, which cgroups allow for resource allocation and isolation. By combining these technologies, Docker created a lightweight containerisation platform that provided strong isolation guarantees.

### Why are Docker containers preferred over virtual machines?

They are faster to deploy and consume less system resources. Containers share the same kernel as the host operating system, which means that they don;t require a separate operating system instance like virtual machines do. This makes them much more lightweight and efficient in terms of resource usage.

### What is the network namespace in Linux used for?

The network namespace in Linux is used to provide a complete, isolated networking stack for each namespace. This means that each namespace can have its own IP addresses, routing tables, firewall rules, and other networking configurations, which are separate from those of other namespaces and the host system. 

### What is the purpose of the “i” flag when running the `docker run` command?

Short for “--interactive”, tells Docker to keep the standard input (STDIN) open after starting the container. This allows you to interact with the container’s process as if it were running on your local machine.

### What is the purpose of the “t” flag when running the `docker run` command?

Short for “--tty”, tells DOcker to allocate pseudo-TTY (terminal input/output environment) for the container. This allows you to interact with the container as if it were running on your local machine, which can be useful for debugging and troubleshooting purposes

### What is the purpose of the `docker run` command followed by an image name?

Creates a new container instance from the specified image and runs it in detached mode or interactive mode depending on the options used. If the image doesn’t exist locally, Docker will attempt to pull it from Docker Hub before starting the container.

### What is a container image?

A container is a portable, self-contained bundle of software and its dependencies that can be executed consistently across different environments. It includes everything needed to run an application, such as code, libraries, frameworks, and settings, making it easy to deploy and manage applications. 


### What is the difference between a container and container image?

A container is a running instance of the software, whereas a container image is a bundle of software that includes everything needed to run an application. Containers are created by instantiating an image, and they can be started, stopped, and deleted as needed.


### What is a container registry?

A service that hosts and distributes container images. Registries provide a centralised location where images can be stored, shared, and accessed by multiple users or systems. They typically offer features such as image storage, versioning, tagging, and access control.

### What is a tag in the context of container images?

Used to distinguish a specific version or variant of an image. Tags provide a way to identify and reference different versions of an image, making it easier to manage and track changes over time.

### What is the purpose of the “latest” tag in Docker?

Serves as a default tag when working with images if a specific tag is not specified. When you pull or use an image without specifying a particular tag, Docker will automatically use the image with the “latest” tag. This simplifies the process of using and managing container images.

### What is a union filesystem in the context of container images?

This refers to a special type of filesystem that combines multiple individual layers into a single, unified view. This allows the contents of different layers to be accessed and used together seamlessly, even though they may originate from separate sources. 

### What is a digest in the context of container images?

This refers to a secure and unique identifier that represents an image in a container registry. DIgests are typically calculated using cryptographic hash functions, which produce a fixed-length string that uniquely identifies the content of the image.

### What is the difference between a digest and an image ID?

A digest isa checksum taken from a container registry, which represents the contents of an image as it exists in the registry. Digests are typically used to verify the integrity of images when they are pulled or pushed between registries. An image ID, is a checksum based on the local container image, which represented the actual bytes stored on disk. Image IDs are typically used by Docker and other container runtimes to identify and manage images locally. 

### What is the container engine being used by Docker?

containerd is an industry standard container runtime that is designed to manage the complete lifecycle of containers on a node. It’s built by Docker and is the default container engine used by Docker.

### What is the purpose of the –rm option when running a Docker container?

The `--rm` option tells Docker to automatically remove the container when it exits or is stopped. This can be useful for containers that are only needed temporarily and should not persist after they finish running.

### What command, in the original Docker command syntax, would display all containers, irrespective of their state, including those that have exited?

`docker ps -a`. The -a flag tells Docker to display all containers, including those that are stopped or have exited. So, the command docker ps -a will list all containers, regardless of their state. 

### How can you override the default command in a DOcker container when running it?

When you add a command to the end of the docker run command, it overrides the default command specified in the Dockerfile. This allows you to customise the behaviour of the container without modifying the original image. 

### What does the `it` option do when running a Docker container

The `-it` option (short for interactive and tty) allows you to run a Docker container in interactive mode, which means you can interact with the container as if it were a local shell session.

### Which command is used to remove a Docker container?

Docker rm


### What is the purpose of running a container as a non-root user?

To improve security by limiting privileges. This is the correct answer because running a container as a non-root user reduces the attack surface and prevents malicious code from gaining elevated privileges. By default containers run with root privileges, which can be a security risk if an attacker gains access to the container. Running as a non-root user limits the damage that can be done in case of a breach.


### What does the command `docker run --rm nginx` do?

Pulls the nginx image if it does not exist, runs a container and removes the container upon exit. `--rm` tells Docker to automatically remove the container when it exits. If the nginx image does not already exist locally, Docker will pull it from the registry before running the container.

### What is the purpose of the `-d` option in the command `docker run -d --rm -P nginx`?

This `-d` option in the command detaches the container from the terminal, allow it to run in the background.

### What is the purpose of using `-p` option in the command `docker run -d --rm -p 12345:80 nginx`

The `-p` option in the command specifies the port to be used for connectivitiy to the container. In this case, it maps port 80 inside the container to port 12345 on the host machine. This allows external traffic to reach the container's web server (nginx) through the specified host port

### What is the purpose of using a volume in Docker?

Store and mange data in a container. Volumes provide a way to persist data across container restarts, allowing you to maintain state and keep your data safe even when containers are created or deleted. By mounting a host directory as a volume inside a containerm you can ensure that data written by the container is preserved.

### What is the better approach for managing files used by a container instead of modifying them directly within the container?

Using a volume that containers the data and passing it to the container provides a clean way to manage files outside of the container's filesystem. By mounting a host directory as a volume inside a container, you can share files between the host and the container, ensuring that changes made by the container are persisted even when the container is restarted or deleted. 

### How do you publish all exposed ports of a container when running it with Docker?

The -P flag tells Docker to publish all exposed ports of the container to th host machine. When you run a container with the -P flag, Docker will automatically map any exposed port in the container to a random available port on the host machine. 

### Which command is used to execute another process inside a running Docker container?

`docker exec` allows you to run a command or execute another process inside a running Docker container. you specify the name of the container and the command you want to execute, and Docker will run the command in a new process within the existing container.