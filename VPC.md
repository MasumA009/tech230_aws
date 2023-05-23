# VPCs

Virtual Private Cloud

![Alt text](vpc-image/Screenshot%202023-05-23%20142724.png)

# Creating a VPC with a Public Subnet

## Step 1: Create VPC
Search for `VPC` on the dropdown menu.
![Alt text](vpc-image/Screenshot%202023-05-23%20145017.png)

Click `create`, and modify. 

Select: `VPC only`, 

Our `IPv4 CIDR` is  `10.0.0.0/16`.

Click create.
![Alt text](vpc-image/Screenshot%202023-05-23%20145549.png)

## Step 2: internet gateway
Select `Internet Gateway` on the left menu. 

Click Create `Internet gateway`.

Name it and create:
![Alt text](vpc-image/Screenshot%202023-05-23%20145736.png)


## step 3: connect internet gateway to VPC

From the action menu, select `Attach VPC`:
![Alt text](vpc-image/Screenshot%202023-05-23%20145832.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20145852.png)

## step 4: Create subnet 

From the menu on the left, select `Subnet`, and `create subnet`.

From here we can create muliple subnets.

In this example we need to make a public subnet.

![Alt text](vpc-image/Screenshot%202023-05-23%20150554.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20150631.png)

Rememebr we can add other subnets if needed. 

## step 5: Create routing table
From the menu on the left, select `Route table`. click `Create`.

Here we are creating a public route table.

![Alt text](vpc-image/Screenshot%202023-05-23%20150849.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20150915.png)

Next, select `Subnet associations`, located down below. 

![Alt text](vpc-image/Screenshot%202023-05-23%20151205.png)

Select the Public subnet for the Public route table. 

After selecting it, confirm it. 

we can then check if it has worked by checking the associations:
![Alt text](vpc-image/Screenshot%202023-05-23%20151400.png)

### connect Internet Gateway to route table

In order to connect, we need to connect the internet to the route table. 

Click `Edit routes` at the bottom of the page.

Add a route and input the following:

![Alt text](vpc-image/Screenshot%202023-05-23%20151719.png)

![Alt text](vpc-image/Screenshot%202023-05-23%20151814.png)


NOTE: We do not need to create the rote table for the PRIVATE subnet, it is doen automatically. 

## Step 6: Create subnet

Create a new instance however we need to change the `Netwrok settings`.

we need to change the deafult-vpc. Click `Edit`:
![Alt text](vpc-image/Screenshot%202023-05-23%20153724.png)

`Enable` the Auto-Assign Public IP.

NOTE: EXSISTING GROUPS WILL NOT WORK.

we need to create a new one:
![Alt text](vpc-image/Screenshot%202023-05-23%20153943.png)

Here are the rules:

![Alt text](vpc-image/Screenshot%202023-05-23%20153943.png)

navigate to User data and allow nginx to run:
```
#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install nginx -y
```

Navigate to instance and launch the address. 

Success!

![Alt text](vpc-image/Screenshot%202023-05-23%20154617.png)







