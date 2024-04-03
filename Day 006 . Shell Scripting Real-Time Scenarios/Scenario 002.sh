#!/bin/bash
#Create new user account
createUser() {

        userName=$1
        if id $userName
        then
                echo "User $userName already exists"
                exit 1
        fi

        #Create user
        useradd -m $userName

        #Set password from user
        echo "Setting password for user $userName"
        passwd $userName

        #Add users to sudoers
        usermod -aG sudo $userName
        echo "User $userName is added to sudoers"

        #enable ssh access
        enableSSHAccess $userName
}

enableSSHAccess() {
        userName=$1

        sshDir="/home/$userName/.ssh/"
        authkeyFile="$sshDir/authorized_keys"

        #Create ssh directory if not exist
        if [ ! -d $sshDir ];
        then
                mkdir $sshDir #create ssh directory
                chmod 770 $sshDir #read permission for directory
        fi

        #read authorised keys from user
        echo "Enter public key for $userName:"
        read -r publicKey

        #write public key to authorised keys
        echo $publicKey >> $authkeyFile
        chmod 070 $authkeyFile

        #set ownership for ssh directory
        chown -R $userName $sshDir
        echo "SSH access enabled for $userName"
}

# Prompt for the username
echo "Enter the username for the new user:"
read -r userName

# Call create user function
createUser $userName
