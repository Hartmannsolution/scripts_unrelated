#!/usr/bin/env bash
# add a new user with root privileges and ssh login
# echo "enter username to create non root user:"
# read username
# echo "enter password for user: $username"
# read password

# read username and password from .passwords file
USERNAME=$(awk 'NR==4 {print $1}' /tmp/passwords)
PW=$(awk 'NR==4 {print $2}' /tmp/passwords)

sudo adduser $USERNAME --gecos "Thomas Hartmann, room, phone_work, phone_home" --disabled-password
echo $USERNAME:$PW | chpasswd # the password is piped into chpasswd command to provide a password
sudo usermod -aG sudo $USERNAME

#echo "myuser:password" | sudo chpasswd
sudo cp -r /root/.ssh /home/$USERNAME/

chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys 
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

