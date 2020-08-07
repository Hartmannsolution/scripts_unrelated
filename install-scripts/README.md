# Install scripts
## Install identical servers on vagrant image and digital ocean droplet

This project serves as an install automation of 
- mysql 8.13-1
- tomcat 9.0.21
- nginx
- certificates for https with certbot and lets-encrypt
- testdata for mysql
- tomcat environment variables
- creation of non root user with sudo rights
- zsh shell 
- tree
- zip

### For vagrant
In Vagrantfile adjust how much of your computers memory (RAM) you will allow the virtual image to reserve. (Somewhere around line 100) default is 2 GB but it can run with 1GB if necessary.

Set port forwarding to localhost and forward mysql port `3306 to 3306` on the host (but only if you are note running a local instance of mysql server. If you have a local mysql server just put host port as: `3307`) and connect on this port when using on mysql workbench and from java code.

If VirtualBox and vagrant are installed locally then from within this project root run:
- `vagrant up`

### For newly created Digital Ocean droplet
If you want to use certificates (https) you must setup a domain on digital ocean.
In that domain on digital oceans web page you must add a A-record with your hostname and ip.

In the root of this project, create a new file called: 'passwords'.

#### File: passwords
 from this file all the user accounts are read so put 4 lines with 4 accounts using this format in the file:

tomcat-gui-username tomcat-gui-user-password
tomcat-script-username tomcat-script-user-password
mysql-username mysql-user-password
linux-username linux-account-password

#### File: cli.ini
Another file to setup is the cli.ini
change it to reflect your own informations

#### Folder: mysql_dumps
In here put a file: mysql_backup.sql with databases you want to set up initialy

#### Finally run the installation script
Now copy the ip address of your droplet to the clipboard.
From this folder run: `./do.sh`
When asked for the ip paste it in and enter
Once or twice in the installation process you will be asked to write yes or y


#### Run tests on your new installation
- log in to mysql with your user account from line 3 in passwords file
    - run `show databases;` to see that all databases are there according to your mysql_backup.sql file
- from linux cli run: `curl localhost` to see tomcats index page, thereby verifying installation of both tomcat and nginx.
- from browser goto domainname or if vagrant to localhost:8001 to see tomcat index page
- click manager app button and enter credentials from passwords file to see that you have access
- upload a demo.war file to the servers /opt/tomcat/webapps folder and see in browser that you can acces with domainname/demo
- go to /apps/nodeapps/ and run node simplehttpserver.js. verify that you can see this in browser from domainname/nodeapps/ anything running on port 3000 should show up here.
- go to /tmp/ and run ./utilities.sh afterwards run: `zsh` to see your neew shell (run: `chsh -s $(which zsh)` to permanently change shell to zsh)
- run `tree /` to see all content of the root folder (to verify installation of 'tree')

For vagrant specifically
- Check that a cronjob is setup to backup databases each hour. Run: `crontab -l` and look for a line like:
'30 * * * * mysqldump -u dev -pax2 --all-databases > /vagrant/mysql_dumps/mysql_backup.sql' (`crontab -e if you need to edit`)

