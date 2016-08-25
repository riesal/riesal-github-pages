---
title: Image Optimization, An Easy Win For A Faster Site
author: riesal
layout: post
date: 2015-05-25T00:05:27+00:00
url: /2015/05/image-optimization-an-easy-win-for-a-faster-site/
categories:
  - Business
  - SEO
  - Wordpress
tags:
  - An Easy Win For A Faster Site
  - Image Optimization

---
Website speed optimization can be a complex and technical practice, but the non-techies out there will be happy to learn that one of the biggest problems is actually easy for the layperson to solve.

## The Problem With Images

Image Optimization, An Easy Win For A Faster Site. Images are typically the one of the biggest drains on page load time. Even with caching and a CDN, an unoptimized image will still drag down your page loading time. But, as the website owner, images are completely under your control, so if you can get a handle on how to work with and optimize images, you can have a great impact on the speed of your site.

Based on the websites that I look at during my Intispace customer support duties, I see that images contribute, on average, about 30% of the total page load time. Often this is the single largest factor of the loading time. In extreme cases, it could be closer to 60% of the loading time.

Here’s an example of what un-optimized images will do to your site:

**<img class="aligncenter size-full wp-image-431  lazyautosizes lazyloaded" src="http://cdn.wp-rocket.me/wp-content/uploads/4/pingdom-image-slow-site.jpg" alt="Large Images slow down your website" width="500" height="108" data-lazy-src="http://cdn.wp-rocket.me/wp-content/uploads/4/pingdom-image-slow-site.jpg" />**

The load time is 12 seconds and the size of the page is 8MB. Of those 8MB, images account for 6.7MB. This is out of control!

The number of http requests is commonly cited as a factor in load time, and while it is important, ultimately it’s the page size that is the real indicator of speed or slowness. You can have a small number of http requests, but if those requests are summoning giant images, you will have a problem on your hands.

### Understanding Dimensions and File Size

The dimensions of the image, i.e. how much space on the screen an image takes up, are measured in pixels and while they do not 100% dictate file size, they are related. The larger the dimensions of your image, the larger the file size.

File size is measured in kilobytes (KB) and megabytes (MB)
  
1MB = 1000KB

To give you a point of reference, the main content column of this blog is 796 pixels wide.

If you take a photo with your smartphone, depending on your settings, that photo could be in the region of 2500 pixels wide (or even more) with a filesize of 3MB (or 3000KB). If I were to take a photo with my phone and upload it to this blog without any editing, I’m going to be uploading a file that is about 3 times as big as it needs to be – a total waste of resources and a drag on page load.

So while snapping phone pics and uploading to your blog might be simple, it creates a real problem if you want a fast site,  by adding tons of unnecessary weight.

### Resizing Images

So the first thing you need to do is resize your images to the correct size for your site. For blog images, figure out how wide your blog’s content area is  and never upload an image wider than that. If it’s going to be used in a slider, make sure you determine the dimensions of the slider first.

**How do you know how wide your content area is?**

If you know how to use the developer tools built in to Chrome or Firefox, you can use that. But if that sounds scary there are simpler tools available.

If you’re on a Mac, there is a screen capture tool, Grab, already built-in, and when you outline an area on the screen it will tell you the pixels. <a href="https://www.aeyoun.com/posts/osx-screen-shot-ruler.html" target="_blank">This article explains in more detail.</a>

Or you can  <a href="https://chrome.google.com/webstore/detail/page-ruler/jlpkojjdgbllmedoapgfodplfhcbnbpn/related?hl=en" target="_blank">install the easy Page Ruler addon  for Chrome</a>

Once you’ve figured out what dimensions your images should be, you can use any of the below tools to resize your images accordingly:

**Resizing Applications**

  * Photoshop
  * GIMP – free, Windows & Mac
  * Irfan View- free for Windows
  * Preview for Mac – it’s already installed!
  * Developers on Macs can <a href="https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/sips.1.html" target="_blank">check out sips, a command line tool</a>

**Online Tools For Resizing**

  * Picmonkey.com
  * Pixlr.com (also has mobile app)
  * Fotor.com (also has mobile app)

It doesn’t matter which one you use – all you need to do is locate the resize feature. You’ll be able to enter the desired pixel width and the application will make sure the image stays in proportion by adjusting the height automatically.

#### Image Formats

Images on the web should be saved in either .jpg, .png, or possibly .gif

**JPEGs** are best used for photographs and general purpose images where you do not need any transparency. You can compress them easily and get a smaller filesize suitable for the web.

**PNGs** will often generate a larger filesize so should only be used when you have an image that requires transparency.

**GIFs** are less frequently used. They have a limited range of color so can only be used for very simple images, but can produce a small filesize.

### Compressing Images

So we’ve dealt with the physical dimensions of the image, now let’s deal with the ‘weight’ of the image. We want to compress the image to make it as lean and fast-loading as possible. **The goal is to reduce the filesize**. There isn’t a magic number as to what each image should be, since it depends on how the image will be used. Images being used in a hero banner or slider will be bigger, but if you have a few of them, I’d aim to get each one down to 100KB or less.

Small images that are going to be used for thumbnails, logos etc will be much much smaller. The logo at the top of this blog, for example, is 3.8KB.

With compression there may be a slight loss in quality, so you’re looking for a balance between quality and file size. But always remember that the smaller the filesize, the faster the load time will be.

**Applications**

  * Photoshop – make sure to use the _Save For Web_ option
  * GIMP
  * ImageOptim (Mac)

**Online Tools**

  * Compressor.io – make sure to choose the ‘lossy’ option for the biggest size reduction.

### WordPress Plugins

It’s preferable to resize and compress your image before you upload it to WordPress.

However, if your site is already live, you will need to deal with the images that are already there.

For the crucial images such as logos, headers and others that load on every page of your site, it would be best to make new versions of the images as described above, then install the **<a href="https://wordpress.org/plugins/enable-media-replace/" target="_blank">Enable Media Replace plugin</a>**. This will allow you to simply replace existing images in your media library with the new, optimized ones, without breaking any links.

For the other images sitting in your media library, where it would be unrealistic to go through and fix them all individually,there are a few handy plugins that will help you.

**<a href="https://wordpress.org/plugins/ewww-image-optimizer/" target="_blank">EWWW Image Optimizer</a>**
  
This plugin can go through your existing media library and compress everything in bulk.

If you build sites for clients or have a site with multiple users where you cannot ensure that everyone is using best practices and uploading nicely optimized images, the below plugins will help mitigate that.

**<a href="https://wordpress.org/plugins/imsanity/" target="_blank">Imsanity</a>**
  
You can determine the settings so that if someone uploads a gigantic image, it will automatically be reduced to maximum size of your choosing. No more 4000 pixel images clogging up the media library!

**<a href="https://wordpress.org/plugins/tiny-compress-images/" target="_blank">Compress JPEG & PNG Images</a>**
  
Once set up, this uses the TinyPNG API to automatically compress images on upload. You can get a free API key for up to 500 images/month which would be plenty for the average blogger.

If you need to benchmark the speed of your site, or do before/after comparisons with images after optimizing, <a title="How To Correctly Measure Your Website’s Page Load Time" href="http://blog.intispace.com/?p=33279" target="_blank">follow this guide on how to properly measure the load time of your site</a>.