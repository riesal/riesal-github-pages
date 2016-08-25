---
title: How To Measure Your Website’s Page Load Time
author: riesal
layout: post
date: 2015-05-25T00:00:04+00:00
url: /2015/05/how-to-measure-your-websites-page-load-time/
categories:
  - Business
  - Domain Names
  - Wordpress
tags:
  - How To Measure Your Website’s Page Load Time

---
When assessing the effectiveness of CDN, W3 Total Cache or any other WordPress caching plugin, it’s important that you are able to correctly measure the page loading time of your website.

There are several tools available for How To Measure Your Website’s Page Load Time. Our favorite, and the one we think is most accurate, is Pingdom.

## How To Use Pingdom

<div class="alert info">
  Visit: <a href="http://tools.pingdom.com/" target="_blank">http://tools.pingdom.com/</a>
</div>

Click Settings and choose the location closest to your web server, not your own physical location. Paste in your website URL and click Test Now.<span id="more-283"></span>

Pingdom will summarize your web page performance at the top with 4 metrics:

  * Performance grade.
  * Requests.
  * Load time.
  * Page size.

<img class="aligncenter size-full wp-image-286  lazyautosizes lazyloaded" src="http://cdn.wp-rocket.me/wp-content/uploads/4/Website-speed-test-1.jpg" alt="Pindgom website speed test" width="639" height="553" data-lazy-src="http://cdn.wp-rocket.me/wp-content/uploads/4/Website-speed-test-1.jpg" />

Of these metrics, the most important is load time!

The grade is a general guideline of how well your site is optimized, but it’s not important to get a perfect score there.

The speed at which your site loads is really the only number that matters. When Google is visiting your site, it does not care or know about the performance grade, only the loading time.

## Getting An Accurate Average

You should run the test several times to get an average loading time since it will not be identical every time.

If you have just added caching to your site, or have changed any options in your caching plugin, the first time a visitor (including a Pingdom bot) hits your page (unless it’s been preloaded), they will get a non-cached version of the page. That visit causes the cache to be generated, so the next visitor will get the faster, cached version.

So when you run the speed test, the first result could possibly be on a non-cached version of your page which is why it’s important to run the test a few times.

Intispace + Cloudflare will preload the homepage of your site and the pages linked from it when you either manually click the Preload button, when the cache has expired or when you create or update a post.

Additionally, when you create/update content the cache is deleted and preloaded a few seconds later for associated content such as category and tag archive pages.

If you simply use the Clear Cache feature or just save the settings, the preload won’t get triggered. So either trigger it manually, or just visit your website to generate the cache.

Most people only test the homepage of their site which typically has a lot more content on it than a regular page or post. So consider testing various types of content on your site to get a more well-rounded view of how fast your site is as a whole.

On many websites, visitors finding the site from a search engine will enter your site on a blog post or individual page, not necessarily the homepage, so the performance of all pages needs to be fast. You’ll probably find that those internal posts/pages load faster than your homepage.

## Benchmarking

To really see how much improvement you’re getting from your caching plugin you need to benchmark your site without any caching plugins first by running the above tests and taking an average page load time.

Then add your caching plugin with its most basic configuration and run the tests a few more times to get a comparison.

Any time you activate a new option in the plugin you need to see if it has an impact – for better or worse, so you need to test each change that you make, in the above manner.

A lot of people turn on W3 Total Cache for example and enable ALL the additional options but find some slowness. This could be because additional options such as minification and others have the potential to conflict with themes, plugins and server configurations and should be used cautiously. They are not always necessary. Just turning on the plugin will give you the most significant speed boost. The additional options are just that – optional. They are not always necessary and should always be tested to see if they are giving you additional improvements.

Testing after every change lets you isolate a particular feature that may be causing an issue. This is true of W# Total Cache or any of the other caching plugins you may use.

Also, make sure you don’t have multiple caching plugins running at once. For example, even if WP Super Cache is installed but not activated, it can still interfere so it needs to be fully deleted before testing a different plugin.

## The Waterfall Chart

The waterfall shows you the loading time of each component of your page – all the various image files, CSS, Javascript files etc that are loaded each time someone visits your page.

If you are using a caching plugin such as W3 Total Cache you should be getting a fast loading time, but the waterfall chart can help you identify any bottlenecks or problematic files. Sometimes it only takes a couple of large images or external scripts to drag down the loading time of your page.

Click on the dropdown at the top of the waterfall and choose “Sort By Load Time”. This will show you the longest loading files at the top, making problem files easy to spot.

External scripts such as those from third party ad servers etc are probably your biggest enemy here. Since those scripts are not coming from your server there is no caching you can do on them – you are at the mercy of their server. You can see that in this example:

<img class="size-full wp-image-285 aligncenter  lazyautosizes lazyloaded" src="http://cdn.wp-rocket.me/wp-content/uploads/4/sort-by-load-time.jpg" alt="Pingdom - Sort By Load Time" width="639" height="114" data-lazy-src="http://cdn.wp-rocket.me/wp-content/uploads/4/sort-by-load-time.jpg" />