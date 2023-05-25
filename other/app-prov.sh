#!/bin/bash
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt-get install nodejs -y
sudo npm install pm2 -g

cd /home/ubuntu/app
sudo npm install
sudo pm2 start app.js --update-env

sudo pm2 restart app.js --update-env

export DB_HOST = 172.31.46.126:27017/posts

