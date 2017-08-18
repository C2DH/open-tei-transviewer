<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd" version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 28, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Chiara Alzetta</xd:p>
            <xd:p>Add the html tags to call core CSS and JS</xd:p>
        </xd:desc>
    </xd:doc>

    <!--<xsl:include href="global_config.xsl"/>-->

    <xsl:template name="coreCSS">
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathBookReader}/BookReader.css"
            id="BRCSS" rel="stylesheet" type="text/css"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathCoreCSS}/frame_text_img(default).css"
            rel="stylesheet" type="text/css"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathCoreCSS}/frame_text_only.css"
            rel="stylesheet" type="text/css"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathCoreCSS}/frame_img_only.css"
            rel="stylesheet" type="text/css"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml"
            href="{$pathCoreCSS}/transcript-basic.css" rel="stylesheet" type="text/css"> </link>
    </xsl:template>

    <!--  <xsl:template name="bootJQuery">-->
    <!-- <script xmlns="http://www.w3.org/1999/xhtml" src="{$pathJQuery}/{$libJQueryJS}" type="text/javascript"><xsl:comment> </xsl:comment></script>-->
    <!--  <script xmlns="http://www.w3.org/1999/xhtml" src="{$pathJQuery}/{$libJQueryJS}" type="text/javascript"/>-->
    <!--     <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJS}"></script>
    </xsl:template> -->

    <!-- Added by FAR -->
    <xsl:template name="coreJS">
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJS4}"></script>
        <!--<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJScustom}"></script>        
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJSdragscroll}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJScolorbox}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJSipad}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJSbt}"></script>-->
        <!-- <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJS11}"></script> -->
        <!--<script type="text/javascript" src="http://www.archive.org/includes/jquery-1.4.2.min.js"></script>-->
        <!--<script type="text/javascript" src="http://www.archive.org/bookreader/jquery-ui-1.8.5.custom.min.js"/>
        <script type="text/javascript" src="http://www.archive.org/bookreader/dragscrollable.js"/>
        <script type="text/javascript" src="http://www.archive.org/bookreader/jquery.colorbox-min.js"/>
        <script type="text/javascript" src="http://www.archive.org/bookreader/jquery.ui.ipad.js"/>
        <script type="text/javascript" src="http://www.archive.org/bookreader/jquery.bt.min.js"/>-->
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJScustom}"></script>        
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJSdragscroll}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJScolorbox}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJSipad}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJSbt}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathBookReader}/BookReader.js"></script>        
        <!--<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathCoreJS}/BookReaderConf.js"></script>-->
    </xsl:template>
    
    <xsl:template name="BookReaderConf">       
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathCoreJS}/BookReaderConf.js"></script>
		<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathCoreJS}/PageNavigation.js"></script>
		<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathCoreJS}/ModeSwitch.js"></script>
    </xsl:template>

    <!-- These are not used at the moment. To use them, copy inside the template "coreJS" -->
    <!--<script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathLazysizesJS}" async=""></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathSmartZoomJS}"></script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathZoomConfJS}"></script>-->

</xsl:stylesheet>
