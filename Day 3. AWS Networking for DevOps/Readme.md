AWS networking allows creating fast, reliable and secure network. AWS offers many services like Amazon VPC, Amazon EC2, Amazon Route 53, Load balancers, Amazon gateway and more. Using these services we can make underlying infrastructure.

In this article we are going to discuss about AWS networking services.

# AWS Networking services

Regions – AWS data centers are located across globe in Europe, America and Asia. These center locations are called as regions.

Availability zones – These are isolated data centers in regions. We can deploy applications and databases across multiple availability zone. So that if one AZ goes down, user requests are routed to another AZ.

This picture illustrates regions and availability zones.

Three regions (N. California, Oregon, GovCloud)

Three data centers in N. California: us-west-1a, us-west-1b, us-west-1c
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/6e686de7-df6f-49e5-bdb5-46ce9a919db3)

VPN (Virtual Private Network) - A VPN or Virtual Private Network creates a private network connection between devices through the internet. VPNs are used to safely and anonymously transmit data over public networks. They work by masking user IP addresses and encrypting data so it's unreadable by anyone not authorized to receive it.

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/2f3b90a4-75ac-4d60-8c50-45c80906cacd)
VPC (Virtual Private Cloud) – It provides logical isolation to cloud resources. The VPC has one subnet in each of the Availability Zones in the Region, EC2 instances in each subnet, and an internet gateway to allow communication between the resources in your VPC and the internet. When you create your AWS account, we create a default VPC in each Region. A default VPC is a VPC that is already configured and ready for you to use. For example, there is a default subnet for each Availability Zone in each default VPC, an internet gateway attached to the VPC, and there's a route in the main route table that sends all traffic (0.0.0.0/0) to the internet gateway. Alternatively, you can create your own VPC and configure it to meet your needs.

# Components of a VPC

A Virtual Private Cloud: A logically isolated virtual network in the AWS cloud. You define a VPC’s IP address space from ranges you select.

Subnet: A segment of a VPC’s IP address range where you can place groups of isolated resources (maps to an AZ, 1:1).

Internet Gateway: The Amazon VPC side of a connection to the public Internet.

NAT Gateway: A highly available, managed Network Address Translation (NAT) service for your resources in a private subnet to access the Internet.

Route tables – Here we will define each route to reach destination. We associate it with subnet. And there is route in the main route table that sends all traffic (0.0.0.0/0) to the internet gateway.

Types of Route:

Main - This is default route table. This is created automatically when VPC is created.

Secondary - User created custom route table. Using this private subnet can communicate with outside world.

Load Balancers – Load balancing automatically distributes traffic across multiple targets such as EC2 instances, in multiple availability zones.           This increases availability of application.

Security Groups – It is stateful virtual firewall that controls inbound and outbound network traffic to AWS resources and AWS EC2 instances and are launched with security groups.

Elastic network interfaces – It is a virtual network interface that you can attach to an instance in a VPC. Elastic network interfaces are only available within a VPC and are associated with a subnet upon creation.

VPC peering - A VPC peering connection is a networking connection between two VPCs that enables you to route traffic between them using private IPv4 addresses or IPv6 addresses. Instances in either VPC can communicate with each other as if they are within the same network. You can create a VPC peering connection between your own VPCs, or with a VPC in another AWS account. The VPCs can be in different Regions (also known as an inter-Region VPC peering connection).
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/74f9d70b-86b1-49ab-8e65-f0a10a910b20)
## AWS Networking Hands on

### Hands on VPN configuration
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/80dc3ca1-992e-4d4d-b878-44219ce201cc)

Create Ec2 instance, install OpenVPN and configure it - Launch Ec2 instance, browse for more AMIs and select OpenVPN access server.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/c38f995e-8aae-43c3-a82a-c2556d6ab029)

Select instance type as t2-micro, create new key pair and click on launch instance. Select all options for VPN configuration as default. After successful configuration EC2 console will return Admin UI and Client UI URL. Copy that URL and Login using username and password.

Admin UI : https://13.201.102.9:943/admin

Client UI : https://13.201.102.9:943/

c. Configure OpenVPN and setup route (all Ec2 instance are accessible via VPN) –

d. Login with username and password to OpenVPN console using admin UI (https://13.201.102.9:943/admin).

e. Go to VPN Settings and change VPN settings.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b19df75d-2ef4-4781-a68e-fee23ab3f1d0)

