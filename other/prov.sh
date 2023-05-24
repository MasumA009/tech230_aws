#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo bash -c 'cat <<EOF > /etc/nginx/sites-available/default'

sed -i 's+try_files $uri $uri/ =404;+proxy_pass http://localhost:3000;'



sudo systemctl restart nginx
sudo systemctl enable nginx

# Install Python properties 
#sudo apt-get install python-software-properties -y
# Install Node.js v14.x
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

sudo npm install pm2 -g

# Setting the environment variable. 
echo -e "\nexport DB_HOST=mongodb://192.168.10.150:27017/posts" >> ~/.bashrc
source .bashrc

git clone https://github.com/MasumA009/app.git

cd ~/repo/app
sudo npm install

# Install dependencies from package.json
node seeds/seed.js

# Start/restart the app (if already running)
pm2 start app.js --update-env
pm2 restart app.js --update-env