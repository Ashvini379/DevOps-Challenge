# requests Module

The requests module is used to send Http request.

```
import requests
#get() method sends a GET request to a web server and 
#it returns a response object.It is used to get resource data
response = requests.get("https://hashnode.com/")
print(f"{response.status_code}: {response.reason}")
```

```
import requests
#head() method sends a HEAD request to a web server and 
#it returns a response object.It is used to get header information
response = requests.head("https://hashnode.com")
print(response.status_code)
print(response.headers["Content-Type"])
print(response.text)
```

```
import requests
#post() method sends a POST request to a web server 
#and it returns a response object.It is used to create or update resource
data = {
  "blog": "Day 9.Python Projects"
}
response = requests.post("https://hashnode.com", data=data)
print(f"{response.status_code}: {response.reason}")
```

```
import requests
#put() method sends a PUT request to a web server 
#and it returns a response object.It is used to update resource
json = {
  "blog": "Day 9.Python Projects"
}
response = requests.put("https://httpbin.org/put", json=json)
print(response.json()["json"])
```

```
import requests
#delete() method sends a DELETE request to a web server 
#and it returns a response object.It is used to delete resource
response = requests.put("https://www.google.com")
print(f"{response.status_code}: {response.reason}")

```
