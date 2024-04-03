from cryptography import x509
import socket
import ssl
import sys
import json

hostname = "google.com"
port="443"
context = ssl.create_default_context()

with socket.create_connection((hostname, port)) as sock:
    with context.wrap_socket(sock, server_hostname=hostname) as ssock:
        print(ssock.version())
        data =ssock.getpeercert(True)      
        # print(ssock.getpeercert())

pem_data = ssl.DER_cert_to_PEM_cert(data)
cert_data = x509.load_pem_x509_certificate(str.encode(pem_data))
print (cert_data.not_valid_after_utc)
