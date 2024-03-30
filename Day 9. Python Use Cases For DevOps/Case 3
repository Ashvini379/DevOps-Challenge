import boto3
region="us-east-1"
instances=["first instance id","second instance id"]
ec2= boto3.client('ec2',region_name=region)

ec2.stop_instances(Instances=instances)
print('stopped instances',str(instances))
