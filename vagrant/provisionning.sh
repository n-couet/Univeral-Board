#!/bin/bash

# PHP
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install php5 php5-curl php5-mysql php5-memcached libssh2-php php5-xdebug -y

# Git
sudo apt-get install git -y

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Node
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs -y
sudo npm install -g npm
sudo npm install -g bower
sudo npm install -g grunt-cli

# sass
sudo apt-get install ruby-full
sudo gem install sass

# MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'
sudo apt-get -y install mysql-server

# Accept MySql connections from outside
sudo sed -i 's/bind-address/#bind-address = 0.0.0.0 #/g' /etc/mysql/my.cnf
sudo echo "bind-address 0.0.0.0" >> /etc/mysql/my.cnf
mysql -u root -pvagrant -e "GRANT ALL PRIVILEGES  on *.* to root@'%' IDENTIFIED BY 'vagrant'; FLUSH PRIVILEGES;"
sudo service mysql restart

# Applying agentfowarding
echo -e "Host *\n    ForwardAgent yes" > ~/.ssh/config

# Prepare cache and logs folders
sudo mkdir -p /vagrant/app/cache && sudo chmod 777 -R /vagrant/app/cache
sudo mkdir -p /vagrant/app/logs && sudo chmod 777 -R /vagrant/app/logs

# Apache conf
VM_VHOST="
<VirtualHost *:80>
        ServerName localhost
        DocumentRoot /vagrant/web
        <Directory /vagrant/web>
                Options All
                AllowOverride All
                Require all granted
        </Directory>
</VirtualHost>
"

VM_CONF_FILE="/etc/apache2/sites-available/dan.conf"

[[ -f "$VM_CONF_FILE" ]] || touch "$VM_CONF_FILE"
[[ ! -f "$VM_CONF_FILE" ]] || echo "$VM_VHOST" > "$VM_CONF_FILE"

sudo a2enmod rewrite
sudo a2ensite dan.conf
sudo a2dissite 000-default.conf

sudo service apache2 reload
