<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xd" version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 17, 2017</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Links to application and project core CSS and JS, and style description; to be added to the head or end of the body part in the generated HTML file</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:template name="headCoreCSS">
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathAppCSS}/transviewer.css" rel="stylesheet" type="text/css"> </link>
        <link xmlns="http://www.w3.org/1999/xhtml" href="{$pathCoreCSS}/transcript_core.css" rel="stylesheet" type="text/css"> </link>
    </xsl:template>
    
    <xsl:template name="headCoreStyle">
        <style xmlns="http://www.w3.org/1999/xhtml" type="text/css">
            <xsl:text disable-output-escaping="yes">html, body {height:100%; margin:0; overflow: hidden;</xsl:text>
        </style>
    </xsl:template>
    
    <xsl:template name="bodyCoreScript">
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript">
            	function loadJQueryPlugins() {
                		$.when(
	                		$.getScript('<xsl:value-of select="$pathJQuery-uiJS" />'),
	                		$.getScript('<xsl:value-of select="$pathJQuery-highlightJS" />'),
	                		$.getScript('<xsl:value-of select="$pathJQuery-markJS" />'),
	                		$.getScript('<xsl:value-of select="$pathDragscrollableJS" />'),
	                		$.getScript('<xsl:value-of select="$pathBookreaderJS" />'),
	                		$.getScript('<xsl:value-of select="$pathTransviewerJS" />')
	                		
						).done(function() {
						
	                		$.getScript('<xsl:value-of select="$pathBookreader-simpleJS" />'
	                		).done(function() {
								TransViewer.plugInRoot = '<xsl:value-of select="concat($pathRoot, $sepFile)" />';
								new TransViewer($('body'));
							});
						});
               	}
        </script>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathSaxonceJS}"/>
        <script xmlns="http://www.w3.org/1999/xhtml" type="text/javascript" src="{$pathJQueryJS}" onload="loadJQueryPlugins()"/>
		
    </xsl:template>
    
</xsl:stylesheet>
