import json
from logging import Logger
from botocore.exceptions import ClientError
import boto3

class AutoScalingServers:
    def __init__(self):
        client = boto3.client('autoscaling')
        self.autoscaling_client=client

    def describe_group(self,group_name):
        try:
            response = self.autoscaling_client.describe_auto_scaling_groups(
                        AutoScalingGroupNames=[group_name])
        except ClientError as e:
            Logger.error("Couls not describe group")
        else:
            groups=response.get("AutoScalingGroups", [])
            return groups

ec2= boto3.resource("ec2")
ASG= AutoScalingServers()
groups =ASG.describe_group("My_ASG")
for asg in groups:
    print(asg["AutoScalingGroupName"])
    instances =[i for i in asg['Instances']]
    ec2_instances= ec2.instances.filter(Filters=[{}])
    for instance in ec2_instances:
        print(instance.id,instance.public_dns_name,instance.private_ip_address)
