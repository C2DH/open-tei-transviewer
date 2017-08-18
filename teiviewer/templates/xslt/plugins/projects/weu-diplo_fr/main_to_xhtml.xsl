<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 27, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Transform xml to xhtml documents, without using Saxon-CE</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xhtml" encoding="UTF-8"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="no"/>
    
    <!-- http://www.w3.org/QA/2002/04/valid-dtd-list.html 
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
    
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
        
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        
        <!DOCTYPE HTML>
    -->
    
    <!--    <xsl:strip-space elements="*"/> -->
    
    <xsl:preserve-space elements="text"/>
    <xsl:include href="config.xsl"/>
   
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="{$lang}">
            <xsl:call-template name="htmlHead" />
            <body xmlns="http://www.w3.org/1999/xhtml" class="{$textType} {$textSubType}" id="{$textID}">
          <!--  <body xmlns="http://www.w3.org/1999/xhtml" id="{$textID}" class="{$textType} {$textSubType}">-->
                <xsl:call-template name="htmlBody"/>
               <!-- <xsl:apply-templates select="//tei:body"/>-->
                <xsl:call-template name="BookReaderConf"/>
                <xsl:call-template name="specificJS" />
            </body>            
        </html>
    </xsl:template>
    
    <xsl:template name="htmlHead">
        <head xmlns="http://www.w3.org/1999/xhtml">
            <title>Transformation tests</title>
            <!--<xsl:call-template name="bootSaxonCE">
                <xsl:with-param name="transfType" select="$outXHTML" />
            </xsl:call-template>-->
            <xsl:call-template name="coreCSS" />
            <xsl:call-template name="specificCSS" />
            <xsl:call-template name="coreJS" />
         <!--   <xsl:call-template name="specificJS" />-->
            <!--<xsl:call-template name="headCore" />--> 
          <!--  <xsl:call-template name="BookReaderConf"/>-->
        </head>
    </xsl:template>
    
</xsl:stylesheet>