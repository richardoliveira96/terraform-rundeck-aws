#!/bin/bash

#rundeck install

curl https://raw.githubusercontent.com/rundeck/packaging/main/scripts/deb-setup.sh 2> /dev/null | sudo bash -s rundeck

curl -L https://packages.rundeck.com/pagerduty/rundeck/gpgkey | sudo apt-key add -

vi /etc/apt/sources.list.d/rundeck.list

echo "deb https://packages.rundeck.com/pagerduty/rundeck/any/ any main" > /etc/apt/sources.list.d/rundeck.list
echo "deb-src https://packages.rundeck.com/pagerduty/rundeck/any/ any main" >> /etc/apt/sources.list.d/rundeck.list

sudo apt-get update -y

sudo apt-get install rundeck -y

sudo systemctl daemon-reload

sudo service rundeckd start

#db configurations

sudo apt install mysql-server -y

mysql -u root -p


create database rundeck;

create user 'rundeck'@'localhost' identified by 'rundeck';

grant ALL on rundeck.* to 'rundeck'@'localhost';

exit

# application rundeck configuration

cd /etc/rundeck/

sed -i '/^dataSource.url/d' rundeck-config.properties


echo "dataSource.driverClassName = org.mariadb.jdbc.Driver" >> rundeck-config.properties
echo "dataSource.url = jdbc:mysql://localhost/rundeck?autoReconnect=true&useSSL=false" >> rundeck-config.properties
echo "dataSource.username = rundeck" >> rundeck-config.properties
echo "dataSource.password = rundeck" >> rundeck-config.properties


public_ip=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)


sed -i "s|grails.serverURL=http://localhost:4440|grails.serverURL=http://$public_ip:4440|g" rundeck-config.properties


service rundeckd restart http://52.55.235.44:4440/