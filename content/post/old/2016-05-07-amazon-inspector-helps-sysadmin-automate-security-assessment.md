---
title: Amazon Inspector helps Sysadmin to automate security assessment
author: riesal
layout: post
date: 2016-05-07T07:29:21+00:00
url: /2016/05/amazon-inspector-helps-sysadmin-automate-security-assessment/
dsq_thread_id:
  - 4806792588
categories:
  - AWS
tags:
  - Amazon Inspector
  - Amazon Inspector helps Sysadmin to automate security assessment

---
Anyone who has ever worked with PHP, Apache or MySQL Web applications is aware of how quickly vulnerabilities can surface and become widespread problems. Security and vulnerability testing are standard among many of these application types because they&#8217;re frequently used. Consequently, attackers target these types of apps. Every system is vulnerable, making it nearly impossible to keep up with all of the security updates manually.<!--more-->

<div class="ad-wrapper ad-embedded">
  Many developers rely on third-party software for an automated security assessment. This is similar to how consumers would actively run virus scanning software to protect against known threats.
</div>

Amazon Inspector automatically detects common security issues and vulnerabilities in a Web application, as determined by the security community. AWS manages the service, making it simple to point it to an application and have the service check against known vulnerabilities that may affect it. Amazon Inspector is similar to an advanced version of [AWS Trusted Advisor][1], but it&#8217;s specific to security checks within an application.

Amazon Inspector is available in the AWS Management Console under &#8220;Security & Identity.&#8221;<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure1\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure1\_5416\_desktop.png" alt="Amazon Inspector in the AWS Management Console." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure1\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure1\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>Select the &#8216;Security & Identity&#8217; tab to find Amazon Inspector.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

Amazon Inspector requires an AWS Identity and Access Management (IAM) role, which requires access to the &#8220;DescribeInstances&#8221; command for Elastic Compute Cloud (EC2). Fortunately, Amazon provides a simple auto-creation process to automatically generate this basic role.<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure2\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure2\_5416\_desktop.png" alt="Automatically create roles in AWS." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure2\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure2\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>Users can create roles and tag EC2 instances when getting started with Inspector.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

After automatically creating the IAM role, a developer needs to tell Inspector which instances need to be checked. This is done by applying specific tags to EC2 instances that need to be monitored, such as the Web application&#8217;s servers. If these are running in AWS Elastic Beanstalk, be sure to apply these tags from within Elastic Beanstalk. Alternatively, if these instances are part of an Auto Scaling group outside of Elastic Beanstalk, that Auto Scaling group must be modified to automatically assign those tags. If a developer only tags the instances, the tags will not be available on new instances when they replace the old ones, and Inspector won&#8217;t monitor them.

Elastic Beanstalk environments only allow developers to add tags on initial creation. They do not allow developers to modify those values without creating a new environment. However, it doesn&#8217;t matter what tags are applied, as long as there are tags that can be used to identify the resources that must be monitored.

To create a Resource Group to identify Web servers, select the resources by a tag that are Web servers within the tag manager. Then click on the view as resource group. In this example, I grouped them by choosing the names of my environments.<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure3\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure3\_5416\_desktop.png" alt="Resource groups help identify servers." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure3\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure3\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>The tag manager helps users group and track tagged resources.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

Next, install the AWS agent on all servers that need to be monitored. This is different from many third-party security monitoring tools, as it acts as an internal or white box testing platform because the agent knows more about the configuration of each EC2 instance.

If using Auto Scaling or Elastic Beanstalk, don&#8217;t just install the agent right on the EC2 instances. If using Auto Scaling, consider updating the launch configuration to include the following as a user data script:

#!/bin/bash

apt-get update && apt-get upgrade -y

curl https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install | sh

Add the following script under the uploaded source code under: .ebextensions/awsagent.config for Elastic Beanstalk instances.

commands:

install_awsagent:

command: &#8220;curl https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install | sh&#8221;

Once this is set up and you verify the AWS agent is running, it&#8217;s time to set up the assessment target &#8212; a group of EC2 Instances &#8212; for Amazon Inspector to monitor.<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure4\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure4\_5416\_desktop.png" alt="Define an assessment target." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure4\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure4\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>Determine which EC2 instances you want Amazon Inspector to monitor.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

Next, define <a href="https://docs.aws.amazon.com/inspector/latest/userguide/inspector_assessments.html" target="_blank">what tests should run</a>.<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure5\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure5\_5416\_desktop.png" alt="Specify configurations for an assessment run." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure5\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure5\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>Users choose the rules packages, duration, SNS notifications and labels for their automated security assessment.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

