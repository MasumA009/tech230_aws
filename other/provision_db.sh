#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

#sudo apt-get install nginx -y
#sudo systemctl enable nginx -y

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

# echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list


#install pacakage
sudo apt-get update -y
sudo apt-get upgrade -y

#install
sudo apt-get install -y mongodb

# changes bindip to 0.0.0.0
sudo sed -i "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/" /etc/mongod.conf

# start and enable mongo
#sudo systemctl start mongod
#sudo systemctl enable mongod

sudo systemctl restart mongod
sudo systemctl enable mongod

