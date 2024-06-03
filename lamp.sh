#!/bin/bash

home_ip=localhost:80
log_path=~/lamp_job/run-status.log
sitefile_path=/var/www/
ProjectName=newproject
domainName=www.abc.com
clone_repo=https://github.com/thickthumb/figma2.git



echo "Welcome to the LAMP STACK INSTALLATION AND CONFIGURATION WIZARD"

sleep 3

echo "STARTING PROCESS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sleep 1
echo "++++++++++++++++++++++++++++++++++++++"

#create log file to preview process.when executed in background  mode.
if [ -d ~/lamp_job ]; then
    echo "Replacing existing log folder..."
    sudo rm -R ~/lamp_job
fi

mkdir ~/lamp_job
touch ~/lamp_job/run-status.log




sudo apt update

sudo apt-get upgrade -y


sudo apt install apache2 -y

systemctl status apache2  >> $log_path

curl $home_ip >> $log_path


echo "Apache2 has been sucessfully installed and configured for the Linux system. Enter preffered directory name for apache index folder "





#configuring Apache to use a new profile

sudo touch /etc/apache2/sites-available/$ProjectName.conf
sudo chown -R $USER:$USER /etc/apache2/sites-available/$ProjectName.conf

sudo echo  "<VirtualHost *:80>
  ServerName $ProjectName
  ServerAlias $domainName
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/$ProjectName
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/$ProjectName.conf




sudo a2ensite $ProjectName

sudo a2dissite 000-default


#clone repository to var file for display.

sudo git init

echo "Git initialized ! Now cloning repo...........>>>>>>>>>>>> "
sleep 2
echo ">>>>>>>>>>>>>>>>>>>>>"


if [ -d "/var/www/$ProjectName" ]; then
    echo "Replacing existing folder..."
    sudo rm -R "/var/www/$ProjectName"

fi

sudo mkdir /var/www/$ProjectName

sudo chown -R $USER:$USER /var/www/$ProjectName


cd /var/www/$ProjectName
sudo git clone $clone_repo .
ls /var/www/$ProjectName/

sudo systemctl restart apache2


echo "Webserver up and Running on set port"

