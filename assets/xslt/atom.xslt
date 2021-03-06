<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" encoding="utf-8" />
<xsl:template match="/atom:feed">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html &gt;</xsl:text>
	<html>
	<head>
		<xsl:text disable-output-escaping="yes"><![CDATA[
		<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-P56LRMG');</script>
<!-- End Google Tag Manager -->

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title>Atom Feed (Styled)</title>

	<meta name="description" content="I&#39;m a political scientist." />

    <meta name="author" content="Justin Murphy"/>
    
 	<meta name="keywords" content="">

	<link rel="stylesheet" type="text/css" href="https://jmrphy.net/assets/css/styles_feeling_responsive.css" />
	<script src="https://jmrphy.net/assets/js/modernizr.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.5.18/webfont.js"></script>
	<script>
		WebFont.load({
			google: {
				families: [ 'Lato:400,700,400italic:latin', 'Volkhov::latin' ]
			}
		});
	</script>

	<noscript>
		<link href='http://fonts.googleapis.com/css?family=Lato:400,700,400italic|Volkhov' rel='stylesheet' type='text/css' />
	</noscript>

  	<meta name="google-site-verification" content="Vk0IOJ2jwG_qEoG7fuEXYqv0m2rLa8P778Fi_GrsgEQ" />
	<meta name="msvalidate.01" content="0FB4C028ABCF07C908C54386ABD2D97F" />
	<link rel="author" href="https://plus.google.com/u/1/106173867748806895007"/>

	



	
	<link rel="icon" sizes="16x16" href="https://jmrphy.net/assets/img/favicon-16x16.png" />



	
	<link rel="icon" sizes="32x32" href="https://jmrphy.net/assets/img/favicon-32x32.png" />




	
	<link rel="icon" sizes="192x192" href="https://jmrphy.net/assets/img/touch-icon-192x192.png" />




	
	<link rel="apple-touch-icon-precomposed" sizes="180x180" href="https://jmrphy.net/assets/img/apple-touch-icon-180x180-precomposed.png" />

























	
	<meta name="msapplication-TileImage" content="https://jmrphy.net/assets/img/msapplication_tileimage.png" />




	
	<meta name="msapplication-TileColor" content="#176789" />



<!-- Facebook Optimization -->
	<meta property="og:locale" content="" />

	<meta property="og:author" content="Justin Murphy" />

	<meta property="og:type" content="website" />

	<meta property="og:title" content="Atom Feed (Styled)" />

	<meta property="og:description" content="I&#39;m a political scientist." />

	<meta property="og:url" content="https://jmrphy.net/assets/xslt/atom.xslt" />
	<meta property="og:site_name" content="Justin Murphy" />
	

	

	<!-- Search Engine Optimization -->
	

	<link type="text/plain" rel="author" href="https://jmrphy.net/humans.txt" />

	

	

	<!-- Include Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

	<!-- Meta Data for Google Scholar -->
	<!-- Copied from MMadsen https://github.com/mmadsen/jekyll-greycite  -->

	<!-- Get date last modified from git log. (Uses current time if file entry not found, e.g. projects/)  -->
    


    <!-- For posts, page.date is the date they are published under, which we use as their 'canonical' dc:date -->
     <!-- If we don't have a page.date, then use modified time (pages) -->
       
    

    <!-- Posts declare modified timestamps in the sidebar, so would be redundant to put here. But then 
         pages don't have a dc:modified... unless we give them their own (modified) sidebar?  
    -->
    <!-- Ideally we would want date originally created from the _oldest_ git commit too...-->

<!-- Google Scholar Metadata -->
	<meta name="resource_type" content="article"/>
    <meta name="citation_author" content="Justin Murphy"/>
    <meta name="citation_date" content="1970-01-01T01:00:00+01:00"/>
    <meta name="citation_publication_date" content="1970-01-01T01:00:00+01:00"/>
    <meta name="citation_title" content="Atom Feed (Styled)"/>
    <meta name="citation_journal_title" content="Justin Murphy"/>

<!-- RDFa Metadata (in DublinCore) -->
    <meta property="dc:title" content="Atom Feed (Styled)" />
    <meta property="dc:creator" content="Justin Murphy" />
    <meta property="dc:date" content="1970-01-01T01:00:00+01:00" />
    <meta property="dc:format" content="text/html" />
    <meta property="dc:language" content="en" />
    <meta property="dc:identifier" content="/assets/xslt/atom.xslt" />
    <meta property="dc:rights" content="CC BY 4.0" />
    <meta property="dc:source" content="Justin Murphy" />
    <meta property="dc:subject" content="Political Science" /> 
    <meta property="dc:type" content="website" /> 

		]]></xsl:text>
	</head>
	<body id="top-of-page">
		<xsl:text disable-output-escaping="yes"><![CDATA[
		<div id="navigation" class="sticky">
  <nav class="top-bar" role="navigation" data-topbar>
    <ul class="title-area">
      <li class="name">
      <h1 class="show-for-small-only"><a href="https://jmrphy.net" class="icon-home"> Justin Murphy</a></h1>
    </li>
       <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
      <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
    </ul>
    <section class="top-bar-section">

      <ul class="right">
        

              

          
          
        

              

          
          
            
            
              <li class="divider"></li>
              <li><a href="https://jmrphy.net/research/">Research</a></li>

            
            
          
        

              

          
          
            
            
              <li class="divider"></li>
              <li><a href="https://jmrphy.net/files/Murphy_vita.pdf">CV</a></li>

            
            
          
        

              

          
          
            
            
              <li class="divider"></li>
              <li><a href="https://jmrphy.net/teaching/">Teaching</a></li>

            
            
          
        

              

          
          
            
            
              <li class="divider"></li>
              <li><a href="https://jmrphy.net/blog/">Blog</a></li>

            
            
          
        
        
      </ul>

      <ul class="left">
        

              

          
          

            
            
              <li><a href="https://jmrphy.net">Home</a></li>
              <li class="divider"></li>

            
            
          
        

              

          
          
        

              

          
          
        

              

          
          
        

              

          
          
        
        
      </ul>
    </section>
  </nav>
</div><!-- /#navigation -->

		




		


<div class="alert-box warning radius text-center"><p>This <a href="https://en.wikipedia.org/wiki/RSS" target="_blank">Atom feed</a> is meant to be used by <a href="https://en.wikipedia.org/wiki/Template:Aggregators" target="_blank">RSS reader applications and websites</a>.</p>
</div>



		]]></xsl:text>
		<header class="t30 row">
	<p class="subheadline"><xsl:value-of select="atom:subtitle" disable-output-escaping="yes" /></p>
	<h1>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="atom:id" />
			</xsl:attribute>
			<xsl:value-of select="atom:title" />
		</xsl:element>
	</h1>
