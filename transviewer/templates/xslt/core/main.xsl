<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xd"
    version="1.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 16, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Core: main transformation (in the browser, using Saxon-CE) stylesheet. The result of the ouside browser transformation can be seen in the html sub-folder.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="html" encoding="utf-8" indent="no"/> 
    
    <xsl:include href="global_config.xsl"/>
    
    <xsl:template match="/">
	<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="{$lang}">
            <xsl:call-template name="head" />
            <body xmlns="http://www.w3.org/1999/xhtml" class="{$textType}" id="{$textID}">
            </body> 
        </html>
    </xsl:template>
    
    <xsl:template name="head">
        <head xmlns="http://www.w3.org/1999/xhtml">
            <meta xmlns="http://www.w3.org/1999/xhtml" http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:call-template name="bootSaxonCE">
                <xsl:with-param name="pathSaxonEntryXSL" select="$pathSaxonEntryXSL" />
            </xsl:call-template>
            <xsl:call-template name="headCoreCSS" />
            <xsl:call-template name="headCoreStyle" />
        </head>
    </xsl:template>
    
</xsl:stylesheet>
