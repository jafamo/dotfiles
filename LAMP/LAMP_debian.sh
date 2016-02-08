#!/usr/bin/env bash

# Install LAMP(Linux,Apache,MySQL and PHP) in debian 8
#
#

PASSWORD='12345'
PROJECTFOLDER='myproject'

#create folder project
sudo mkdir "/var/www/html/${PROJECTFOLDER}"

#update server
sudo apt-get update
sudo apt-get -y upgrade

#Install apache and PHP 5
sudo apt-get install -y apache2
sudo apt-get install -y php5

#install MySQL5 and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get install -y mysql-server
sudo apt-get install php5-mysql

#install phpmyadmin and give password to installer
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -y install phpmyadmin

#Setup host file

VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/var/www/html/${PROJECTFOLDER}"
    <Directory "/var/www/html/${PROJECTFOLDER}">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

# enable mod_rewrite
sudo a2enmod rewrite

# restart apache
service apache2 restart

# install git
sudo apt-get -y install git-core

echo "We need modify /etc/my.conf and permit IP "
echo "bind-address=YOUR-SERVER-IP"
echo "example: bind-address=0.0.0.0"
echo
echo "PHPmyAdmin config: "
echo "sudo nano /etc/apache2/conf.d/phpmyadmin.conf"
echo "Add: 'Allow from 0.0.0.0' or your IP"

