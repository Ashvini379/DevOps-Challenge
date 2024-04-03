#!/bin/bash
updateServer() {
    server=$1
    
    echo "Enter ssh user:"
    read sshuser
    echo "Enter path of sshkey for user:$sshuser"
    read sshkey
    #ssh into server
    ssh -i "$sshkey" "$sshuser" 
      #Download the latest software packages from the repositories.
      sudo apt update && sudo apt upgrade -y 

      #Will install only the security updates
      sudo apt-get -s dist-upgrade  
      
      #Eliminates the need for unplanned maintenance
      sudo pro enable livepatch 

      #Cleanup unused packages
      sudo apt autoremove -y 
}

echo "Enter list of servers:"
readarray -t servers
for server in $servers
do
    updateServer $server
done
