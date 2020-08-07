#!/usr/bin/env bash
# /etc/crontab is a file that contains scheduled routines on specific time slots.
# below command appends a cron job to backup all databases, zip the file and put it in the synched folder which on the host machine
# is where the Vagrantfile is.

#(crontab -l 2>/dev/null; echo '30 * * * * mysqldump -u dev -pax2 --all-databases | gzip > /vagrant/mysql_dumps/db_file.gz') | crontab -

crontab -l > mycron
echo "30 * * * * mysqldump -u dev -pax2 --all-databases > /vagrant/mysql_dumps/mysql_backup.sql" >> mycron
crontab mycron
rm mycron

# to manually edit cron jobs for current user: crontab -e
# to manually see cron jobs for current user: crontab -l
