---
title: What is Amazon CloudWatch Logs and how does it work?
author: riesal
layout: post
date: 2016-05-05T16:31:10+00:00
url: /2016/05/amazon-cloudwatch-logs-work/
dsq_thread_id:
  - 4802680620
categories:
  - AWS
tags:
  - Amazon CloudWatch
  - Cloudwatch
  - Logs

---
Amazon CloudWatch monitors many AWS Services such as Elastic Compute Cloud (EC2), Relational Database Service, Elastic Block Storage and several others. CloudWatch alerts can identify events such as CPU spikes and latency issues. When used with AWS AutoScaling, administrators can seamlessly increase EC2 capacity as needed.<!--more-->

But since its inception, Amazon CloudWatch has had some limitations. One issue was that it lacked the ability to process huge amounts of custom log data that cloud platforms create, and to react to events in near real time. CloudWatch Logs, a new feature introduced at the AWS Summit in New York last month, is an extension of CloudWatch that admins can use to detect patterns and take action to resolve issues that arise.

With Amazon CloudWatch Logs, admins can capture any type of log &#8212; from applications, on networks, from devices and so on &#8212; and process it in Amazon Kinesis. From there, admins can then monitor application health.

Amazon CloudWatch Logs can do everything?

Logs provide an incredible window into problems that affect a cloud platform and act as a business intelligence resource. Many vendors, such as Loggly and Logentries, have carved out niches, offering tools that interpret AWS logs. These companies don&#8217;t appear too threatened by CloudWatch Logs, as their services are already several generations ahead in their ability to process log data, provide intelligent alerting and help AWS customers identify trends.

With Amazon CloudWatch Logs, admins can analyze system logs to search for malicious login attempts over Secure Shell or pinpoint a botnet attempting a denial-of-service attack on the Web server. The monitoring tool looks for recurring IP patterns from your Web server logs and blocks access from attacking IP addresses. You also can query applications logs to identify customer usage patterns to improve the customer experience.

Amazon CloudWatch Logs can identify events that are unique to your specific platform &#8212; not just the canned metrics that CloudWatch delivers. There are operating system logs, application logs, Web server logs or logs from any type of endpoint device.

And setting up CloudWatch Logs is fairly straightforward. Simply install and configure a CloudWatch Logs agent on an EC2 instance and access results through the Amazon CloudWatch console. Costs associated with Cloudwatch Logs are $0.50 per 1 GB of ingested log data per day, plus $0.03 per GB archived per month, in addition to the cost of Amazon Kinesis.

**Keep checking the [intispace blog][1] for more upcoming tips on starting your own business.** Also, send us a tweet [@intispace][2] with your own ideas on what makes a great domain name!

_This article was brought to you by Intispace Netmedia, for scalable wordpress hosting visit our site here **[www.intispace.com][3]**_

 [1]: http://blog.intispace.com/
 [2]: https://twitter.com/intispace
 [3]: https://intispace.com/