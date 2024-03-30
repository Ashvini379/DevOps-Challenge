# boto3 Module
Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for Python, which allows Python developers to write software that makes use of services like Amazon S3 and Amazon EC2.

## client

Client is a low level class object. For each client call, you need to explicitly specify the targeting resources, the designated service target name must be pass long. You will lose the abstraction ability.
```
import boto3
#create s3 bucket
s3 = boto3.resource('s3')
bucket_name="DemoBucket"
s3.create_bucket(Bucket=bucket_name)

#upload file to s3 bucket
filename="file1.txt"
with open(file_name, 'rb') as file:  
    s3.upload_fileobj(file, bucket_name, file_name)  
  
# Download a file from the bucket  
download_file_name = 'downloaded-file.txt'  
with open(download_file_name, 'wb') as file:  
    s3.download_fileobj(bucket_name, file_name, file)  

#list all buckets
response=s3.list_buckets()
for bucket in response["Buckets"]
    print(bucket["Name"])
```


## resource

This is the high-level service class recommended to be used. This allows you to tied particular AWS resources and passes it along, so you just use this abstraction.

```
import boto3
#create s3 bucket
s3 = boto3.resource('s3')
bucket_name="DemoBucket"
s3.create_bucket(Bucket=bucket_name)

#upload file to s3 bucket
filename="file1.txt"
with open(file_name, 'rb') as file:  
    s3.Bucket(bucket_name).put_object(Key=file_name,Body=file)  
  
# Download a file from the bucket  
download_file_name = 'downloaded-file.txt'  
with open(download_file_name, 'wb') as file:  
    s3.Bucket(bucket_name).download_file(file_name, file)  

#list all buckets
for bucket in s3.Bucket(bucket_name).objects.all()
    print(bucket)
```


## session

Session where to initiate the connectivity to AWS services. E.g. following is default session that uses the default credential profile~/.aws/credentials

```
import boto3
#create session
session=boto3.Session(aws_access_key_id="Your_access_key",
aws_secret_access_key="Your_Scret_key",resgion_name="us-east-1")
#create s3
s3=session.client("s3")
#List all buckets
response=s3.list_buckets()
#print all buckets
for bucket in response["Buckets"]:
    print(bucket["Name"])
```
