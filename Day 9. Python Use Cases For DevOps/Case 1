#Retrieve secrets from parameter store
import json
import boto3
ssm = boto3.client('ssm', 'us-east-1')
def get_parameters():
    response = ssm.get_parameters(
        Names=['My-Password'],WithDecryption=True
    )
    for parameter in response['Parameters']:
        return parameter['Value']
value=get_parameters()
print(value)


#Retrieve secrets from secret manager
import json
import boto3
def get_secret_value(name):
   session = boto3.session.Session()
   s3_client = session.client('secretsmanager')
   secret_id=name
   response =   s3_client.get_secret_value(SecretId=secret_id)
   return response  

get_secret_value("")
