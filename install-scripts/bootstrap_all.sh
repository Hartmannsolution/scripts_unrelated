#!/usr/bin/env bash

echo "Installing Dependencies..."
export DEBIAN_FRONTEND="noninteractive";


echo #######           Setup the firewall             ####

sudo ufw allow OpenSSH # port 443 to make sure we can ssh into the server after installation
sudo ufw allow http # nginx is listening here
sudo ufw allow https # will be used by nginx and certbot/letsencrypt
sudo ufw allow 8080 # to use tomcat directly without going through nginx
sudo ufw allow mysql # allow port 3306 for use by mysql server.

sudo ufw --force enable


echo "########################################################################################"
echo "############################ Install and setup          ################################"
echo "########################################################################################"

echo "############################      Install Mysql server      ########################"
source $(dirname $0)/mysql.sh
echo "############################      Install TOMCAT web server     ########################"
source $(dirname $0)/tomcat.sh
echo "############################      Add test data to mysql        ########################"
source $(dirname $0)/add_data.sh
echo "############################   Add system variables to tomcat   ########################"
source $(dirname $0)/addvariables.sh
echo "############################ Install Nginx and configure reverse proxy #################"
source $(dirname $0)/nginx.sh
echo "############################ Add https certificate with certbot ########################"
source $(dirname $0)/certbot.sh
echo "############################ Install Node JS                    ########################"
source $(dirname $0)/installnodejs.sh
echo "############################      Add a non-root user           ########################"
source $(dirname $0)/addrootuser.sh
# echo "##################    Install and configure utility programs    ########################"
# source $(dirname $0)/utilities.sh
echo "##################    Install docker   ########################"
source $(dirname $0)/installdocker.sh
echo "##################    Install Mongodb on port: 27017   ########################"
source $(dirname $0)/mongodb.sh



echo "Provisioning Complete!!"
