---
title: A Glance Guide to DNS
author: riesal
layout: post
date: 2015-05-11T10:04:36+00:00
url: /2015/05/a-glance-guide-to-dns/
dsq_thread_id:
  - 3753965475
categories:
  - Business
  - DNS Server
  - Domain Names
tags:
  - A Glance Guide to DNS
  - dns explain
  - dns howto
  - dns simple explain
  - dns tutorial

---
**Take a quick behind-the-scenes tour of how DNS works to connect you to your desired webpage.**

The internet is no longer just a nice-to-have feature. It has become a significant part of our lives, with most people connecting to the internet every single day. Although millions of people are online at any given time, many don’t understand what is going on behind the scenes. When you enter something in the address bar, how does the browser know exactly where to go? DNS is the answer.

DNS stands for Domain Name System. Everything on the internet would crash if it weren’t for DNS’s intricate processes.

We’ll begin by explaining what a domain is. The concept of domain names is fairly easy to grasp. Basically, a domain name is a unique name that identifies a website. Behind every domain name is an IP address that is made up of many different numbers. IP addresses, or Internet Protocol addresses, are how computers and servers communicate with each other. Once an IP address is located, a web browser can open the desired web page.

This long list of numbers is very difficult to remember, hence why we have a domain name to make it easier. For example, the IP address of the domain google.com is 173.194.40.167. You could copy and paste this IP address in your browser and you would be directed to google.com. However, this would be an extremely tedious and difficult task to remember this 11 number code every time you want to access google.com. Domain names have simplified this task for us.

Another key point with domains is that the domain name is google.com, not just google. If you don’t type the .com, you are not going to arrive at google.com. The TLD, or Top Level Domain, is the .com (or .org, .uk, .net, etc.) part of a domain name. Without this, the server will not know where to look and the website will not be accessible.

Moving onto DNS. Simply put, DNS is a worldwide system that translates these domain names (e.g. google.com) into IP addresses. Once your computer has the IP address, it can access the web page and you can begin to access content. At the end of every domain, there is a “dot” that we never see. Google.com is actually google.com.. This “dot” at the end of the domain tells your operating system exactly where to look for the Root name servers. Although we don’t have to type in this extra “dot”, it is necessary behind the scenes in order to find the right IP address.

Now we are going to run through how your computer can find the appropriate IP address and load a web page. We’ll break down the process in six “simple” steps:

  1. Let’s say you want to find [vps.net][1]. You type in the domain name and wait.  As you do this, your computer begins searching for the right IP address.
  2. If the IP address is not saved in temporary storage, or cache, it looks to your router. Your router will do the same: it will search in its cache, and if it isn’t there it will look elsewhere.
  3. Your router will look to its configured DNS server(s). If the IP address is not cached there, it will look to the Root name servers.
  4. The Root name server will recognize that your web page is a .com TLD, and will direct the DNS server to the .com servers.
  5. The .com server can then direct the DNS server to the correct DNS server to retrieve records (the site’s web hosting provider). The records are then transmitted back to the computer and the browser can access the IP address and convert the coded files into a fully usable web page.
  6. The site’s DNS records should now be stored in your computer’s cache for easy access. How long it will be stored will depend on the TTL, or Time to Live. You can change your TTL settings depending on your preferences. Generally, they are set for 24 hours. Click [here][2] for more details about TTL.

These “simple” steps all take place faster than I can hit the spacebar on my keyboard.

DNS is commonly referred to as the “phonebook” of the internet. All domains are registered in this phonebook, but by different companies. Web hosting can be seen as the link between your site and your future visitors. [Most web hosting companies will register your domain name and provide you with all the DNS information you need][3]. That way, when your client tries to access your site, they go through the DNS process and are directed to your web hosting provider, who will have your site saved on their servers. From there, your client can access the site from the web hosting provider.

This process may seem daunting and confusing (and yes, it is a bit complicated), but it is a fascinating process that goes on all day, every day. In fact, I used DNS multiple times while writing this post without even thinking about it. Every time I clicked in my address bar to look up a word or to find a link, DNS was hard at work to direct me to the correct IP address. DNS provides us with a fast online experience that doesn’t require much work on our part. Let’s give it up for DNS!

**Keep checking the [intispace blog][4] for more upcoming tips on starting your own business.** Also, send us a tweet [@intispace][5] with your own ideas on what makes a great domain name!

&nbsp;

This article was brought to you by Intispace Netmedia, for scalable wordpress hosting visit our site here [www.intispace.com][3]

 [1]: http://vps.net/
 [2]: http://searchnetworking.techtarget.com/definition/time-to-live
 [3]: https://intispace.com
 [4]: http://blog.intispace.com
 [5]: https://twitter.com/intispace