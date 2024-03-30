This module provides a way of using operating system functionality.

# Basics of OS Module

```
#Import os module
import os
#Get Os name
os.name
#Get environment variables
os.environ
```

## Current Working Directory
```
import os
#Get current working directory
cwd = os.getcwd()
print("Current working directory",cwd)

#changing current working directory
def currentPath():
    print("Current directory is",os.getcwd())

currentPath()
os.chdir('../')
currentPath()
```

## Creating directory
```
import os
#Directory path
directoryname="Hashnode"
parentdirectory="/home/vboxuser/Documents"
path =os.path.join(parentdirectory,directoryname)
#Create directory
os.mkdir(path)

#Creating directoy with permissions
mode=0o666
directoryname="HashnodeP"
path=os.path.join(parentdirectory,directoryname)
os.mkdir(path,mode)

#Create director using mkdirs
#mkdirs creates any missing directory in path
directory="Ashwini"
parentdirectory="/home/vboxuser/HashnodeMissing"
path =os.path.join(parentdirectory,directory)
os.mkdirs(path)
```

## Listing out Files and Directories
```
import os
#List out files/directories
path = "/"
dirlist = os.listdir(path) 
print("Files and directories in '", path, "' :") 
print(dirlist)
```

## Deleting directories or Files
```
import os

#Deleting files
filename='file1.txt'
directory="/home/vboxuser/Documents"
path=os.path.join(directory,filename)
os.remove(path)

#Deleting directory
directory="Hashnode"
parent="/home/vboxuser/Documents"
path=os.path.join(parent,directory)
os.rmdir(path)
```

