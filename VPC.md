# VPCs

Virtual Private Cloud:

Here is my diagram however more can be read here: 
[AWS's VPC Doccumentation](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/amazon-vpc-to-amazon-vpc-connectivity-options.html)

![Alt text](vpc-image/Screenshot%202023-05-23%20142724.png)

note: the 255 means that the digits on the Ip go upto 255.

# Creating a VPC with a Public Subnet

## Pre-reading Notes:

Before reading the repo, here are a couple things you should know:

1. AWS is "easy to follow", in that the next step is not too far from the previous.

2. If you are lost or cant find anything there is a dropdown menu as well as a search bar to help you navigate.

More infomation can be read here: 
[AWS's VPCs](https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/amazon-vpc-to-amazon-vpc-connectivity-options.html)

# 2 Tier deployment

## Step 1: Create VPC

Search for `VPC` on the dropdown menu.
![Alt text](vpc-image/Screenshot%202023-05-23%20145017.png)

Follow it through,

1. Click `create`, and modify. 

2. Select: `VPC only`, 

3. Our `IPv4 CIDR` is  `10.0.0.0/16`.

Click create. Resulting in:
![Alt text](vpc-image/Screenshot%202023-05-23%20145549.png)

## Step 2: Internet gateway
Select `Internet Gateway` on the left dropdown menu. 

1. Click Create `Internet gateway`.

Name it and click create:
![Alt text](vpc-image/Screenshot%202023-05-23%20145736.png)


## Step 3: Connect Internet Gateway to VPC

From the action menu, select: `Attach VPC`:

![Alt text](vpc-image/Screenshot%202023-05-23%20145832.png)

Select the VPC by searching, in this case it was my name. 

![Alt text](vpc-image/Screenshot%202023-05-23%20145852.png)

## Step 4: Create Subnet 

From the menu on the left, select `Subnet`, and `create subnet`.

From here we can create muliple subnets.

In this example we need to make a public subnet.

Follow these settings:

![Alt text](vpc-image/Screenshot%202023-05-23%20150554.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20150631.png)

Remember we can add other subnets if needed. 

## Step 5: Create a routing table

From the menu on the left, select `Route table`. click `Create`.

Here we are creating a public route table.

![Alt text](vpc-image/Screenshot%202023-05-23%20150849.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20150915.png)

1. Select `Subnet associations`, located down below. 

![Alt text](vpc-image/Screenshot%202023-05-23%20151205.png)

2. Select the Public subnet for the Public route table. 

3. After selecting it, confirm it. 

### Confirmation (checking)

we can then check if it has worked by checking the associations:
![Alt text](vpc-image/Screenshot%202023-05-23%20151400.png)

### Connect Internet Gateway to route table

In order to connect to the subnet, we need to connect the internet to the route table. 

1. Click `Edit routes` at the bottom of the page.

2. Add a route and input the following:

![Alt text](vpc-image/Screenshot%202023-05-23%20151719.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20151814.png)


NOTE: We do not need to create the route table for the PRIVATE subnet, it is done automatically. 

## Step 6: Create Subnet

1. Create a new instance however we need to change the `Network settings`.

we need to change the deafult-vpc. 

2. Click `Edit` and change according to this:
![Alt text](vpc-image/Screenshot%202023-05-23%20153724.png)

3. `Enable` the Auto-Assign Public IP.

NOTE: EXSISTING GROUPS WILL NOT WORK.

4. we need to create a new security group:
![Alt text](vpc-image/Screenshot%202023-05-23%20153943.png)

Here are the rules:

![Alt text](vpc-image/Screenshot%202023-05-23%20153943.png)

5. Navigate to User data and allow nginx to run:
```
#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
```

6. Navigate to instance and launch the address. 

Success!

![Alt text](vpc-image/Screenshot%202023-05-23%20154617.png)






