#!/bin/bash

# Author: jafamo
# version 0.1
#
#Install server LAMP (Apache,MariaDB,PHP)
#Install with phpmyadmin 

#1.- Check and update repositories 
echo "Update repository and system."
sudo yum check-update
sudo yum update -y


#Install APACHE
echo "Install apache server"
sudo yum install -y httpd

sudo systemctl start httpd.service #start the service
sudo systemctl enable httpd.service #enable at startup
#sudo service httpd start


#By the default,Apache will listen on port 80, you need to exclude
#from firewall.
echo "Add  httpd service firewall."
sudo firewall-cmd --permanent --add-service httpd
sudo servicectl restart firewalld.service 

#sudo firewall-cmd --permanent --add-port=8080/tcp

#restart service
sudo systemctl restart firewall.service



#Install MySQL or MariaDB


echo "Install mariaDB server"
sudo yum install -y mariadb-server mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb.service
sudo mysql_secure_installation

echo "We need to set root password"
sudo mysql -u root -p


#Install PHP
echo "Install PHP"
sudo yum install -y php php-mysql
echo "Install additional modules: "
echo 
echo
echo "php-gd:		module for PHP applications for using the gd "
echo "				graphics library."
echo "php-pear:		PEAR is a framework and distribution system for"
echo "				reusable PHP components." 
echo "php-mbstring: mbstring provides multibyte specific string"
echo "				functions that help you deal with multibyte" 
echo "				encodings in PHP"
echo "				When you manipulate (trim, split, splice, etc.)"
echo "php-pgsql:	For PostgresSQl"
echo "php-enchant:	Human Language and Character Encoding Support."

sudo yum install -y php-gd php-pear php-enchant php-mbstring php-pgsql

sudo systemctl restart httpd.service

echo "Install phpmyadmin"
sudo yum install -y epel-release
sudo yum install -y phpmyadmin

echo "We need to edit /etc/httpd/conf.d/phpmyadmin.conf for permit "
echo "connections from your like this: "
echo "Allow from ::1  or    Allow from IP"

sudo systemctl restart httpd.service
echo "We finished installation."

