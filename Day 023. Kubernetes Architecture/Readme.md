Kubernetes, often abbreviated as K8s (because it has eight letters between the 'K' and the 's'), is an open-source container orchestration platform originally developed by Google. It provides a framework for automating the deployment, scaling, and management of containerized applications. Containers are a technology that allows you to package an application and its dependencies into a single, portable unit that can run consistently across different environments.

# Benefits of Kubernetes

Automation: Kubernetes automates many aspects of container orchestration, including deployment, scaling, load balancing, and health monitoring.

Scaling: Kubernetes provides horizontal auto-scaling, which automatically adjusts the number of running container instances based on CPU or custom metrics.

High Availability: Kubernetes is designed for high availability. It can automatically reschedule containers to healthy nodes if a node fails, ensuring that applications remain available and resilient to hardware or software failures.

Rolling Updates and Rollbacks: Kubernetes supports rolling updates, allowing you to update containerized applications without downtime.

Declarative Configuration: You define the desired state of your applications and infrastructure in Kubernetes using YAML or JSON configuration files.

Portability: Kubernetes is cloud-agnostic, meaning you can run it on various cloud providers, on-premises data centers, or even locally on your development machine.

Resource Efficiency: Kubernetes optimizes resource utilization by packing multiple containers onto a single node, thus maximizing the use of hardware resources.

Ecosystem and Extensibility: Kubernetes has a vast ecosystem of add-ons, plugins, and third-party tools that extend its functionality.

Self-Healing: Kubernetes continuously monitors the health of applications and can automatically restart containers that fail.

Secrets and Configuration Management: Kubernetes provides a secure way to manage sensitive data and application configurations, reducing the risk of exposing secrets like API keys and passwords in application code.

Community and Support: Kubernetes has a vibrant and active open-source community, which means you can access a wealth of knowledge, documentation, and community-contributed resources.

Multi-Tenancy: Kubernetes supports multi-tenancy, allowing you to run multiple applications or teams within the same cluster while maintaining isolation and resource allocation controls.

