# subprocess module
The Python subprocess module is for launching child processes. The parent-child

relationship of processes is where the sub in the subprocess name comes from. When you use subprocess, Python is the parent that creates a new child process.

```
import subprocess
#Run the command with args
subprocess.run(["ls","-l"])

#It is employed to execute a command in a separate process and wait for its completion
result =subprocess.call(["python3","--version"])
if result ==0:
    print("Command executed")
else:
    print("command failed")
```

## check_output

Run command with arguments and return its output.

If the return code was non-zero it raises a CalledProcessError. The CalledProcessErrorobject will have the return code in the returncode attribute and any output in the output attribute.
```
import subprocess
try: 
    ans = subprocess.check_output(["python3", "--version"], text=True) 
    print(ans) 
  
except subprocess.CalledProcessError as e: 
    print(f"Command failed with return code {e.returncode}")
```

## pipe

To start a new process, or in other words, a new subprocess in Python, you need to use the Popen function call. It is possible to pass two parameters in the function call.

stdin, stdout and stderr specify the executed program’s standard input, standard output and standard error file handles, respectively.
```
import subprocess
process = subprocess.Popen(['cat', 'example.py'], stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()
print(stdout)
```
