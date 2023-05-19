#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo bash -c 'cat <<EOF > /etc/nginx/sites-available/default'

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    server_name _;
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
    #proxy_pass http://localhost:3000/;

    location /posts {
        proxy_pass http://localhost:3000/posts;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}" | sudo tee /etc/nginx/sites-available/default

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

cd ~/repo/app
sudo npm install

# Install dependencies from package.json

node seeds/seed.js

# Start/restart the app (if already running)
pm2 start app.js --update-env
pm2 restart app.js --update-env