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
            <xd:p>Project specific: main transformation stylesheet</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="html" encoding="utf-8" indent="no"/> 

    <xsl:include href="config.xsl"/>
    
   <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="{$lang}">
            <xsl:call-template name="htmlHead" />
            <body xmlns="http://www.w3.org/1999/xhtml" class="{$textType} {$textSubType}" id="{$textID}">
                 <p></p>
            </body> 
        </html>
    </xsl:template>
    
    <xsl:template name="htmlHead">
        <head xmlns="http://www.w3.org/1999/xhtml">
            <meta xmlns="http://www.w3.org/1999/xhtml" http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:call-template name="bootSaxonCE">
                <xsl:with-param name="pathXSLSaxonEntry" select="$pathXSLSaxonEntry" />
            </xsl:call-template>
            <xsl:call-template name="coreCSS" />
            <xsl:call-template name="specificCSS" />
            <xsl:call-template name="coreJS" />
        </head>
    </xsl:template>
    
</xsl:stylesheet>