f. Go to User management. Setup user in OpenVPN server and enable auto login. Download user profile.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/7119e062-fddb-4c78-a718-7eacb92609cf)

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/6fa88daa-c1fe-46a9-be22-16d6880a5826)

g. Login to Client UI (https://13.201.102.9:943/) and download OpenVPN connect. Install and Go to OpenVPN connect. Import profile which we created and downloaded. Click on Connect
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/43f53c8f-bc3b-4025-af91-eab93a1506dc)

h. Create Linux EC2 instance and Access Ec2 instance via private address. Go to Linux Server Security groups and modify inbound rule for OpenVPN server private IP address.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b3b2fa21-7b9f-4a8c-b864-3ddb0f5f52c5)

i. Now we cannot connect Linux Server EC2 instance using public IP, instead we connect it using private ip
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/3b7b6ff8-7241-4e7f-a346-4e3bebf87c7c)

### Hands on VPC

Requirement – We want to login into public ec2 instance and from public ec2 instance we will login into private ec2 instance and ping google.com. So that we can communicate with private subnet from outside world.

Image below shows what we want to achieve.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/a93573f2-94b0-4c67-97fd-4c901bae8c53)

a. Create VPC
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/175824d8-c9c0-4c36-94c4-92fbaebf77c3)

This will create a public route table
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/87ccb776-693c-48da-b075-3f4a581b2afa)

b. Create public subnet – Create public and private subnet for custom VPC.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/5c9b26b7-670e-48c3-acc0-f3ca7e6ebbcc)

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/181d19ba-e298-4c57-ab28-bb1ca98b3abe)

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/0023a00c-6cb9-43b7-a624-be63e84fc5f8)

c. Create Internet Gateway – Create internet gateway and attach it to VPC.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/ba216540-9ce2-414f-81c0-7285b113233e)

d. Create Secondary Route Tables as pvt-rt and make it private route tables associate private subnet
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/f265c33a-d79b-4851-8fe7-31d0c4816e21)

e. Rename main Route table as pub-rt and associate it with public subnet.

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/a1b448ab-e68a-4afa-8376-4b866c6f36bc)

f. Associate private route table with private subnet.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/9b71c2bc-d5bb-495f-8554-938bb2bbba6e)

g. Launch public EC2 instance – Create pub-ec2 with below network settings.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/dcd73882-7eda-4ac5-ab6a-9997c12aae3f)

h. Launch Private EC2 instance – Create pvt-ec2 with below network settings.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/f1b6c9ce-711c-44df-86e6-751cc08c0cff)

i. Edit Route table to communicate from outside VPC.

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/0e2a1b32-1b2a-4cf8-b32b-990df47b0541)

j. Create NAT Gateway – Create NAT gateway in public subnet with allocating elastic IP.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/abe63614-ca0c-4802-9804-9a1b792867e9)

k. Create route for private subnet –
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/664cd263-d93e-4524-83ef-faa5af993008)

l. Login public EC2 instance(from public ec2 instance login to private ec2 instance and ping google.com)
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/8949ad53-2dd1-412e-853b-9b28beac3fad)

### Hands on VPC peering

a. Create another VPC in different region(North Virginia).
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/e4933afe-3fa3-41c6-a7a2-887f9707b1fe)

b. Create subnet
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/b22cc327-13e4-4d98-83f1-ce63dfa320f6)

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/8653b1ee-a857-4c42-be58-3b163dc28254)

c. Create route table and associate it with subnet
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/2d477a7a-08de-4e97-b962-4fc416886ecc)

d. Create private EC2 instance
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/e9eb7450-a054-4070-9888-f2e9fced4390)

e. Create VPC peering connection for VPC in Mumbai region
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/06ceca78-79a7-4ed3-b927-005fb6d11b94)

f. Accept peering request in N.Virginia region.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/5a1ff866-1fdd-4633-acf9-6e8f2ca6db2e)

g. Add route for peering connection in route table in Mumbai and N.Virginia region

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/f42ef6b4-97bd-421d-9262-6390160a771f)

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/7aad2528-f03e-4c67-9eea-62fc89e865d1)

h. Create route for peering connection in route table in N.Virginia region
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/6b64cb74-08ad-4cee-9081-88bf42f0b683)

i. Connect N.Virginia region EC2 instance from Mumbai region EC2 instance. So that we can connect from 10 network to 20 network.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/1f8f6f3a-6923-4434-989a-99200e8c5b29)

![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/ad05ed00-6ab4-456a-a727-526031d0f13c)


