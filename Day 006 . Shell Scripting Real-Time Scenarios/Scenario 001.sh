#You can create a sample zombie process using below command
#(A=$BASHPID && ( kill -STOP $A ))
killzombie() {

#List PID of all zombie process
for childid in $(ps aux | awk '$8 ~ /^[Zz]/' | awk '{print $2}')
do
  #get parent procesid from child process 
  parentid=$(ps -o ppid= -p $childid | awk '{print $1}')

  #Send Kill SIGCHLD signal to parent process
  echo "Sending signal to parent process to kill all zombie process"
  kill -s SIGCHLD $parentid  
    #Identify process is still not killed
    if [[ $(ps -p $childid | awk 'NR > 1 {print $1}') -ge 0 ]]
    then
          #kill parent process
          echo "Kill parent process"
          kill -9 $parentid 
          logger "Kill successfull $parentid"  
    fi
 
 done
}

#call function to kill processes
killzombie
