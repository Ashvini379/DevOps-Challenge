# Basics of Python

## Python Environment Setup

We need Python 3.7 or later installed to access a shell. Python installers can be downloaded from website https://www.python.org/downloads/ or you can install using apt, rpm , chocolatey etc.

We can install Python 3.7 on Linux as below.

``` apt-get update
apt-get install python3 python3-pip software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt-get install python3.7

#Check python version 
python3 --version
```

## Programming in Python

### Variable

Variable is name that points to some value.

``` #We can declare variable
#an integer variable
age=35
print(age)

#floating point variable
salary=1500.23

#string variable
name="John"
print(name)
```

A Python variable name must start with a letter or the underscore character.

A Python variable name cannot start with a number.

A Python variable name can only contain alpha-numeric characters and underscores (A-z, 0-9, and _ ).

Variable in Python names are case-sensitive (name, Name, and NAME are three different variables).

Data types

Numeric

Numeric data type is a numeric value.

int - Signed integers of non-limited length

float - floating decimal points

complex - complex numbers
```
#Numeric types
#an integer type
num=35
print(age)

#floating point type
num1=3.5
print(num1)

#complex type
num3=1+3a
print(num3)
```

### string

String is sequence of characters represented either by single quote or double quote.
```
#string type
name="Learn python for DevOps"
print(name)
```

### Sequence types

list - It is ordered collection of similar or different types of items separated by comma and enclosed in [] brackets.

tuple - tuples are ordered items same as list but tuples are immutable , we cannot modify once declared. We use () to store tuple items.
```
#create list
subjects=["Maths","Science","History"]
#access list items
print(subjects[0])
print(subjects[1])

#create tuple
cities=("Pune","Delhi","Bangalore")
#access tuple items
print(cities[0])
print(cities[1])
```

### Dictionary

Its an ordered collection of key-value pairs. Keys are unique identifiers for each value.
```
#create dictionary
capitalcities={'Nepal':'kathmandu' ,'Russia':'Moscow' ,'Germany':'Berlin' }
#access dict items
print(capitalcities['Nepal'])
```

### Boolean

It is either True or False
```
print(type(True))
print(type(False))

```

### Set

It is unordered collection of unique items separated by comma , and enclosed in curly {} brackets.

```
#Create set
producid={10,20,30,40,50,60}
#display all items
print(productid)
#access set items
for p in productid
    print(p ,end=" ")

```

### Conditionals

These are used for decision making and code branching. We can group statements as block of code which we want to run together.

if-else

A block after if statement runs if if statement evaluates to true otherwise it runs elif or else statements.
```
i=35
if i==45:
    print(i is '45')
elif i==35:
    print(i is '35')
else
    print('I am not in if')

```


### match-case

Match statement is initialized with match and a parameter. Then it step down into cases.
```
city='Pune'
match city:
    case 'Pune':
        print('current city is Pune')
    case 'Delhi':
        print('current city is Delhi')
```

### Loops

for loop

for loops allow you to repeat a block of statements (a code block) once for each member of a sequence (ordered group of items). As you iterate through the sequence, the current item can be accessed by the code block
```
for i in range(10):
    x = i*2
    print(x)

```


while loop

while loops repeat a block as long as a condition evaluates to True.

```
count=0
while count < 3:
    print('count is {count}')
    count += 1

```
## Loop control statements

### break

Break statement is used to break loop.
```
s='hashnodeblog'
for ch i  s:
    print(ch)
    if ch == 'e':
        break
print('out of for loop')
```

### continue

It forces to execute next interation of loop.
```
for i in range(1,11):
    if i == 6:
        continue
    else
        print(i, end=" ")
```
###Functions

function is a mechanism for encapsulating a block of code. You can repeat the behavior of this block in multiple spots without having to duplicate the code. The first line of a function definition starts with the keyword def, followed by the function name, function parameters enclosed in parentheses, and then :. The rest of the function is a code block and is indented.
```
def positioned(first,second):
    print('first {first}')
    print('second {second}')

positioned(1,2)
```
### Local and global variable

Local variables in Python are those which are initialized inside a function and belong only to that particular function. It cannot be accessed anywhere outside the function
```
def f():
	# local variable
	s = "I love Hashnode"
	print(s)

# Driver code
f()
```

### Global variable

These are those which are defined outside any function and which are accessible throughout the program, i.e., inside and outside of every function.
```
# This function uses global variable
def f():
    print('Inside Function', s)
 
# Global scope
s = 'I love Hashnode'
f()
print('Outside Function', s)
```
### Import modules

We can import the definitions inside a module to another module or the interactive interpreter in Python.

We use the import keyword to do this. To import our previously defined module math, we type the following in the Python prompt.
```
#Import module
import math
#we can import specific names from module
from math import pi
print(pi)

#import all names
from math import *
```

### Modules for DevOps

os : OS module provides a portable way of using operating system dependent functionality. In addition, it allows us to interact with the underlying operating system in different ways to automate tasks

subprocess : to run the external program and read their output in Python code.

sys : to manipulate different parts of the Python runtime environment or want to work with a command-line argument passed to your python script.

re : used for pattern matching.

platform : Platform module is used to access underlying platform data such as operating system, interpreter version information, and hardware.

GetPass/GetUser : to prompt the user for the password without echoing it

paramiko : to execute a command to the remote system, download or upload the file without login.

boto3 : Boto3 is the Amazon Web Services (AWS) SDK for Python. It enables Python developers to create, configure, and manage AWS services, such as EC2 and S3.

pygithub : for frequent tasks like creating, deleting, or listing GitHub repo.

request, beautifulsoup4 and smtplib :

Request: Request is used to make a request to an HTTP endpoint.

BeautifulSoup4: is used to parse HTML or XML document.

Smtplib: Is used for sending and receiving email using Simple Mail Transfer Protocol(SMTP)

json: The json library is invaluable for working with JSON data, which is commonly used for configuration and data exchange in DevOps.

yaml: The yaml library allows you to work with YAML data, another popular format in the DevOps world for configuration files.

### Regular expressions

Regular expressions use a string of characters to define search patterns. Python has a module named re to work with RegEx.

Read more details using below link

https://docs.python.org/3/howto/regex.html
```
import re

pattern = '^a...s$'
test_string = 'abyss'
result = re.match(pattern, test_string)

if result:
  print("Search successful.")
else:
  print("Search unsuccessful.")
```
### Exception handling

Exceptions are a type of error causing your program to crash if not handled (caught). Catching them with a try-except block allows the program to continue. These blocks are created by indenting the block in which the exception might be raised, putting a try statement before it and an except statement after it, followed by a code block that should run when the error occurs.
```
thinkers = ['Plato', 'PlayDo', 'Gumby']
 while True:
     try:
         thinker = thinkers.pop()
         print(thinker)
     except IndexError as e:
         print("We tried to pop too many thinkers")
         print(e)
     finally :
        print("This is always executed")
 break
```
