# Docker security principles

From the security point of view, Docker containers use the resources of the host machine but have their own runtime environment.

The most significant advantage of container-based virtualization is that applications with different requirements can run isolated from each other without having to assume the overhead of a separate guest system. At this point, container technology takes advantage of two basic functions of the Linux kernel: the control groups (Cgroups) and the kernel namespaces.

Namespaces provide isolation for processes and mount points, so processes that run in a container cannot interact with or see processes that run in another container.

Control groups (Cgroups) are a feature of the Linux kernel that facilitates the limitation of the use of resources at the level of CPU and memory that a container can use.

Along with the fundamental isolation techniques of the Linux kernel, the latest versions of the Docker engine support technologies like AppArmor, SELinux and Seccomp:

AppArmor allows you to regulate permissions and access of the containers in the filesystem

SELinux provides a system of rules that allows you to implement access controls to the kernel resources

Secure Computing Mode (Seccomp) monitors kernel system calls

# Docker Security Best Practices

## Docker daemon attack surface

Docker Daemon is the main process that manages the life cycle of containers and needs root privileges to run. Unfortunately, Docker daemon executes with root privileges, so it also presents an attack vector. You can refer to the official documentation at https://docs.docker.com/engine/security for more information.

## Security best practices

One application per container using a microservice-oriented approach.

Do not run containers as root, and disable SETUID permissions.

Use the -cap-drop and - cap-add flags to remove and add capabilities in the container.

It is advisable not to use environment variables or run containers in privileged mode if you are going to share secrets.

You must have Docker updated to the latest version to ensure that all security issues have been solved and also to provide the latest features that Docker is incorporating in the core.

Kernel is one of the most vulnerable components in container management as it is shared among all containers. So, special care should be taken to keep the Linux Kernel with the latest update.

Execution with non-root user

It is not good practice to run container with root priviledges.and it is necessary to create a user for each running container.You can add the user inside the Dockerfile with the following commands:

```
RUN useradd <options> USER <user>
```

Start containers in read-only mode

Limiting the use of the filesystem can prevent a potential attacker writing and executing scripts inside the container. For this, flags like read-only can be applied when executing a container.

```
docker run -it --read-only python sh
```

Disable the setuid and setgid permissions

The Set User ID (setuid) and Set Group ID (setgid) bits are special permissions that are used to access directories and files in the operating system by users who do not have root permissions.

The main problem with these bits is that they can be exploited by attackers. At this point, the best practice is to disable the SETUID permissions in the Dockerfile.
```
#This command performs a search for executables and withdraws
#any setuid and setgid permission from any user.
RUN find / -perm +6000 -type f -exec chmod a-s {} ; || true
```
```
#We can also disable the setuid and setgid bits when you start a Docker
#container with the following command:
docker run -d --cap-drop SETGID --cap-drop SETUID
```

### Verifying images with Docker Content Trust

Docker Content Trust (DCT) provides the ability to use digital signatures for data sent to and received from remote Docker registries. These signatures allow client-side or runtime verification of the integrity and publisher of specific image tags.

Through DCT, image publishers can sign their images and image consumers can ensure that the images they pull are signed. Publishers could be individuals or organizations manually signing their content or automated software supply chains signing content as part of their release process.

A particular image REPOSITORY can have multiple tags.DCT is associated with the TAG portion of an image. Each image repository has a set of keys that image publishers use to sign an image tag. Image publishers have discretion on which tags they sign.

Enabling DCT

Step 1: Setting up our registry server

We can set up a private Docker registry on our own server. We can do this with registry image of docker hub at http://hub.docker.com/_/registry
```
docker run -d -p 5000:5000 --restart always --name registry registry:2
docker ps
```

Step 2: Setting up a Notary server
```
Docker Notary https://docs.docker.com/notary/ is a tool that allows you to securely publish and manage images.
```

Notary consists of server and client parts. The client part is installed on the local machine and handles the storage of the keys locally, and it also handles communication with the Notary server. You can check the GitHub repository at https://github.com/docker/notary

From the server point of view, you can find official precompiled binaries for many operating systems in the GitHub repository at https://github.com/theupdateframework/notary/releases.

