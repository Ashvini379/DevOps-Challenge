# sys Module
This module provides access to some variables used or maintained by the interpreter and to functions that interact strongly with the interpreter.
```
import sys
#Version of python interpreter
sys.version
#Get input directly from the command line using stdin. 
#save this to file Hash.py and run it using python3 Hash.py command
print("Enter message here:")
for line in sys.stdin:
    line= line.rstrip():
    print(f"Input :{line}")
#Display output directly to the screen console using stdout
sys.stdout.write("Hashnode")
#Its error messages go to stderr
print('This is an error message', file=sys.stderr)
#Write stderr to file
sys.stderr = open('err.txt', 'w')
print('This is an error message', file=sys.stderr)
#List of command line arguments passed to script.
#Save this code as math.py and run it using python3 math.py
n = len(sys.argv)
print("Total arguments passed:", n)
print("\nName of Python script:", sys.argv[0])
print("\nArguments passed:", end = " ")
for i in range(1, n):
    print(sys.argv[i], end = " ")
Sum = 0
for i in range(1, n):
    Sum += int(sys.argv[i])
     
print("\n\nResult:", Sum)

#exit from program using sys.exit
salary=10000
if salary <=10000:
    sys.exit("Salary is less than 10000")

```
