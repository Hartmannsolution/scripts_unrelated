# certbot is using the configuration file: cli.ini to auto install with no interaction.
# RUN THIS ONE AS ROOT (in order to make /usr/bin/local/certbot-auto owned by root with only root given write access)
echo "######### ADD certbot PPA ##############"
apt-get update
apt-get install -y software-properties-common
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
apt-get update

echo "######### Install certbot ##############"
apt-get install -y certbot python-certbot-nginx 
wget https://dl.eff.org/certbot-auto
chmod +x certbot-auto
mv certbot-auto /usr/local/bin/
# chown root:root /usr/local/bin/certbot-auto
# chmod 755 /usr/local/bin/certbot-auto

cp /tmp/cli.ini /etc/letsencrypt/cli.ini
echo "######### Run certbot     ##############"
certbot-auto --config cli.ini --nginx --redirect
service nginx restart
echo "######### certbot done !! ##############"