Use the docker-compose file that we find inside the repository at https://github.com/theupdateframework/notary.git
```
#clone repository
git clone https://github.com/theupdateframework/notary.git
cd notary
#Use the docker-compose file that we find inside the repository
docker-compose build
docker-compose up -d
#Run the following commands to connect the notary server to the Docker client:
export DOCKER_CONTENT_TRUST=1
export DOCKER_CONTENT_TRUST_SERVER=https://localhost:4443

#check notary server is up
docker ps
```
Now, we need to push an image to our repository. We do this by tagging an image with the repository URL, then calling Docker push on that tag:
```
docker pull ubuntu:latest
docker tag ubuntu:latest localhost:5000/ubuntu:mine
docker push localhost:5000/ubuntu:mine
```

Lets sign image. Adding the key:
```
docker trust key generate sample_signer
docker trust signer add --key sample_signer.pub sample_signer localhost:5000/ubuntu:mine
docker trust inspect localhost:5000/ubuntu:mine
docker trust sign localhost:5000/ubuntu:mine
```
Resource limitation

We must limit the use of CPU and memory for each of the containers because all containers share host machine resources equitably.
```
docker run --help | grep ‘cpu\|device\|memory’
```
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/6a2d303a-b361-4317-a2d6-d8b5225685a3)

## Docker Host Security

We will discuss kernel-enhancement features to limit system calls such as Docker daemon and AppArmor and Seccomp profiles,

### Docker daemon security

Do not expose the Docker daemon socket

Docker works primarily as a client that communicates with a daemon process called dockerd. This process with root privileges is a socket located in the path /var/run/docker.sock.

Do not enabletcpDocker daemon socket - If you are running docker daemon with -H tcp://0.0.0.0:XXX or similar you are exposing un-encrypted and unauthenticated direct access to the Docker daemon, if the host is internet connected this means the docker daemon on your computer can be used by anyone from the public internet.

Do not expose /var/run/docker.sock to other containers - You should not run If your docker image with -v /var/run/docker.sock://var/run/docker.sock

### Auditing files and directories

The Linux Audit daemon(auditd) is a framework that allows auditing events on Linux systems and is configured using two files: one for the daemon itself (auditd.conf) and one for the rules used by the auditctl tool (audit.rules). These files are located in /etc/audit directory.

auditd.conf: This file configures the Linux audit daemon (auditd) and focuses on where and how events should be traced. It also defines how to behave when the disk is full, the rotation of the log file, and the number of logs to keep. The default settings will be appropriate for most systems.

audit.rules: This file configures which events should be audited.

```
auditctl -a exit,always -F path=/etc/passwd -F perm=wa

# Monitor Docker binary files
-w /usr/bin/docker -p rwxa -k docker

# Monitor Docker data directory
-w /var/lib/docker -p rwxa -k docker

# Monitor Docker configuration directory
-w /etc/docker -p rwxa -k docker

# Monitor Docker systemd unit files
-w /lib/systemd/system/docker.service -p rwxa -k docker
-w /lib/systemd/system/docker.socket -p rwxa -k docker

# Monitor Docker default configuration file
-w /etc/default/docker -p rwxa -k docker

# Monitor Docker daemon configuration file
-w /etc/docker/daemon.json -p rwxa -k docker

# Monitor Docker containerd binary file
-w /usr/bin/docker-containerd -p rwxa -k docker

# Monitor Docker runc binary file
-w /usr/bin/docker-runc -p rwxa -k docker

#We need to restart the sudit daemon
sudo service auditd restart
```

### Kernel Linux security and SELinux

Security-Enhanced Linux (SELinux) is a Linux kernel security module that provides different security controls like access controls, integrity controls, and Role-Based Access Control (RBAC).These tools are Mandatory Access Control (MAC) tools that impose security rules in Linux to ensure that apart from the normal read-write-execute rules that apply to files and processes, more precise rules can be applied to them at the kernel level.

We can install it using command
```
yum install selinux-policy selinux-policy-targeted
```
Check status of selinux using sestatus command
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/61c5bb6b-7945-4956-95e2-efd90b5ecaaf)


### Apparmor and Seccomp profiles

Apparmor provides protection for external and internal threats, enabling system administrators to associate a secure profile with each application, which restricts that application’s capabilities.

AppArmor (Application Armor) is a Linux security module that protects an operating system and its applications from security threats. To use it, a system administrator associates an AppArmor security profile with each program. Docker expects to find an AppArmor policy loaded and enforced.
```
docker info
docker info | grep apparmor
```
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/7c05d03a-da0d-43b5-9a89-30426d38513d)

