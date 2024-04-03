# What is Shell?

The shell’s job, then, is to translate the user’s command lines into operating system instructions.

Components of Linux systems are

Hardware – It includes resources like CPU, RAM etc.

Kernel – It allocates hardware resources to software processes.

Shell - It is software that interprets command given by user.

### Types of Shell – bash, sh, ksh , tsh, fish ,zsh.
![image](https://github.com/Ashvini379/DevOps-Challenge/assets/44570192/afd142b6-b6a8-4fca-9cab-8d553454d4b4)


### How to check Shell type in Linux system?

echo $0

### Definition of Bash scripting

A bash script is a file containing a sequence of commands that are executed by the bash program line by line. It allows you to perform a series of actions, such as navigating to a specific directory, creating a folder, and launching a process using the command line.

By saving these commands in a script, you can repeat the same sequence of steps multiple times and execute them by running the script.

### What is Shebang?

This is first line script. It defines interpreter for script.

#!/bin/bash

### How to run a script?

To run a Script, it must have execute permission. In Linux every file has read, write and execute permissions, for script file we require execute permissions. We can check permissions using below command. Here x denotes execute permission. If file do not have execute permission, we can modify permissions using chmod command

ls –l
chmod +x [file]

There are 3 ways to run a script

./script.sh

/[scriptpath]/script.sh

bash script.sh

We can terminate script using Ctrl + C and stop using Ctrl + z.