# Kubernetes Architecture
![image](https://github.com/user-attachments/assets/090f5cd5-779f-429b-9c49-fcafbcbf0eef)

Servers in a Kubernetes cluster are given two essential roles: master or node. If a server is assigned with the master role, it is expected to run centralized logical components of Kubernetes. It is possible to have more than one master server to achieve high availability, and the master servers run the Kubernetes API server, key/value store, scheduler, and controllers. These components create the brain of Kubernetes that interacts with the outside world and makes decisions based on the changes in the cluster or user demands.

Node servers receive the definition of the workload from the master and create, update, or delete the containers accordingly. In addition, nodes form the required networking and storage for the containers and forward the traffic between them.

# Master Components

Master components of Kubernetes, also called the control plane, is the primary set of services that provide the API operations, authentication, scheduling, and networking.

etcd

ETCD Datastore

The ETCD Datastore stores information regarding the cluster such as Nodes, PODS, Configs, Secrets, Accounts, Roles, Bindings and Others.

Every information you see when you run the kubectl get command is from the ETCD Server.

Setup - Manual

wget -q --https-only "https://github.com/etcd-io/etcd/releases/download/v3.3.11/etcd-v3.3.11-linux-amd64.tar.gz"

![image](https://github.com/user-attachments/assets/56203a85-9f73-406c-8a2a-7888a3efecdf)

Setup - Kubeadm

If you setup your cluster using kubeadm then kubeadm will deploy etcd server for you as a pod in kube-system namespace.

$ kubectl get pods -n kube-system

![image](https://github.com/user-attachments/assets/c3185b96-9f0e-491e-b69f-6ae49c501fd9)

kube-apiserver

The API server is the central management interface in the Kubernetes cluster for user interactions and status information. It is possible to send and receive data from kubeapiserver, since it is a RESTful API server. Kube-apiserver is responsible for authenticating, validating requests, retrieving and Updating data in ETCD key-value store.

Installing kube-apiserver

If you are bootstrapping kube-apiserver using kubeadm tool, then you don't need to know this, but if you are setting up using the hardway then kube-apiserver is available as a binary in the kubernetes release page.

For example: You can download the kube-apiserver v1.13.0 binary here kube-apiserver
```
wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-apiserver
```
![image](https://github.com/user-attachments/assets/b09c5773-61cc-4d11-b3f9-f3e7bc072b3d)

kube-controller-manager

Kube Controller Manager manages various controllers in kubernetes.

In kubernetes terms, a controller is a process that continuously monitors the state of the components within the system and works towards bringing the whole system to the desired functioning state.

Node Controller

Responsible for monitoring the state of the Nodes and taking necessary actions to keep the application running.

Installing Kube-Controller-Manager

When you install kube-controller-manager the different controllers will get installed as well.

Download the kube-controller-manager binary from the kubernetes release page. For example: You can download kube-controller-manager v1.13.0 here kube-controller-manager
```
$ wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-controller-manager
```
By default all controllers are enabled, but you can choose to enable specific one from kube-controller-manager.service
```
$ cat /etc/systemd/system/kube-controller-manager.service
```

![image](https://github.com/user-attachments/assets/c6631314-25d7-4389-a4e8-7374574ff625)

kube-scheduler

kube-scheduler is responsible for scheduling pods on nodes.

The kube-scheduler is only responsible for deciding which pod goes on which node. It doesn't actually place the pod on the nodes, that's the job of the kubelet.

Install kube-scheduler - Manual

Download the kubescheduler binary from the kubernetes release pages kube-scheduler. For example: To download kube-scheduler v1.13.0, Run the below command.
```
$ wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-scheduler
```
Extract it

Run it as a service

cloud-controller-manager
![image](https://github.com/user-attachments/assets/dda611fb-7581-46c0-adb5-dc10848e7a2e)

Cloud controller managers are the set of bridges that connect Kubernetes resources to the cloud providers. For instance, they manage the storage and networking requirements based on the cloud environment. It is possible to have portable and robust applications running in Kubernetes with the help of cloud controller managers.

# Node Components

Container runtime

The container runtime is required to run the workload as containers in the node servers. It is expected to implement the Container Runtime Interface (CRI) and Docker, rkt, and runc, which are the notable container runtimes for Kubernetes environment.

kubelet

Kubelet is the sole point of contact for the kubernetes cluster

The kubelet will create the pods on the nodes, the scheduler only decides which pods goes where.

Install kubelet

Kubeadm does not deploy kubelet by default. You must manually download and install it.

Download the kubelet binary from the kubernetes release pages kubelet. For example: To download kubelet v1.13.0, Run the below command.
```
$ wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubelet
```
Extract it

Run it as a service

![image](https://github.com/user-attachments/assets/bd9a4e62-afa4-454f-ae7e-570c279c1175)

kube-proxy

Within Kubernetes Cluster, every pod can reach every other pod, this is accomplish by deploying a pod networking cluster to the cluster.

Kube-Proxy is a process that runs on each node in the kubernetes cluster.

Install kube-proxy - Manual

Download the kube-proxy binary from the kubernetes release pages kube-proxy. For example: To download kube-proxy v1.13.0, Run the below command.
```
$ wget https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kube-proxy
```
Extract it.

Run it as a service.
![image](https://github.com/user-attachments/assets/d8d8ea90-c236-48c1-840e-e7a324355ce5)

## Difference Between kubectl and kubelet:

kubectl is a command-line tool used for interacting with the Kubernetes cluster. It allows you to create, inspect, update, and delete resources within the cluster. It's mainly used by administrators and developers for cluster management.

kubelet, on the other hand, is an agent running on each node in the cluster. It's responsible for ensuring that containers are running in a Pod, managing their lifecycle, and reporting the status to the Control Plane.

## Other Concepts

POD

The pod is the building block of Kubernetes computation objects. A pod consists of containers that are tightly coupled and should be treated as a single application. These containers in the same pod are always scheduled on the same node since they share volume and networking interfaces. Therefore, the pod can be imagined as an encapsulated set of containers that should work together and share the same life cycle, such as scaling up or down together.

Pods are the primary and fundamental building blocks of Kubernetes resources, so they are generally managed by higher levels of resources, such as replication sets, deployments, and stateful sets.

How to deploy pods?

Lets now take a look to create a busybox pod

To deploy a docker container by creating a POD.

In the following pod definition, a pod with the name my-first-pod is presented. There is only one container with the Docker image of busybox and the command for the Hello DevOps!

```
apiVersion: v1
kind: Pod
metadata:
    name: my-first-pod
spec:
    containers:
        - name: main
          image: busybox
          command: ['sh', '-c', 'echo Hello DevOps! && sleep 3600']
```

To get the list of pods
```
$ kubectl get pods
```

ReplicaSets

Replication sets (ReplicaSet) are the Kubernetes resources that maintain a set of replica pods running in the cluster. Kubernetes is designed to enable and support high availability. Therefore, it is expected to have the same pod instances running in the cluster as those defined in the replication sets.A replication set definition looks similar to a pod definition, because it encapsulates a pod specification:
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
    name: high-available-hello
spec:
    replicas: 3
    selector:
matchLabels:
    app: hello
template:
    metadata:
        labels:
            app: hello
spec:
    containers:
    - name: main
      image: busybox
      command: ['sh', '-c', 'echo Hello DevOps! && sleep 3600']
```
The replicas field defines the desired number of the pods that should be running in the cluster. Kubernetes controllers inside kube-controller-manager create and manage the pods to fulfill this request. The matchLabels field defines a set of labels to match with the pods that should be replicated.

To Create the replicaset
```
$ kubectl create -f replicaset-definition.yaml
```
To list all the replicaset
```
$ kubectl get replicaset
```
To list pods that are launch by the replicaset
```
$ kubectl get pods
```
Deployments

Deployments are one of the most potent Kubernetes resources that makes it easier to manage containerized applications at large scales. A deployment specification looks similar to a replication set with an encapsulated pod definition:
```
apiVersion: apps/v1
kind: Deployment
metadata:
    name: my-first-deployment
    labels:
        app: nginx
spec:
    replicas: 3
    selector:
        matchLabels:
            app: nginx
    template:
        metadata:
            labels:
                app: nginx
        spec:
            containers:
            - name: nginx
              image: nginx:1.7.9
              ports:
              - containerPort: 80
```
Once the file is ready, create the deployment using deployment definition file
```
$ kubectl create -f deployment-definition.yaml
```
To see the created deployment
```
$ kubectl get deployment
```
The deployment automatically creates a ReplicaSet. To see the replicasets
```
$ kubectl get replicaset
```
The replicasets ultimately creates PODs. To see the PODs
``
$ kubectl get pods
```
Namespaces

This namespace is the default namespace in kubernetes. It is automatically created when kubernetes is setup initially.

To list the pods in default namespace
```
$ kubectl get pods
```
To list the pods in another namespace. Use kubectl get pods command along with the --namespace flag or argument.
```
$ kubectl get pods --namespace=kube-system
```
Here we have a pod definition file, when we create a pod with pod-definition file, the pod is created in the default namespace.
```
  apiVersion: v1
  kind: Pod
  metadata:
    name: myapp-pod
    labels:
       app: myapp
       type: front-end
  spec:
    containers:
    - name: nginx-container
      image: nginx

  $ kubectl create -f pod-definition.yaml
```
To create the pod with the pod-definition file in another namespace, use the --namespace option.
```
kubectl create -f pod-definition.yaml --namespace=dev
```
If you want to make sure that this pod gets you created in the dev env all the time, even if you don't specify in the command line, you can move the --namespace definition into the pod-definition file.
```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  namespace: dev
  labels:
     app: myapp
     type: front-end
spec:
  containers:
  - name: nginx-container
    image: nginx
```
To create a new namespace, create a namespace definition as shown below and then run kubectl create
```
apiVersion: v1
kind: Namespace
metadata:
  name: dev

$ kubectl create -f namespace-dev.yaml
```
Another way to create a namespace
```
$ kubectl create namespace dev
```
Services

Kubernetes Services enables communication between various components within and outside of the application.

Service Types
![image](https://github.com/user-attachments/assets/e38ed038-5035-4a1b-b511-787b6db71788)

NodePort

Where the service makes an internal port accessible on a port on the NODE.
```
apiVersion: v1
kind: Service
metadata:
 name: myapp-service
spec:
 types: NodePort
 ports:
 - targetPort: 80
   port: 80
   nodePort: 30008
```

![image](https://github.com/user-attachments/assets/3770cae8-6346-44a2-9c6a-dcbb94d5ee7b)

To create the service
```
$ kubectl create -f service-definition.yaml
```
To list the services
```
$ kubectl get services
```
To access the application from CLI instead of web browser
```
$ curl http://192.168.1.2:30008
```
ClusterIP

In this case the service creates a Virtual IP inside the cluster to enable communication between different services such as a set of frontend servers to a set of backend servers.

LoadBalancer

Where the service provisions a loadbalancer for our application in supported cloud providers.

Stateful Sets

Kubernetes enables both stateless ephemeral and stateful applications to be run with the same level of scalability and robustness, thanks to stateful sets (StatefulSet).
```
apiVersion: apps/v1beta2
kind: StatefulSet
metadata:
    name: my-first-statefulset
spec:
    selector:
        matchLabels:
            app: nginx
    serviceName: "nginx"
    replicas: 3
    template:
        metadata:
            labels:
                app: nginx
        spec:
            containers:
            - name: nginx
              image: nginx:1.7.9
              ports:
              - containerPort: 80
              volumeMounts:
              - name: www
                mountPath: /usr/share/nginx/html
    volumeClaimTemplates:
    - metadata:
        name: www
    spec:
        accessModes: [ "ReadWriteOnce" ]
        resources:
            requests:
                storage: 1Gi
```

![image](https://github.com/user-attachments/assets/64529d1e-343b-4c63-83ac-b7c20f7b69ed)
