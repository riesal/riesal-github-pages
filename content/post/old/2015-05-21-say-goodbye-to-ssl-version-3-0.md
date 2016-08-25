---
title: Say Goodbye to SSL Version 3.0
author: riesal
layout: post
date: 2015-05-21T12:44:21+00:00
url: /2015/05/say-goodbye-to-ssl-version-3-0/
dsq_thread_id:
  - 3782338222
categories:
  - PHP
  - SSL
  - Tutorial
  - Wordpress
tags:
  - Say Goodbye to SSL Version 3.0

---
It is no secret that securing your client’s data is an ongoing process and not something that you can simply install on a server/platform. That is why security solutions and protocols evolve all the time and developers frequently release new versions. The two cryptographic protocols that provide communication security over the Internet are TLS and SSL. The latest version of Secure Sockets Layer (SSL version 3.0) is the predecessor of TLS and is nearly 15 years old. So it was only a matter of time for someone to find the next big issue related to the SSL protocol. Yesterday Bodo Möller from the Google Security Team wrote <a href="http://googleonlinesecurity.blogspot.co.uk/2014/10/this-poodle-bites-exploiting-ssl-30.html" target="_blank">a blog post</a> about a new vulnerability in the design of SSL version 3.0. The vulnerability allows attackers to calculate the plain text of secure connections.
  
<span id="more-7162"></span>

### Possible Fixes:

There are two ways to protect yourself. The first and best way to mitigate this problem is to completely disable SSL version 3.0 on all of your servers and also remove SSL 3.0 support from all client products. For example, Google officially announced in the same blog post that in the coming months they will remove SSL version 3.0 support from all of their client products (including the Google Chrome browser). Cloudflare and Sucuri already stopped supporting it. All other major browsers will also disable SSLv3 by default (Firefox version 34 will be released on Nov 25).

The second solution is to support <a href="https://tools.ietf.org/html/draft-ietf-tls-downgrade-scsv-00" target="_blank">TLS_FALLBACK_SCSV</a>. This is a solution which prevents attackers from tricking browsers to use the old SSLv3 protocol instead of the TLS protocol. However, this solution is difficult to implement (many people will need to manually compile custom version of openssl) and it is only a new patch which solves this issue but does not provide any guarantees that SSLv3 won’t become vulnerable again a week from now.

### Our Solution:

Based on a detailed analysis of our network and the traffic towards our servers we decided to completely remove SSL version 3.0 support. As a matter of fact, a big portion of our servers have already been configured to support only the TLS encryption protocol and we’re in the process of reconfiguring all machines that are part of our infrastructure.

### Possible Issues:

We know that some web applications still use SSLv3. Let’s say that for example a developer has decided to configure his/her PHP app to use SSLv3 via the CURLOPT_SSLVERSION option. Unfortunately, if such application connects to our servers, the connection will not be established and the developer will need to patch the code of the app. Our analysis shows that less than 0.05% of all traffic towards our servers is SSLv3. Thus, we do not expect such issues to occur, but we still encourage our customers to contact us via our Helpdesk if they notice any SSL-related issues.