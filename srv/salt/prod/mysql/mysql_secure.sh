#!/bin/bash

###########################################################################################################
# Migrate to RHEL/CentOS mysql-community-server-5.7 by nbnbnb.org
# Date: 20190426 
###########################################################################################################

## Reqire MySQL ROOT Password 
#mysql5.7 have unnormal password.
#grep 'temporary password' /var/log/mysqld.log |tail -1|awk '{print $NF}'

#MYSQL_ROOT_PASSWORD=""
MYSQL_ROOT_PASSWORD=`grep 'temporary password' /var/log/mysqld.log |tail -1|awk '{print $NF}'`

MYSQL_ROOT_NEW_PASSWORD=""
if [ -z "$MYSQL_ROOT_NEW_PASSWORD" -a "x$1" == "x" ]
then
    echo "Missing MySQL ROOT New Password"
    exit 2
else
    MYSQL_ROOT_NEW_PASSWORD=$1
fi

## Install expect
rpm -q --quiet expect || yum -y -q install expect

#when script run in saltstack
#have ID:mysqld_secure 's stdout!
#could add expect's debug:under
#exp_internal 1
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation

#expect \"Enter current password for root (enter for none):\"
#expect \"Enter current password for root:\"
expect \"Enter password for user root:\"
send \"$MYSQL_ROOT_PASSWORD\r\"

expect \"New password:\"
send \"$MYSQL_ROOT_NEW_PASSWORD\r\"

expect \"Re-enter new password:\"
send \"$MYSQL_ROOT_NEW_PASSWORD\r\"

#expect \"Change the root password?\"
expect \"Change the password for root ?\"
send \"Y\r\"

expect \"New password:\"
send \"$MYSQL_ROOT_NEW_PASSWORD\r\"

expect \"Re-enter new password:\"
send \"$MYSQL_ROOT_NEW_PASSWORD\r\"

expect \"Do you wish to continue with the password provided?\"
send \"Y\r\"

expect \"Remove anonymous users?\"
send \"y\r\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"

expect \"Reload privilege tables now?\"
send \"y\r\"

expect eof
")

#echo "$SECURE_MYSQL"

