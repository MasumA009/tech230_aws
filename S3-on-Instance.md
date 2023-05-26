# Setting up S3 on EC2 instances

## Create a new instance:

Typical settings, can be found on my other repos.

![Alt text](s3-instance-images/Screenshot%202023-05-25%20154554.png)

### SSH in

Can also be fiund in my othe repo

![Alt text](s3-instance-images/Screenshot%202023-05-25%20154749.png)

## Run commands

Like many times before:

This updates:
```
Sudo apt update
```
This upgrades:
```
sudo apt upgrade -y
```
## Install Python and update
Install python via:
```
sudo apt install python -y
```
Results in:

![Alt text](s3-instance-images/Screenshot%202023-05-25%20160955.png)

Check the version:
```
python --version
```
results in:

![Alt text](s3-instance-images/Screenshot%202023-05-25%20155339.png)

### Update python version
Using the correct version of ython for boto3. As shown above, we have version 2, we need version 3. We need to run:
```
alias python=python3
```
The output was nothing

after checking the version through
```
python --version
```
i got:
![Alt text](s3-instance-images/Screenshot%202023-05-25%20160429.png)

Python has ben updated to version 3.

## Installing pip and awscli

to install pip:
```
sudo apt install python3-pip
```
This installs the pip package onto the instance, i also had to confirm it using `y`. it can be avoided by using `-y` after the install command.
It resulted in a long installation:

![Alt text](s3-instance-images/Screenshot%202023-05-25%20161303.png)

Next install awscli. It will allows us to use it. 

```
sudo pip3 install awscli
```
Resulted in:
![Alt text](s3-instance-images/Screenshot%202023-05-25%20163143.png)

## Log in to awscli and check

Now that it is installed, we can log in via:

```
aws configure
```
Resulted in:
![Alt text](s3-instance-images/Screenshot%202023-05-25%20163816.png)

I inputted my keys. 

we can check if it has ran by: It should list the files:
```
aws s3 ls
```

resulted in:

![Alt text](s3-instance-images/Screenshot%202023-05-25%20164723.png)

Preperation is done.


# Using terminal to do s3 commands

## Create a s3 bucket:
I treid creating one with the name `s3://Tech230-Masum-S3-Test` however it did not work. It needs to meet the criteria:

1. Bucket names must be at least 3 and no more than 63 characters long.
2. Bucket names can contain lowercase letters, numbers, and hyphens (-).
3. Bucket names must start with a lowercase letter or number.
4. Bucket names cannot be formatted as IP addresses (e.g., 192.168.5.4).
5. Bucket names should not contain underscores (_) or uppercase letters.

I tried again with the command:
```
aws s3 mb s3://tech230-masum-s3bucket
```
resulted in:

![Alt text](s3-instance-images/Screenshot%202023-05-25%20170656.png)

after running 
```
aws s3 ls
```
to check the lists of buckets, i recieved:

![Alt text](s3-instance-images/Screenshot%202023-05-25%20170839.png)

## Upload file to s3 bucket

follow the syntax:
```
aws s3 cp OneDrive/Documents/Sparta global/aws/tech230_aws/tech230_aws/test.txt s3://tech230-masum-s3bucket/
```

## Retrieve file from s3 bucket

follow the syntax:
```
aws s3 cp s3://tech230-masum-s3bucket/test2.txt .
```

![Alt text](s3-instance-images/Screenshot%202023-05-26%20104808.png)


## Delete content from s3 bucket

follow the syntax:
```
aws s3 rm s3://tech230-masum-s3bucket/test2.txt
```
![Alt text](s3-instance-images/Screenshot%202023-05-26%20104917.png)

## Delete s3 bucket:
run this:
```
aws s3 rb s3://tech230-masum-s3bucket
```
resulted in:
![Alt text](s3-instance-images/Screenshot%202023-05-25%20171159.png)

After running
```
aws s3 ls
```

My bucket was not in it. 






