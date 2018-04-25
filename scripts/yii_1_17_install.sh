#!/bin/bash
echo "This script installs the prerequisites for Yii 1.17 framework."

apt-get update
echo "Installing packages" 
apt-get -y install php5-mcrypt php5-gd php5-common php-soap php-pear php5-dev php-apc php5-sqlite
 
while true; do
    read -p "Do you wish download Yii 1.17 Framework?" yn
    case $yn in
        [Yy]* ) 
        cd tmp
        wget https://github.com/yiisoft/yii/releases/download/1.1.17/yii-1.1.17.467ff50.tar.gz
        tar -xvzf yii-1.1.17.467ff50.tar.gz
        cd yii-1.1.17.467ff50
        mv framework/ /var/www/html/
        cd /var/www/html/framework
        echo "Enter the name of your new Yii Website:"
        read my_app_name
        php yiic webapp /var/www/html/$my_app_name 
        echo "this is the end of this portion" ; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
 
 
#Ask user to define path of the new YII application
echo "Please enter the path of your new app: "
read yii_app_path   #Getting users input
echo "Changing permissions now"
chmod -vR 0777 $yii_app_path/assests
chmod -vR 0777 $yii_app_path/protected/runtime
#Change ownership of directories so the application can change values (e.g. GII)
chown -vR www-data $yii_app_path/assets
chown -vR www-data $yii_app_path/protected/runtime
chmod -vR 0744 $yii_app_path/assets
chmod -vR 0744 $yii_app_path/protected/runtime
