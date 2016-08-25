---
title: Get the AWS EC2 instance metadata
author: riesal
layout: post
date: 2016-07-21T16:06:47+00:00
url: /2016/05/get-the-aws-ec2-instance-metadata/
dsq_thread_id:
  - 4823539600
categories:
  - Business
tags:
  - aws
  - Get the AWS EC2 instance metadata
  - metadata

---

**Get the AWS EC2 instance metadata**

Now you are ready to send the first commands to your EC2 linux instance. Let’s check the EC2 instance metadata by hitting a specific AWS node only available from within the instance itself.  
<span id="more-4512"></span><!--more-->
Instance metadata is data about your instance that you can use to configure or manage the running instance. You can list all instance metadata by issuing the following command:

curl -w "\n" http://169.254.169.254/latest/meta-data/

![AWS EC2 metadata: services list](https://d2wxe3cu71edbr.cloudfront.net/media/uploads/lab-step/aws-ec2-api-7f27ea40-e554-4524-bc59-f2cfe515c93a.png)

 

You can easily check the list of security groups attached to the instance, its ID, the hostname, or the ID of the used AMI. These commands are extremely useful when you want to automate the setup of new instances:

curl -w "\n" http://169.254.169.254/latest/meta-data/security-groups

curl -w "\n" http://169.254.169.254/latest/meta-data/ami-id

curl -w "\n" http://169.254.169.254/latest/meta-data/hostname

curl -w "\n" http://169.254.169.254/latest/meta-data/instance-id

curl -w "\n" http://169.254.169.254/latest/meta-data/instance-type
 

![AWS EC2 metadata](https://d2wxe3cu71edbr.cloudfront.net/media/uploads/lab-step/aws-ec2-api-2-225b554d-924d-457b-a62f-3bf8f60ae329.png)

 

Finally, you can also get the public key of the attached Keypair using the public-keys metadata:

curl -w "\n" http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key

 

![AWS EC2 metadata](https://d2wxe3cu71edbr.cloudfront.net/media/uploads/lab-step/aws-ec2-api-3-d6e78feb-dcb7-4dea-98fb-0f2b7423b4ef.png)
