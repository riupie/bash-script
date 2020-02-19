#!/bin/bash
###################################################
# Used for create user with public key injected. ##
###################################################

# List of user and public key on user:key FORMAT.

file=user-key.txt

IFS=':'

while read username key
do
	sudo useradd -m -s /bin/bash $username;
        sudo mkdir /home/$username/.ssh;
        sudo echo "$key" >> /home/$username/.ssh/authorized_keys;
        sudo chown -R $username:$username /home/$username;
        sudo find /home/$username -type d -exec chmod 700 {} \;
        sudo find /home/$username -type f -exec chmod 600 {} \;
done < "$file"
