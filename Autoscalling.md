# Autoscalling 

## Autoscalling group:
An autoscalling group contains a collection of EC2 instances. These groups can be used for the purpose of automatic scaling and mangement. [Read more here at the official AWS site](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-groups.html)

## the process
We have gone over these processes in previpus repos.

The way we will make use of auto scaling groups is by:
1. Creating an EC2 instance (in our case an instance that runs nginx)
2. Creating an AMI of the instance
3. Creating a launch template 

    Note: this lanch template can be configured and allows us to specify the AMI 


![Alt text](autoscale-image/elb-tutorial-architecture-diagram.png)

## creating scaling group

### step 1: choose template

name the group and choose a template:
![Alt text](autoscale-image/Screenshot%202023-05-22%20141936.png)

### step 2: AV zone:

choose correct zones:
1a, 1b, 1c.
![Alt text](autoscale-image/Screenshot%202023-05-22%20142245.png)

### step 3: load balancer:
set up balancers:
![Alt text](autoscale-image/Screenshot%202023-05-22%20143555.png)

![Alt text](autoscale-image/Screenshot%202023-05-22%20143616.png)


### step 4: capacity and policy
The requirments:
![Alt text](autoscale-image/Screenshot%202023-05-22%20143750.png)

And our policy:
![Alt text](autoscale-image/Screenshot%202023-05-22%20144041.png)

### step 5: Tag:

Tag matters, or else wont be able to find after.
![Alt text](autoscale-image/Screenshot%202023-05-22%20144347.png)

### step 6: review

look over and launch!

![Alt text](autoscale-image/Screenshot%202023-05-22%20144453.png)

## check load balancers

search for 2oad balancers" in the search tab. and select the EC2 one:
![Alt text](autoscale-image/Screenshot%202023-05-22%20145128.png)

Navigate inside and select the DNS location, search this in the search bar.
![Alt text](autoscale-image/Screenshot%202023-05-22%20145427.png)

Result:
![Alt text](autoscale-image/Screenshot%202023-05-22%20145522.png)


# Setting up sparta app

After having a working nginx instance, ami and template. 
we can use the existing 