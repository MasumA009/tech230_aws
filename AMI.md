
AMI: Amazon machine image. A template that can be used many times over, easily. 


##  Launch instance
Refer to the pervios repo to see how to set up an instance. here:
```
https://github.com/MasumA009/tech230_aws/blob/main/AWS_intro.md
```

### Launch Nginx instance: User code

however instead of launching, navigate down to advance settings and type in the user code:
```
#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```
![Alt text](images/Screenshot%202023-05-17%20120055.png)

Now launch

After the instance works manually, we can automate it via an AMI.

## step 1: Create image
select the instance, 
navigate to actions,
images and template,
create image from instance,

![Alt text](images/Screenshot%202023-05-17%20111657.png)




## Step 2: launch instance from template
add name and desc
select the correct instance,

## confirmation
take the public IP and search!

![Alt text](images/Screenshot%202023-05-17%20112250.png)

![Alt text](images/Screenshot%202023-05-17%20112318.png)


# Launching mongoDB

After creating an instance with the required setting, navigate down to `User Code` like we did for nginx.
here input the code:
```
#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

sudo apt install mongodb -y

sudo systemctl start mongod
sudo systemctl enable mongod
```
After this folow steps 1 and 2 to create an image.

![Alt text](images/Screenshot%202023-05-17%20131307.png)


## Additional: check status

open a gitbash as admin, 
navigate to .ssh file and connect the instance via SSH 
the code can be found here: Located at the bottom
![Alt text](images/Screenshot%202023-05-17%20130348.png)

we can run the following to check if it is running properly:
```
sudo systemctl status mongodb
```
this can be done to check if anything is running. 



# Launching the Sparta App


## step 1: First navigate 

Navigate to where the `app` is located in your files. for me it is:
![Alt text](images/Screenshot%202023-05-17%20143043.png)

## step 2: Instance connection
launch an instance, refer to my previous repos to do it properly, 

Navigate to `Connect` on the instance page.

you will be presented with a public dns we can use to access our instance remotely:
![Alt text](images/Screenshot%202023-05-17%20143511.png)

This should be under the `SSH client` tab.

## Step 3: copy file 
Launch a Gitbash as admin and type in the following:
```
scp -i "~/.ssh/tech230.pem" -r app ubuntu@ec2-3-249-50-132.eu-west-1.compute.amazonaws.com:/home/ubuntu
```
This allows us to remotely connect our instance, we can control it via the bash terminal. 

`scp` stands for secure copy, it allows secure file transfer over SSH. 

`-i` specifies the identity for authentication. In this instnce we are using `tech230.pem`, which is located in the `.ssh` file.

`r` represents recursievly copy, ths allows the entire contents to be copied. 

`app` this specifies which file to copy. 

`ubuntu@ec2-3-249-50-132.eu-west-1.compute.amazonaws.com` This is the destination that it will copy to, remember we got this from step 2.

the program will then begin loading the contents of `app` into the instance. It took me a while todo so. 

## Step 4: Go into instance

run the code:
```
ssh -i "~/.ssh/tech230.pem" ubuntu@ec2-3-249-50-132.eu-west-1.compute.amazonaws.com
```
This will get you into the instance.

### Confirmation: 
check that the `app` file has been copied:
just use `ls`:
![Alt text](images/Screenshot%202023-05-17%20150309.png)


## step 5: Install and follow through
We have done these before 
Run:
```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```
allows us to get a specific version of nodejs. (Version 12).
```
sudo apt-get install nodejs - y
```
this installs nodejs.
```
sudo npm install pm2 -g
```
this installs pm2
results in: 
![Alt text](images/Screenshot%202023-05-17%20151043.png)

go into the file using `cd app`. and check it contains stuff using `ls`.
then run:
```
npm install
```
now start the application:
```
pm2 start app.js
```
resukts in the graphic:
![Alt text](images/Screenshot%202023-05-17%20151410.png)

confirmation:
![Alt text](images/Screenshot%202023-05-17%20151502.png)

## step 6: Change secuirty group.

Navigate to the instance. and down to security. 

we need to add a new security group. The app is running but access is restricted. 
Click on the security group and `edit inbound rules`. 
![Alt text](images/Screenshot%202023-05-17%20152231.png)

Add a rule that allows us to access, it should look like this:
![Alt text](images/Screenshot%202023-05-17%20152421.png)
Note: i have changed mine SSH so I am the only one that can access it. 

# Success!
![Alt text](images/Screenshot%202023-05-17%20155248.png)

I had to get rid of the https at the start. 

## Create AMI for the app
select the instance and go on create ami from 

 Like before, select the instance, navigate to actions -> image and templates -> create template from instance

 Fill in the details.
 
![Alt text](images/Screenshot%202023-05-17%20155928.png)
