# to create new droplet on Digital Ocean
echo "Setting up a new droplet with mysql 8, tomcat9 and nginx"
echo "enter ip address of droplet:"

read ip_address
# scp nginx.sh root@$ip_address:/tmp/
# scp bootstrap.sh root@$ip_address:/tmp/
# scp testdata.sh root@$ip_address:/tmp/
# scp addvariables.sh root@$ip_address:/tmp/
# scp certbot.sh root@$ip_address:/tmp/

scp -r ./* root@$ip_address:/tmp/
# rsync -av --include='*.sh' --include='*.ini' --include='*.js' --exclude='*' ./ root@$ip_address:/tmp/

ssh root@$ip_address chmod +x /tmp/bootstrap_all.sh
ssh root@$ip_address /tmp/bootstrap_all.sh