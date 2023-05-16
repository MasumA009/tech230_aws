# AWS intro

## Creating a AWS EC2 instance

EC2 stands for Elastic cloud compute

## Step 1: Login
After recieving your details, head to: 
```
https://sparta-devops.signin.aws.amazon.com/console
```
and login. 


## Step 2: Check region
we will use this particular region: 
```
EU-WEST-1 IRELAND
```

## Step 3: Key mangement
After recieving your key, navigate to the .ssh folder, it should be located in the Users area.
ensure that you have hidden files selected and find your .ssh file: 
![Alt text](images/Screenshot%202023-05-16%20164330.png)
Copy your key into this file. In my example the key is named:
```
tech230.pem
```

## Step 4: Create Instance
Go to the search bar located at:
![Alt text](images/Screenshot%202023-05-16%20163936.png)
and search for `EC2`

click ec2 on the search bar.

Navigate down to the yellow "Launch instance", and select launch instance:
![Alt text](images/Screenshot%202023-05-16%20150706.png)

name it appropiately:
![Alt text](images/Screenshot%202023-05-16%20165011.png)

## Step 5: Instance settings

Scroll down to the Operating System option, we will choose the 
`Ubuntu` OS:
Then select (from the dropdown menu):
```
Ubuntu Server 22.04 LTS (HVM), SSD Volume Type (Free Tier)
```
It should look like this:
![Alt text](images/Screenshot%202023-05-16%20165358.png)


Keep going down to `Instance Type` this is the hardware of the instance. 
select: 
```
t2.micro
```
As shown:
![Alt text](images/Screenshot%202023-05-16%20165511.png)


Navigate to `Key pair`, and select 
```
tech230
```
As shown:
![Alt text](images/Screenshot%202023-05-16%20165654.png)

Navigate to `Netwrok Settings`. This is AWS'S bilt-in firewall. 

Select edit on the top right, 
change the name of the secuirty group, ive chosen 
```
tech230_masum_second_sg
```
This should look like:
![Alt text](images/Screenshot%202023-05-16%20170053.png)

scroll down to the `Inbound security groups rules`,
Now we will create the rules required to access our instance.
Have your settings the same as mine: 
![Alt text](images/Screenshot%202023-05-16%20170538.png)

Reflect upon the summary and launch the instance!
![Alt text](images/Screenshot%202023-05-16%20170642.png)

after processing it should result in:
![Alt text](images/Screenshot%202023-05-16%20170714.png)

## Step 6: Check its running 

we can navigate to the instance page and filter it, we can search and find the instance:
![Alt text](images/Screenshot%202023-05-16%20170910.png)

## step 7: Navigate to the EC2 instance
on the above screenshot, we can select the instance. it will bring you to this page:
![Alt text](images/Screenshot%202023-05-16%20171121.png)

select `Connect`, and pick `SSH client`.

## Step 8: Gitbash
open Gitbash as admin, and navigate to the .ssh file. and run the code:
```
chmod 400 tech230.pem
```
Run it:
![Alt text](images/Screenshot%202023-05-16%20171506.png)

## Step 9:  Run
Grab this command:
![Alt text](images/Screenshot%202023-05-16%20171800.png)
```
ssh -i "tech230.pem" ubuntu@ec2-63-35-220-232.eu-west-1.compute.amazonaws.com
```
and paste it into Gitbash. And enter yes when it asks for a finger print.

![Alt text](images/Screenshot%202023-05-16%20172056.png)

we are now logged into the EC2 instance on the cloud. 

![Alt text](images/Screenshot%202023-05-16%20172205.png)

## Step 10: Update and upgrade
Run these commands to upgrade and update:
```
sudo apt update -y
```
```
sudo apt upgrade -y
```

## Step 11: Install nginx7
run:
```
sudo apt install nginx -y
```
```
sudo systemctl start nginx
```
```
sudo systemctl enable nginx
```

## Step 12: Get Ip
Navigate to the instance and copy the public IP into the search bar.
This should produce the webpage.

## step 13: Terminate instance. 
Navigate to the Instance state dropdwon menu and select terminate.:
![Alt text](images/Screenshot%202023-05-16%20175951.png)

## Confirmation:
![Alt text](images/Screenshot%202023-05-16%20180016.png)