When you run a container, it uses the docker-default policy unless you override it with the security-opt option. For example, the following explicitly specifies the default policy:
```
$ docker run --rm -it --security-opt apparmor=docker-default hello-world
```
Load and unload profiles

To load a new profile into AppArmor for use with containers:
```
apparmor_parser -r -W /path/to/your_profile
```
Then, run the custom profile with --security-opt:

```
docker run --rm -it --security-opt apparmor=your_profile hello-world
```

To unload a profile from AppArmor:

```
# unload the profile
apparmor_parser -R /path/to/profile
```

Secure computing mode (seccomp) is a Linux kernel feature. You can use it to restrict the actions available within the container. Seccomp is a tool that allows you to limit the exposure of the kernel to system calls by an application.It uses Berkeley Packet Filter (BPF) rules to filter syscalls and control how they are handled.

The following commands show you how to check if seccomp is enabled in your system’s kernel:

```
docker info | grep 
```
seccomp Security Options: apparmor seccomp

A container gets the default seccomp profile when you run it, unless you override this by passing the --security-opt flag to the docker run command.

We can create the following file that allows us to define the system calls that we want to block. We are blocking the chmod and chown syscalls in this example.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/39ffc422-efbc-4e35-aed4-37a10b7e9c15)


```
touch profile_policy.json
{
  "defaultAction": "SCMP_ACT_ALLOW",
  "syscalls": [
  {
    "name": "chmod",
    "action": "SCMP_ACT_ERRNO"
  },
  {
    "name": "chown",
    "action": "SCMP_ACT_ERRNO"
}

```
Then, we can execute the container based on the alpine distribution, passing the profile_policy.json policy file as a parameter. The following example command starts an interactive container based on the Alpine image and starts a shell process. It also applies the seccomp profile described by profile_policy.json to it.
```
docker run -it --security-opt seccomp=profile_policy.json alpine /bin/sh
```
We can verify that the chmod and chown commands cannot be used inside the container, and we get the Operation not permitted error when executing them:

Run these commands in container

```
/ # chown root:root bin 
#chown: bin: Operation not permitted 
/ # chmod +x /etc/resolv.conf 
#chmod: /etc/resolv.conf: Operation not permitted

```
Run without the default seccomp profile
```
docker run --rm -it --cap-add SYS_PTRACE --security-opt seccomp=unconfined benhall/strace-ubuntu
```
Docker Bench Security

Docker bench security is a shell script that looks for common best practice patterns around the implementation of Docker containers in production. It is a set of bash scripts, which must be run as a root user on any machine with Docker installed, and the tool will produce a report with all the checks.The source code is available in the GitHub repository at https://github.com/docker/dockerbench-security.

The tool will inspect the following components:

Host configuration

The Daemon Docker configuration

Docker daemon configuration files

Image container and compilation files

Runtime container

Docker security operations

We can execute the following command to start the Docker bench security for analyzing the Docker host with a default configuration:
```
docker run -it --net host --pid host --cap-add audit_control 
-v /var/lib:/var/lib 
-v /var/run/docker.sock:/var/run/docker.sock 
-v /usr/lib/systemd:/usr/lib/systemd 
-v /etc:/etc --label docker_bench_security 
docker/docker-bench-security
```
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/cf63d6e6-13eb-46ca-a73e-0589ddb50514)

### Docker bench security execution

Host Configuration: This section checks the security over the host Docker configuration.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/d89acd82-375a-4733-99f9-db7d37774c7c)


Docker daemon configuration files: This section offers recommendations about the security of the Docker daemon
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/324fa236-6aba-4906-9a87-3a62a0be2d79)


Docker daemon configuration files: This section shows information about the configuration files used by the daemon Docker.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/9815048c-82fe-4764-92d1-958dd7b81814)


Daemon Docker configuration: This section shows information about the Docker daemon configuration and can detect containers that are running on the same Docker host and checking the access to each other’s network traffic.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/174c4874-9f03-4259-b68e-3c3154ccb56f)




Daemon Docker configuration: This section shows information about the Docker daemon configuration and can detect containers that are running on the same Docker host and checking the access to each other’s network traffic.
