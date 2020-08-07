#!/usr/bin/env bash

echo "Installing Dependencies..."
export DEBIAN_FRONTEND="noninteractive";


echo #######           Setup the firewall             ####
echo ####### Allow OPENSSH, port 80, 8080, 3306       ####

sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow 8080
sudo ufw allow mysql
sudo ufw allow 3000 # for node server

sudo ufw --force enable

echo # If you want to play arund with Tomcat without Nginx add this rule:
echo # sudo ufw allow 8080

echo "########################################################################################"
echo "############################            SETUP           ################################"
echo "########################################################################################"

echo "############################      Install Mysql server          ########################"
source $(dirname $0)/mysql.sh
echo "############################      Add data to mysql             ########################"
source $(dirname $0)/add_data.sh
echo "############################      Install TOMCAT web server     ########################"
source $(dirname $0)/tomcat.sh
echo "############################      Install nginx server              ####################"
source $(dirname $0)/nginx.sh
echo "############################      Install NodeJS server         ########################"
source $(dirname $0)/installnodejs.sh
echo "############################      Add cron jobs for db backup etc   ####################"
source $(dirname $0)/addcron.sh
# echo "############################      Install utility tools   ####################"
# source $(dirname $0)/utilities.sh


# echo "############################   Add system variables to tomcat   ########################"
# source $(dirname $0)/addvariables.sh
# echo "############################ Add https certificate with certbot ########################"
# source $(dirname $0)/certbot.sh


echo "Provisioning Complete!!"
