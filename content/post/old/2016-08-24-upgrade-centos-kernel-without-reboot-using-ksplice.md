---
title: Upgrade CentOS kernel without Reboot using Ksplice
author: riesal
layout: post
date: 2016-08-24T18:04:28+00:00
url: /2016/08/upgrade-centos-kernel-without-reboot-using-ksplice/
dsq_thread_id:
  - 4823539600
categories:
  - Business
tags:
  - kernel
  - linux
  - ksplice
  - kgraft
  - live patch
  - kernel patch
---

**It is simply how to allow kernel swap without needing reboot.**

Generally, all Linux distributions needs a scheduled reboot once to stay up to date with important kernel security updates. RHN (or other distro vendors) provides Linux kernel security updates. 

<span id="more-4512"></span><!--more-->

You can apply kernel updates using yum command or apt-get command line options. After each upgrade you need to reboot the server. Ksplice service allows you to skip reboot step and apply hotfixes to kernel without rebooting the server. In this post I will cover a quick installation of Ksplice for RHEL 5.x and try to find out if service is worth every penny.

The technology and hack behind this looks pretty cool. This is useful if you’ve a small number of Linux based servers and/or you want avoid unscheduled reboot just to apply hotfix to Linux kernel.

How Do I Install Ksplice?

First, you need to register with Ksplice. Type the following command to install rpm repo under RHEL 5:

    rpm -ivh https://www.ksplice.com/yum/uptrack/centos/ksplice-uptrack-release.noarch.rpm

To install Ksplice, enter:

    yum install uptrack

Edit /etc/uptrack/uptrack.conf, enter:

    vi /etc/uptrack/uptrack.conf

Update it as follows (input your access key):

[Auth]</br> 
accesskey = ADD-YOUR-ACCESS-KEY-HERE</br>
[Network]</br>
https_proxy = </br>
[Settings]</br>
install_on_reboot = yes</br>
autoinstall = no</br>
cron_output_install = no</br>
cron_output_available = no</br>
cron_output_error = no</br>

Save and close the file.

How Do I Apply Rebootless Kernel Updates?
You need to first download and apply updates via RHN:

    yum -y update

OR

    yum update kernel kernel-headers kernel-devel

Don’t reboot the box, simply type the following command to apply hotfix:

    uptrack-upgrade

To see a list of updates that are currently installed, enter:

    uptrack-show -y

Sample Email Notification
You will get an email as follows when updates are available:

![Fig.01: Ksplice Update Notification](http://s0.cyberciti.org/uploads/tips/2010/04/ksplice-rhel-update-email.png) 

The web interface also provides information about your server and installed kernel updates:
![Fig.02: Uptrack Web Interface](http://s0.cyberciti.org/uploads/tips/2010/04/uptrack-web-interface.png)

Conclusion

The pricing is as follows:

 - Monthly price per system First 20 servers : $3.95
 - Beyond 20 servers: $2.95
 - Currently it is free for all Ubuntu users.
 
Ksplice is a pretty good and stable software. This is useful for Linux admin or business who can not accept downtime for patching. A few business comes in my mind:

 - Small shop, say 8-12 Linux based servers.
 - Pro-blogging or webmaster servers (a typical setup included one web
   server and one db server). Avoiding downtime means more ad revenue
   for webmasters.
 - Hosting companies – again avoiding downtime means good customer
   satisfactions and less work for sys admins. If you run VM based
   hosting (OpenVZ or XEN based vps) you can avoid downtime too.
 - Small cluster of Linux system, say 6 system – If cluster is using 80%
   of capacity and if one of node rebooted for kernel upgrade, load will
   up for rest of 5 systems. In such case, this service can help to keep
   load under control without rebooting the box. However, this is NOT
   very useful for very large Linux based cluster redundant
   load-balanced servers, routers, switches, firewalls etc. Since your
   cluster is so large that 4-5 servers failing makes no difference to
   the remaining nodes. In some cases it is possible to do geo load
   balancing too.

But I’ve HA Failover Solution In Place…
100% uptime depends upon lots of factors and and HA solution handles hardware or other failures very well. However, *Ksplice service is not all about 100% uptime*, **it is about not rebooting your server for a Linux kernel upgrade**. You can easily combine Ksplice with HA solution (such as keepalived+nginx reverse proxy) and try to get perfect five 9s. I highly recommend this service for small to medium size business or professional webmasters.