</header>
<ul class="accordion row" data-accordion="">
	<xsl:for-each select="atom:entry">
		<li class="accordion-navigation">
			<xsl:variable name="slug-id">
				<xsl:call-template name="slugify">
					<xsl:with-param name="text" select="atom:id" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:element name="a">
				<xsl:attribute name="href"><xsl:value-of select="concat('#', $slug-id)"/></xsl:attribute>
				<xsl:value-of select="atom:title"/>
				<br/>
				<small><xsl:value-of select="atom:updated"/></small>
			</xsl:element>
			<xsl:element name="div">
				<xsl:attribute name="id"><xsl:value-of select="$slug-id"/></xsl:attribute>
				<xsl:attribute name="class">content</xsl:attribute>
				<h1>
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="atom:id"/></xsl:attribute>
						<xsl:value-of select="atom:title"/>
					</xsl:element>
				</h1>
				<xsl:value-of select="atom:content" disable-output-escaping="yes" />
			</xsl:element>
		</li>
	</xsl:for-each>
</ul>

		<xsl:text disable-output-escaping="yes"><![CDATA[
		    <div id="up-to-top" class="row">
      <div class="small-12 columns" style="text-align: right;">
        <a class="iconfont" href="#top-of-page">&#xf108;</a>
      </div><!-- /.small-12.columns -->
    </div><!-- /.row -->


    <footer id="footer-content" class="bg-grau">
      <div id="footer">
        <div class="row">
          <div class="medium-6 large-5 columns">
            <h5 class="shadow-black">About This Site</h5>

            <p class="shadow-black">
              I'm a political scientist.
              <!-- <a href="https://jmrphy.net/info/">Explore some of my work in this area ›</a> -->
            </p>
          </div><!-- /.large-6.columns -->


          <div class="small-6 medium-3 large-3 large-offset-1 columns">
            
              
                <h5 class="shadow-black">Other info</h5>
              
            
              
            
              
            
              
            
              
            

              <ul class="no-bullet shadow-black">
              
                
                  <li >
                    <a href=""  title=""></a>
                  </li>
              
                
                  <li >
                    <a href="/feed.xml"  title="Subscribe to RSS Feed">RSS</a>
                  </li>
              
                
                  <li >
                    <a href="/atom.xml"  title="Subscribe to Atom Feed">Atom</a>
                  </li>
              
                
                  <li >
                    <a href="/sitemap.xml"  title="Sitemap for Google Webmaster Tools">sitemap.xml</a>
                  </li>
              
                
                  <li >
                    <a href="/privacy"  title="Privacy Policy">Privacy Policy</a>
                  </li>
              
              </ul>
          </div><!-- /.large-4.columns -->


          <div class="small-6 medium-3 large-3 columns">
            
              
                <h5 class="shadow-black">See also</h5>
              
            
              
            
              
            
              
            
              
            

            <ul class="no-bullet shadow-black">
            
              
                <li >
                  <a href=""  title=""></a>
                </li>
            
              
                <li >
                  <a href="mailto:jstnmrphy@gmail.com"  title="Email me">Email me</a>
                </li>
            
              
                <li >
                  <a href="http://tinyletter.com/jmrphy" target="_blank"  title="Subscribe to my newsletter">Newsletter</a>
                </li>
            
              
                <li >
                  <a href="http://jmrphy.tumblr.com" target="_blank"  title="Tumblr">Tumblr</a>
                </li>
            
              
                <li >
                  <a href="http://jmrphy.tumblr.com/ask" target="_blank"  title="Ask me anything">Ask me anything</a>
                </li>
            
            </ul>
          </div><!-- /.large-3.columns -->
        </div><!-- /.row -->

      </div><!-- /#footer -->


      <div id="subfooter">
        <nav class="row">
          <section id="subfooter-left" class="small-12 medium-6 columns credits">
            <p>
              This site is powered by <a href="http://jekyllrb.com/" target="_blank">Jekyll</a>. It uses the custome theme <a href="http://github.com/jmrphy/jekyll_academic">Jekyll Academic</a>, which was adapted from <a href="http://phlow.github.io/feeling-responsive/">Feeling&nbsp;Responsive</a>. This site participates in the Amazon Services LLC Associates Program, an affiliate advertising program designed to provide a means for us to earn fees by linking to Amazon.com and affiliated sites. Finally, the content of this website is licensed under a <a href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
            </p>
          </section>

          <section id="subfooter-right" class="small-12 medium-6 columns">
            <ul class="inline-list social-icons">
            
              <li><a href="http://twitter.com/jmrphy" target="_blank" class="icon-twitter" title="I'm on twitter as @jmrphy"></a></li>
            
              <li><a href="https://www.instagram.com/jstnmrphy/" target="_blank" class="icon-instagram" title="Pictures"></a></li>
            
              <li><a href="http://github.com/jmrphy" target="_blank" class="icon-github" title="Code and data"></a></li>
            
              <li><a href="http://www.youtube.com/BarclayShields" target="_blank" class="icon-youtube" title="Videos"></a></li>
            
              <li><a href="https://www.facebook.com/barclayshields" target="_blank" class="icon-facebook" title=""></a></li>
            
              <li><a href="https://soundcloud.com/barclay-shields" target="_blank" class="icon-soundcloud" title="Some audio things"></a></li>
            
            </ul>
          </section>
        </nav>
      </div><!-- /#subfooter -->
    </footer>

		


<script src="https://jmrphy.net/assets/js/javascript.min.js"></script>









		]]></xsl:text>
	</body>
	</html>
</xsl:template>
<xsl:template name="slugify">
	<xsl:param name="text" select="''" />
	<xsl:variable name="dodgyChars" select="' ,.#_-!?*:;=+|&amp;/\\'" />
	<xsl:variable name="replacementChar" select="'-----------------'" />
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	<xsl:variable name="lowercased"><xsl:value-of select="translate( $text, $uppercase, $lowercase )" /></xsl:variable>
	<xsl:variable name="escaped"><xsl:value-of select="translate( $lowercased, $dodgyChars, $replacementChar )" /></xsl:variable>
	<xsl:value-of select="$escaped" />
</xsl:template>
</xsl:stylesheet>
