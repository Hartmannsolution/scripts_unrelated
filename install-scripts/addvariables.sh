echo "#########################################"
echo "write credentials in tomcat environment variables..."
echo "#########################################"
sudo cat <<- EOF_setenv >> /opt/tomcat/bin/setenv.sh
export DEPLOYED="DEV_ON_DIGITAL_OCEAN"
export USER="edu"
export PW="Hest12Manke"
export CONNECTION_STR="jdbc:mysql://localhost:3306/startcode"
EOF_setenv
