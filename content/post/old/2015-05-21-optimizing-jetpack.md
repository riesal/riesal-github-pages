---
title: Optimizing Jetpack!
author: riesal
layout: post
date: 2015-05-21T12:35:10+00:00
url: /2015/05/optimizing-jetpack/
dsq_thread_id:
  - 3782316575
categories:
  - PHP
  - Tutorial
  - Wordpress
tags:
  - Optimizing Jetpack
  - wordpress jetpack howto

---
<div class="grid-col span12">
  Jetpack remains a polarizing plugin amongst developers so it’s not often discussed on developer-oriented blogs. The plugin has a history filled with bloat, slowness, and conflicts with other plugins. Admittedly, I myself have a love/hate relationship with it.
</div>

<!--more-->

<div class="grid-col span12">
</div>

<div class="grid-col span12">
  However, recently, it’s been improved so much that I feel comfortable recommending it for some users. It’s now truly modularized, allowing complete control over which features are activated, and much more stable. My biggest pet peeve will always be the way you have to connect to WordPress.com to use it. I understand all the technical reasons for that, but it’s a terrible user experience that is very confusing (especially for novice WordPress users).
</div>

<div class="grid-col span7">
  <div class="post-content">
    <p>
      With all that said, why is Optimizing Jetpack making an appearance here? The fact is if you can get past the clunky activation, Jetpack offers a great suite of features for the average blogger. But, in keeping with the WordPress philosophy of “decisions not options”, as an end user, you don’t have many configuration settings compared to all the options you would get if you used a similar standalone plugin.
    </p>
    
    <p>
      Fortunately, the code has been sprinkled with actions and filters for developers. So, while Jetpack is generally marketed to entry-level end users, there are actually some nice Easter eggs for developers who want to customize things a little bit for their clients −I call them Easter eggs because the ability to customize Jetpack hasn’t really been highlighted or documented too much. There has yet to be a complete resource that documents all of filters and actions available (I’ll give just a few examples here), but you can dig through the code looking for add_filter and add_action to find more. The <a href="https://github.com/Automattic/jetpack">code can be found on GitHub</a> for easy reading (and if you want to contribute).
    </p>
    
    <p>
      This article assumes you have some experience with development or at least are not afraid to work with code, even if it’s just copy/pasting snippets (hey, we all start out like that!). Here’s just a handful of ways you can tweak Jetpack.
    </p>
    
    <p>
      <strong>Ditch That WordPress.com Connection…<br /> </strong>Optimizing Jetpack! …Well, almost. You can actually use Jetpack without connecting to WordPress.com, at least partially. Some of the modules will work fine without the connection whereas some will remain unavailable. This comes handy when you are working on a local installation or even a production site if you’re only using certain modules.
    </p>
    
    <p>
      Add the following to your wp-config.php file to use development mode:
    </p>
    
    <pre>define( ‘JETPACK_DEV_DEBUG’, true);</pre>
    
    <h4>
      <strong>Customization Best Practices</strong>
    </h4>
    
    <p>
      Optimizing Jetpack! When customizing Jetpack, there are a couple of things to keep in mind:
    </p>
    
    <ul>
      <li>
        Your customizations will generally be achieved by writing your own functions, so make sure to use <strong>unique function names</strong> to avoid collision with any other plugin. I’ll prefix all mine with ‘wtwlb’ (wtw for WebTrainingWheels, lb for my initials) in these examples.
      </li>
    </ul>
    
    <ul>
      <li>
        Customizations can either be done in your theme, the child theme’s functions.php and template files, or via a ‘<a href="https://css-tricks.com/wordpress-functionality-plugins/">functionality plugin</a>’. This is a simple plugin that contains anything you would otherwise paste in functions.php and it is advantageous because it’s theme-independent. If you plan on using the Jetpack mobile theme and customizing it, you will need to do it this way.
      </li>
    </ul>
    
    <p>
      <strong>Customize The Sharing Module<br /> </strong>The sharing module in Jetpack is popular as it’s a pain-free way to add the most popular social share buttons to your content. Yet there are a couple of limitations.
    </p>
    
    <p>
      <strong>Change Button Placement<br /> </strong>By default, Jetpack lets you choose on what content (posts, pages, homepage, etc.) you want the buttons to appear, but it automatically places the buttons at the bottom of the content. A common request is to add the buttons at the top as well as (or instead of) at the bottom. This is really easy to do.
    </p>
    
    <p>
      The icons are placed using a filter on the WordPress tags for the_content and the _excerpt:
    </p>
    
    <pre>add_filter( ‘the_content’, ‘sharing_display’, 19 );
 add_filter( ‘the_excerpt’, ‘sharing_display’, 19 );</pre>
    
    <p>
      Removing either of those placements would be a matter of writing a small function to remove the appropriate filter. To remove it from the_content, and, therefore, from the bottom of the post, for example, the below would work:
    </p>
    
    <pre>function wtwlb_remove_share() {
 remove_filter (‘the_content’, ‘sharing_display’, 19 ); }
 add_action (‘loop_start’, ‘wtwlb_remove_share’);</pre>
    
    <p>
      Then you can use the following in your functionality plugin to place the buttons at the top of the post:
    </p>
    
    <pre>function wtwlb_move_jpshare( $content = ” ) {
 if ( function_exists( ‘sharing_display’ ) ) {
 return sharing_display() . $content;
 }
 else {</pre>
    
    <pre>return $content;
 }
 }
 add_filter( ‘the_content’, ‘wtwlb_move_jpshare’, 19 );</pre>
    
    <p>
      If you want to manually place the buttons elsewhere in your custom theme or child theme’s template files, you can use the following wherever you want the buttons to appear:
    </p>
    
    <pre>if ( function_exists( ‘sharing_display’ ) ) {
 sharing_display( ”, true );
 }</pre>
    
    <p>
      <strong>Remove the Counter<br /> </strong>Optimizing Jetpack! By default, Jetpack will show the sharing counts on the buttons. If you’d like to prevent that, you can do so with one line:
    </p>
    
    <pre>add_filter( ‘jetpack_sharing_counts’, ‘__return_false’ );</pre>
    
    <p>
      <img class="alignnone wp-image-14063" src="http://s1.mt-cdn.net/blog/wp-content/uploads/2015/05/markuppicture.png" alt="markuppicture" width="700" height="314" />
    </p>
    
    <p>
      <strong>Style The Icons<br /> </strong>Optimizing Jetpack! There’s no fancy trick to styling Jetpack sharing buttons. You can radically change the look with pure CSS in your child theme. The icons themselves are Genericons (an icon font), making them easy to manipulate the color, size, etc.
    </p>
    
    <h4>
       <strong>Customize Related Posts</strong>
    </h4>
    
    <p>
      Optimizing Jetpack! Showing related content is a great feature to keep readers on your site, but some WordPress plugins that do this can be slow and inefficient. Jetpack offloads the intensive processing work to its WordPress.com servers, allowing for a nimble Related Posts feature. By default, you only have two options to customize:
    </p>
    
    <p>
      <img class="alignnone wp-image-14064" src="http://s1.mt-cdn.net/blog/wp-content/uploads/2015/05/customizerelatedposts.png" alt="customizerelatedposts" width="700" height="295" />
    </p>
    
    <p>
      So, here are a few handy tweaks you can make:
    </p>
    
    <p>
      <strong>Customize the Number of Posts<br /> </strong>By default, the module displays three posts. You can change that with the function below. For example, this will set the number of posts to four:
    </p>
    
    <pre>function wtwlb_jpmore_related_posts( $options ) {
 $options[‘size’] = 4;
 return $options;
 }
 add_filter( ‘jetpack_relatedposts_filter_options’, ‘wtwlb_jpmore_related_posts’ );</pre>
    
    <p>
      Since I want four posts in a row and the module style is based on three, I’ll need to tweak the CSS to accommodate. Here I set the width of each to 25% instead of 33%:
    </p>
    
    <pre>div#jp-relatedposts div.jp-relatedposts-items .jp-relatedposts-post {
 width: 25%;
 }</pre>
    
    <pre>div#jp-relatedposts div.jp-relatedposts-items .jp-relatedposts-post:nth-child(3n+4),
 div#jp-relatedposts div.jp-relatedposts-items-visual .jp-relatedposts-post:nth-child(3n+4) {
 clear: none;
 }</pre>
    
    <p>
      <strong>Change the Headline<br /> </strong>The default headline for the related posts section is simply “Related”. In this snippet, we’ll change that to “Recommended Posts”:
    </p>
    
    <pre>function wtwlb_related_posts_headline( $headline ) {
 $headline = sprintf(
 ‘&lt;h3 class=”jp-relatedposts-headline”&gt;&lt;em&gt;%s&lt;/em&gt;&lt;/h3&gt;’,
 esc_html( ‘Recommended Posts’ )
 );
 return $headline;
 }
 add_filter( ‘jetpack_relatedposts_filter_headline’, ‘wtwlb_related_posts_headline’ );</pre>
    
    <p>
      This is how it looks by default:
    </p>
    
    <p>
      <img class="alignnone wp-image-14069" src="http://s1.mt-cdn.net/blog/wp-content/uploads/2015/05/headlinechange.png" alt="headlinechange" width="700" height="552" />
    </p>
    
    <p>
      And with the two changes above:
    </p>
    
    <p>
      <img class="alignnone wp-image-14070" src="http://s1.mt-cdn.net/blog/wp-content/uploads/2015/05/twochangesheadline.png" alt="twochangesheadline" width="700" height="294" />
    </p>
    
    <p>
      <strong>Change Thumbnail Size<br /> </strong>If you’d like to change the dimensions of the thumbnails that go with each related post, you can use the following. In this example, I’m making the images square, i.e. 125 x125:
    </p>
    
    <pre>function wtwlb_jp_image_size ( $thumbnail_size ) {
 $thumbnail_size[‘width’] = 125;
 $thumbnail_size[‘height’] = 125;
 return $thumbnail_size;
 }
 add_filter( ‘jetpack_relatedposts_filter_thumbnail_size’, ‘wtwlb_jp_image_size’ );</pre>
    
    <p>
      You can find a slew of other tweaks like this here: <a href="http://jetpack.me/support/related-posts/customize-related-posts/">http://jetpack.me/support/related-posts/customize-related-posts/</a>
    </p>
    
    <h4>
      <strong>Customize The Mobile Theme</strong>
    </h4>
    
    <p>
      The mobile theme included in Jetpack is clean and functional, but, again, a little short on options. It’s not going to look like your desktop theme right out of the box, but it can be styled quite easily.
    </p>
    
    <p>
      <strong>Create Custom Mobile Styles<br /> </strong>There are a couple options to apply styling to the mobile theme. Remember, because it’s a separate theme, you cannot add your styling to your regular desktop theme style.css because that’s not going to be loaded on mobile.
    </p>
    
    <ol>
      <li>
        For an easy way to include custom CSS, I like to use a plugin called <a href="https://wordpress.org/plugins/simple-custom-css/">Simple Custom CSS</a>. It just provides a box for you to enter your CSS and have it apply regardless of the theme. It’s perfect for these sort of cases. To target styles specifically within the mobile theme, just make sure to use the class: .mobile-theme
      </li>
      <li>
        Create a separate style sheet and enqueue it. This could be particularly useful if you want to keep your custom CSS out of the dashboard where an over-zealous client might get their hands on it.
      </li>
    </ol>
    
    <p>
      Here’s the code you’d need to do that:
    </p>
    
    <pre>// Check if we are on mobile
 function jetpackme_is_mobile() {</pre>
    
    <pre>// Are Jetpack Mobile functions available?
 if ( ! function_exists( ‘jetpack_is_mobile’ ) )</pre>
    
    <pre>return false;</pre>
    
    <pre>// Is Mobile theme showing?
 if ( isset( $_COOKIE[‘akm_mobile’] ) && $_COOKIE[‘akm_mobile’] == ‘false’ )
 return false;</pre>
    
    <pre>return jetpack_is_mobile();
 }</pre>
    
    <pre>// On mobile? Enqueue your custom style sheet
 if ( jetpackme_is_mobile() ) {
 add_action( ‘wp_enqueue_scripts’, ‘wtwlb_jetpackme_mobile_css’ );
 }</pre>
    
    <pre>// Build the function
 function wtwlb_jetpackme_mobile_css() {</pre>
    
    <pre>wp_enqueue_style( ‘mobile-style’, plugins_url( ‘mobile-style.css’, __FILE__ ), array(‘style’), ‘1’, ‘all’ );
 }</pre>
    
    <p>
      In this case, I have created a mobile specific style sheet called mobile-style.css, which will be saved in the same folder as my functionality plugin.
    </p>
    
    <p>
      <strong>Mobile Specific Widgets<br /> </strong>Optimizing Jetpack! Presently, there isn’t an elegant way to have mobile-specific widgets using the Jetpack mobile theme. But here’s a method that will work.
    </p>
    
    <p>
      By default, the mobile theme will look in your main theme for a sidebar registered with the ID: sidebar-1 and it will use that at the bottom of your mobile theme. If your theme does not have a sidebar with that ID, you won’t have any widgets unless you register one for this purpose.
    </p>
    
    <p>
      Assuming you do have that sidebar, by default all widgets in it will show on mobile. But if you want to control that and only show certain ones on mobile, you can use a plugin called <a href="https://wordpress.org/plugins/widget-logic/">Widget Logic</a>. It gives you a field on each widget to specify conditions on which to show it. Here you can tap into a cool Jetpack function to designate the widget to show up only on mobile. On the widgets you want to show on mobile devices, enter:
    </p>
    
    <pre>jetpack_is_mobile()</pre>
    
    <p>
      For those widgets you only want on desktop, enter:
    </p>
    
    <pre>!jetpack_is_mobile()</pre>
    
    <p>
      <img class="alignnone wp-image-14072" src="http://s2.mt-cdn.net/blog/wp-content/uploads/2015/05/jetpackismobile.png" alt="jetpackismobile" width="700" height="738" />
    </p>
    
    <p>
      &nbsp;
    </p>
    
    <p>
      Further reading:<br /> <a href="https://github.com/jeremyfelt/Hooks-in-Jetpack">A partial list of hooks in Jetpack<br /> </a><a href="http://jetpack.me/support/">Official Jetpack documentation<br /> </a><a href="http://jetpack.me/support/jetpack-for-developers/">Jetpack developers’ page<br /> </a><a href="http://jetpack.me/2013/06/27/customize-mobile-theme/">Customizing the mobile theme</a>
    </p>
    
    <p>
      Hopefully, this will entice you to dig deeper into the capabilities of Jetpack. Have you done something cool with Jetpack? Share it in the comments!
    </p>
  </div>
</div>