In my example, I chose all available checks. Note the &#8220;duration&#8221; here isn&#8217;t how often to check, but how long each check should run. The default time period is one hour. But, for highly secure systems, developers may wish to have these checks run longer. The 15-minute interval should only be used for low-security environments where performance effect is more of an issue than security.

Once this is set, complete the creation of the template by following the prompts and the following screen will appear:<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure6\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure6\_5416\_desktop.png" alt="Completed assessment templates." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure6\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure6\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>Amazon Inspector displays completed assessment templates.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

From this screen, you can run a one-time test by clicking on the checkbox and choosing **Run**. You can also view existing runs, create a new template or stop running tests. There is no way to schedule runs with the AWS Management Console, but this could easily be achieved using AWS Lambda with CloudWatch Events. Consider using the simple Lambda script:

var AWS = require(&#8216;aws-sdk&#8217;);

var inspector = new AWS.Inspector({ region: &#8216;us-east-1&#8217; });

&nbsp;

exports.handler = function(event, context, callback){

inspector.startAssessmentRun({

assessmentTemplateArn: &#8216;arn:aws:inspector:us-east-1:ACCOUNTED:target/ID/template/ID&#8217;

}, callback);

}

Developers can find the assessment template Amazon Resource Name on the **Assessments Templates** view page by clicking the arrow next to the assessment template name.

This Lambda function can be triggered from either a CloudWatch Events rule (i.e., regular weekly, daily and so on) or as part of a continuous delivery mechanism to verify an application after initial deployment.<section class="section main-article-chapter" data-menu-title="Analyzing Amazon Inspector findings"> 

### <i class="icon" data-icon="1"></i>Analyzing Amazon Inspector findings {.section-title}

The &#8220;findings&#8221; section of Amazon Inspector shows the results of an automated security assessment. Findings will only appear at the end of the run. I saw some pretty basic alerts that will be handled by simply updating to the latest Amazon Machine Image:<figure class="main-article-image" data-img-fullsize="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure7\_5416.png"><img class="swap" src="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure7\_5416\_desktop.png" alt="Inspector details its findings." data-img320="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure7\_5416\_mobile.png" data-img640="http://cdn.ttgtmedia.com/rms/editorial/sAWS\_Figure7\_5416_desktop.png" /></p> <figcaption>

<i class="icon pictures" data-icon="z"></i>Amazon Inspector reveals security vulnerabilities and suggested ways to solve those problems.</figcaption> 

<div class="main-article-image-enlarge">
</div></figure> 

Click on the side arrow to see more details on the specific vulnerabilities detected as well as suggested ways to resolve the problems.</section> <section class="section main-article-chapter" data-menu-title="Wrapping it up"> 

### <i class="icon" data-icon="1"></i>Wrapping it up {.section-title}

Amazon Inspector runs best when there is active traffic coming into the application. So be sure not to schedule runs entirely during off-peak hours. Specifying a 24-hour run period may be ideal, as it helps to gather much more data than would otherwise be discovered. Inspector isn&#8217;t just an always-running process, it&#8217;s an active scan to try to identify any odd behavior with an application and provide an automated security assessment of potential issues, such as client break-in attempts.

Once a run is completed, the service will give you a list of possible security and vulnerability issues. You can resolve many of these issues by updating the OS of the running instances, so enabling automatic updates will solve many of these types of problems. For others, developers will receive links to the details of the vulnerability or exploit, as well as ways to patch them. Any issues are classified by severity and require manual attention to resolve.

**Keep checking the [intispace blog][2] for more upcoming tips on starting your own business.** Also, send us a tweet [@intispace][3] with your own ideas on what makes a great domain name!

<div class="wrapper clearfix">
  <div class="content left">
    <article class="post-33335 post type-post status-publish format-standard hentry category-aws tag-amazon-cloudwatch tag-cloudwatch tag-logs"> 
    
    <div class="entry clearfix">
      <p>
        <em>This article was brought to you by Intispace Netmedia, for scalable wordpress hosting visit our site here <strong><a href="https://intispace.com/">www.intispace.com</a></strong></em>
      </p>
    </div></article>
  </div>
</div></section>

 [1]: http://blog.intispace.com/2016/05/aws-trusted-advisor/
 [2]: http://blog.intispace.com/
 [3]: https://twitter.com/intispace