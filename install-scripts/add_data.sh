#!/bin/bash
DB_USER_NAME=$(awk 'NR==3 {print $1}' /tmp/passwords)
DB_PW=$(awk 'NR==3 {print $2}' /tmp/passwords)
sudo mysql -u $DB_USER_NAME -p$DB_PW < ./mysql_dumps/mysql_backup.sql

# sudo mysql -u dev -pax2 -e "CREATE DATABASE mydb;"
# sudo mysql -u dev -pax2 -e "CREATE DATABASE mydb_test;"

# sudo mysql -u dev -pax2 -e "CREATE TABLE mydb.PERSON (ADDRESS1 varchar(50), ADDRESS2 varchar(50), FIRSTNAME varchar(50),LASTNAME varchar(50), EMAIL varchar(50),LASTEDITED datetime,CREATED datetime );"
# sudo mysql -u dev -pax2 -e "INSERT INTO mydb.PERSON (ADDRESS1, ADDRESS2, FIRSTNAME,LASTNAME, EMAIL,LASTEDITED,CREATED ) VALUES ('Lyngyvej 23', 'Lyngby', 'Kurt','Wonnegut','kurt@b.dk','2019-08-07','2019-08-07'), ('Lyngyvej 23', 'Lyngby', 'Hanne','Wonnegut','hanne@b.dk','2019-08-07','2019-08-07'), ('Lyngyvej 123', 'Lyngby', 'Hans','Andersen','hans@b.dk','2019-08-07','2019-08-07');"


