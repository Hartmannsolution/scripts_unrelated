#!/usr/bin/env bash
# Install latest version of node js and npm

export DEBIAN_FRONTEND=noninteractive
#sudo apt-get update
sudo apt-get install -y nodejs

sudo cat << EOF_NGINX > /etc/nginx/sites-enabled/default
upstream tomcat {
    server 127.0.0.1:8080 fail_timeout=0;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm;

        location / {
            # First attempt to serve request as file, then
            # as directory, then fall back to displaying a 404.
            #try_files $uri $uri/ =404;
            #The line above is commented out to let Tomcat handle 404 scenarios. Put it back if you don't use Tomcat

            include proxy_params;
            proxy_pass http://tomcat/;
        }

        location /nodeapps/ {
            proxy_pass http://127.0.0.1:3000/;
		    #proxy_http_version 1.1;
		    #proxy_set_header Upgrade $http_upgrade;
		    #proxy_set_header Connection 'upgrade';
		    #proxy_set_header Host $host;
		    #proxy_cache_bypass $http_upgrade;
        }

        location /static_content/ {
            root /var/www/html/static_content/;
        }
}
EOF_NGINX

mkdir -p /apps/node_apps/
file="/apps/node_apps/simplehttp.js"
echo "copy simplehttpserver.js to /apps/nodeapps/"

cp /tmp/*.js /apps/node_apps/

# node /apps/node_apps/simplehttpserver.js
sudo systemctl restart nginx

