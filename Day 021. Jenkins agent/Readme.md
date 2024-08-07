# Day 21. Jenkins agent
## Jenkins Master

A Jenkins master is the primary controlling system for a Jenkins instance. It has complete access to all Jenkins configuration and options and the full list of jobs. It is the default location for executing jobs if another system is not specified.

## Jenkins Slave

An agent is the same as what earlier versions of Jenkins referred to as a slave. Traditionally in Jenkins, this refers to any non master system. The idea is that these systems are managed by the master system and allocated as needed, or as specified, to handle processing the individual jobs. For example, we might allocate different agents to do different builds for different OS flavors, or we might allocate multiple agents to run in parallel for testing.

Jenkins slave, is a worker machine, or container, that connects to a Jenkins master and executes tasks when directed by the master. The agent section specifies where the entire pipeline or specific stage will execute in the Jenkins environment, depending on where the agent is placed. Agents are used to offload tasks from the Jenkins master; this makes possible parallel execution of jobs and scalability of the Jenkins infrastructure.

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/df555a0d-703c-4f48-b77c-52a3fa855d38)

## Use-Case

Create an agent by setting up a node on Jenkins

Create a new AWS EC2 Instance and connect it to master(Where Jenkins is installed)

The connection of master and agent requires SSH and the public-private key pair exchange.

Verify its status under “Nodes” section.

Create two AWS Ubuntu EC2 instances : Master and Agent.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/4b69b8a2-449f-48c0-ac43-82b9493ccaf2)


In Master instance, install Java and Jenkins.
```
##Java
sudo apt-get update
sudo apt-get install openjdk-11-jdk

##Jenkins

sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null## Add GPG key
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo apt-get update
sudo apt-get install jenkins

#Start Jenkins instance
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins
```

Verify Jenkins installation using http://<EC2_Public_IP>:8080.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b23e45d3-2bb6-4b14-8a5e-a73c582e2888)


In Agent instance, install Java and Docker.
```
##Java
sudo apt update
sudo apt install openjdk-11-jdk

##Docker
sudo apt-get update
sudo apt-get install docker.io
```
Lets connect the master and agent.

The connection of master and agent requires SSH and the public-private key pair exchange.

In master,
```
ssh-keygen
cd .ssh
ls
```

ssh-keygen produces a public-private key pair.
```
id_rsa --> private key
id_rsa.pub --> public key
```

Copy the public key[id_rsa.pub] (to give to the agent node)
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/c0781c27-44ee-422c-acc1-0576a26c2099)


Now, in agent,
```
cd .ssh
vim authorized_keys
```

Edit authorized keys and paste the public key from the master instance.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/7e8db43b-085f-426b-9ab5-62721a9a91b5)
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/5a76d59c-f989-4b75-bb66-1728d3bf04b0)


Now, lets set up a new node. Go to Manage Jenkins and click on Set up node.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b965b870-5057-4986-ac1d-5855e89d3b10)


Enter Node name and select Permanent agent.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/ad896c6f-5953-4305-b10c-cb6111f13889)


Enter all details. Here, when we use labels for the agent, your master server would trigger the builds for the agent server.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/5877fb35-ccef-4faa-b244-41cb45e1b9a0)


For launch method, select ‘Launch agents via SSH’. Add public IP of Agent instance at the Host field.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/f7c2d5f7-41aa-4a11-a04b-610f581c2b36)


For Credentials, add new credentials (if you do not already have them saved in Jenkins). Select ‘SSH username with private key’ . Fill all required details, and in the private key area add Private key from master instance (id_rsa).
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/42ef47bc-ec94-483f-9265-42f8484f87b3)


Save the configuration details. And you can verify that the Agent is up and running if set-up properly.

In case of any error, check the logs and try to resolve them accordingly using the Agent instance CLI.
