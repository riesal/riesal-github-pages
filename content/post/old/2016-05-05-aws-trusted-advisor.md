---
title: AWS Trusted Advisor
author: riesal
layout: post
date: 2016-05-05T16:13:53+00:00
url: /2016/05/aws-trusted-advisor/
dsq_thread_id:
  - 4802878349
categories:
  - AWS
tags:
  - aws
  - AWS Trusted Advisor
  - trusted advisor

---
AWS Trusted Advisor is a product that allows a cloud administrator to provision Amazon Web Services resources according to best practices in four categories: cost optimization, security, fault tolerance and performance improvement. AWS Trusted Advisor compiles best practices based on the collective experiences of previous and existing AWS customers.<!--more-->

AWS Trusted Advisor performs checks that monitor and can help improve performance of AWS resources. The service displays a green check mark icon when no change is needed, an orange exclamation point when an investigation is recommended and a red exclamation point when action is recommended. The number of checks depends on the AWS Support Plan, as Basic and Developer plans are limited to four checks; Business and Enterprise plans allow for 41 checks.

AWS Trusted Advisor provides a dashboard for an admin to visualize the four categories it evaluates, including recent changes to those categories. The service provides action links in its reports, which are hyperlinks that connect an administrator user to the AWS Management Console to quickly make changes to resources.

A cloud administrator working in AWS can receive free notifications through Trusted Advisor to keep updated on resource deployments. An admin can also manually refresh checks every five minutes from the dashboard.

t&#8217;s possible to exclude certain items in a Trusted Advisor report if they are not relevant to a particular cloud environment. Trusted Advisor integrates with Amazon Identity and Access Management, allowing an admin to limit access to specific checks or categories.

### Features

<div class="aws-text-box section">
  <div class=" ">
    <p>
      AWS Trusted Advisor provides a suite of features for you to customize recommendations and to proactively monitor your AWS resources.
    </p>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="eight columns ">
      <div class="parsys col1">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h4 id="Trusted_Advisor_Notifications">
                Trusted Advisor Notifications
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
            </div>
            
            <div class="four columns ">
              <div class="parsys col2">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignleft" title="201446_thumb_TA_Graphics_Notifications" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201446_thumb_TA_Graphics_Notifications.png" alt="201446_thumb_TA_Graphics_Notifications" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              The Trusted Advisor notification feature helps you stay up-to-date with your AWS resource deployment. You will be notified by weekly email when you opt in for this service, and it is totally free.
            </p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="four columns ">
    </div>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="four columns ">
    </div>
    
    <div class="eight columns ">
      <div class="parsys col2">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h4>
                Recent Changes<sup> *</sup>
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
              <div class="parsys col1">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignleft" title="201437_thumb_TA_Graphics_RecentChanges" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201437_thumb_TA_Graphics_RecentChanges.png" alt="201437_thumb_TA_Graphics_RecentChanges" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              You can track recent changes of check status on the console dashboard. The most recent changes appear at the top of the list to bring them to your attention.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="eight columns ">
      <div class="parsys col1">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h3 id="Exclude_Items">
              </h3>
              
              <h4>
                Exclude Items
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
              <div class="parsys col2">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignright" title="201438_thumb_TA_Graphics_ExcludeInclude" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201438_thumb_TA_Graphics_ExcludeInclude.png" alt="201438_thumb_TA_Graphics_ExcludeInclude" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              The &#8220;exclude items&#8221; feature (formerly called “suppress”) allows you to customize the Trusted Advisor report. You can exclude items from the check result if they are not relevant; the excluded items appear separately, and you can restore (include) them at any time.
            </p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="four columns ">
    </div>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="four columns ">
    </div>
    
    <div class="eight columns ">
      <div class="parsys col2">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h4 id="Action_Links">
                Action Links
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
              <div class="parsys col1">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignleft" title="201442_thumb_TA_Graphics_ActionLink" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201442_thumb_TA_Graphics_ActionLink.png" alt="201442_thumb_TA_Graphics_ActionLink" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              Items in a Trusted Advisor report have hyperlinks to the AWS Management Console, where you can take action on the Trusted Advisor recommendations.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="eight columns ">
      <div class="parsys col1">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h3 id="Access_Management">
                <a href="http://aws.amazon.com/premiumsupport/faqs/#TAnewIAM" name="Access_Management"> </a>
              </h3>
              
              <h3>
              </h3>
              
              <h4>
                Access Management
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
              <div class="parsys col2">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignleft" title="201439_thumb_TA_Graphics_IAM" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201439_thumb_TA_Graphics_IAM.png" alt="201439_thumb_TA_Graphics_IAM" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              You can use AWS Identity and Access Management (IAM) to control access to specific checks or check categories.
            </p>
          </div>
        </div>
      </div>
    </div>
    
    <div class="four columns ">
    </div>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="four columns ">
    </div>
    
    <div class="eight columns ">
      <div class="parsys col2">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h3 id="AWS_Support_API">
                <a href="https://aws.amazon.com/documentation/awssupport/" name="AWS_Support_API"> </a>
              </h3>
              
              <h3>
              </h3>
              
              <h3>
              </h3>
              
              <h4>
                AWS Support API<sup> *</sup>
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
            </div>
            
            <div class="four columns ">
              <div class="parsys col1">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignleft" title="201443_thumb_TA_Graphics_API" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201443_thumb_TA_Graphics_API.png" alt="201443_thumb_TA_Graphics_API" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              You can retrieve and refresh Trusted Advisor results programmatically using AWS Support API.
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="columnbuilder parbase section">
  <div class="row column-builder">
    <div class="eight columns ">
      <div class="parsys col1">
        <div class="title-wrapper section">
          <div class="row title">
            <div class="twelve columns">
              <h3 id="Refresh">
              </h3>
              
              <h3>
              </h3>
              
              <h4>
                Refresh
              </h4>
            </div>
          </div>
        </div>
        
        <div class="aws-text-box section">
          <div class=" ">
            <div class="four columns ">
              <div class="parsys col2">
                <div class="aws-comp section">
                  <figure class="image-box "> 
                  
                  <div class="parbase image">
                    <img class="alignnone alignleft" title="201440_thumb_TA_Graphics_Refresh" src="https://d0.awsstatic.com/Image_Thumbs/TrustedAdvisor/ConsoleVersion/201440_thumb_TA_Graphics_Refresh.png" alt="201440_thumb_TA_Graphics_Refresh" />
                  </div></figure>
                </div>
              </div>
            </div>
            
            <p>
              You can refresh individual checks or refresh all the checks at once by clicking the Refresh All button in the top-right corner of the summary dashboard. A check is eligible for refresh 5 minutes after it was last refreshed.
            </p>
            
            <div class="four columns ">
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="four columns ">
    </div>
    
    <div class="four columns ">
      <p>
        <strong>Keep checking the <a href="http://blog.intispace.com/">intispace blog</a> for more upcoming tips on starting your own business. </strong>Also, send us a tweet <a href="https://twitter.com/intispace">@intispace</a> with your own ideas on what makes a great domain name!
      </p>
      
      <p>
        <em>This article was brought to you by Intispace Netmedia, for scalable wordpress hosting visit our site here <strong><a href="https://intispace.com/">www.intispace.com</a></strong></em>
      </p>
    </div>
  </div>
</div>