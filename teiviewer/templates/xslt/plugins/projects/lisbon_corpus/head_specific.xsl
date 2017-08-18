<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd" version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 28, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Chiara Alzetta</xd:p>
            <xd:p>Add the HTML tags to call project specific CSS and JS files.</xd:p>
        </xd:desc>
    </xd:doc>
     
   <!-- <xsl:include href="../../../core/boot_saxonce.xsl"/>
    <xsl:include href="../../../core/headerCore.xsl"/> -->
    
    <!-- Commented by FAR -->
    <!--  <xsl:template name="headCore">
            <xsl:call-template name="coreCSS" />
        <xsl:call-template name="specificCSS" />
            <xsl:call-template name="bootJQuery" />
    </xsl:template>-->
    
   <!-- Added by FAR -->
    <xsl:template name="specificCSS">
        <link xmlns="http://www.w3.org/1999/xhtml" id="specificCSS_dipl" href="{$pathCSSSpecific}/transcript-specific_dipl.css" rel="stylesheet" type="text/css" title="diplomatic"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" id="specificCSS_lin" href="{$pathCSSSpecific}/transcript-specific_lin.css" rel="stylesheet alternate" type="text/css" title="linear"> </link>
    </xsl:template>
    
    <!-- Added by FAR -->
    <xsl:template name="specificJS">
       <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathSpecificJS}/TranscriptView.js"></script>
    </xsl:template>
    
    
</xsl:stylesheet>