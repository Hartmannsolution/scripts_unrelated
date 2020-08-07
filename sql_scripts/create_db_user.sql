CREATE User 'dev'@'localhost' IDENTIFIED BY 'ax2';
CREATE User 'dev'@'%' IDENTIFIED BY 'ax2';
GRANT ALL PRIVILEGES ON *.* TO 'dev'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'dev'@'%' WITH GRANT OPTION;
CREATE DATABASE startcode_test;
CREATE DATABASE startcode;
