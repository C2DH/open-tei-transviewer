<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 23, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> florentina.armaselu</xd:p>
            <xd:p>Processes project-specific structure and content elements.</xd:p>
        </xd:desc>
    </xd:doc>
     
    <!-- Headers, footers, catch, page numbers with @type -->
    <xsl:template match="//tei:fw[count(./@*)=1 and count(./@type)=1]">
                <xsl:if test="./child::tei:note[./@type=$footnoteType]">
                    <hr class="{$footnoteSepClass}" xmlns="http://www.w3.org/1999/xhtml"/>
                </xsl:if>
                <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type}">
                    <xsl:apply-templates select="./child::node()"/>
                </span>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type and @corresp -->
    <xsl:template match="//tei:fw[count(./@*)=2 and count(./@type)=1 and count(./@corresp)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type, @corresp and @xml:id-->
    <xsl:template match="//tei:fw[count(./@*)=3 and count(./@type)=1 and count(./@corresp)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type and @xml:id-->
    <xsl:template match="//tei:fw[count(./@*)=2 and count(./@type)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{./@type}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
        <br xmlns="http://www.w3.org/1999/xhtml" />
    </xsl:template>
    
    <!-- Headers, footers, catch, page numbers with @type, @corresp and @rendition for colour-->
	<xsl:template match="//tei:fw[count(./@*)=3 and count(./@type)=1 and count(./@corresp)=1 and count(./@rendition)=1]">
		<span xmlns="http://www.w3.org/1999/xhtml" class="{./@type} {name(./@corresp)}{$sepAtt}{substring-after(./@corresp,$refTag)}">
			<!--  Bypass  the invalidate of style attribute on IE -->
			<xsl:attribute name="style" select="concat('color: ', ./@rendition)" />
			<xsl:apply-templates select="./child::node()"/>
		</span>
        <br xmlns="http://www.w3.org/1999/xhtml" />
	</xsl:template>
        
    <!-- Note with @xml:id -->
    <xsl:template match="//tei:note[count(./@*)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Note with @type and @xml:id -->
    <xsl:template match="//tei:note[count(./@*)=2 and count(./@type)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@type)}{$sepAtt}{./@type}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Note with @corresp -->
    <xsl:template match="//tei:note[count(./@*)=1 and count(./@corresp)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@corresp)}{$sepAtt}{./@corresp}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Note with @cert and @xml:id -->
    <xsl:template match="//tei:note[count(./@*)=2 and count(./@cert)=1 and count(./@xml:id)=1]">
        <span xmlns="http://www.w3.org/1999/xhtml" class="{name(.)} {name(./@cert)}{$sepAtt}{./@cert}" id="{./@xml:id}">
            <xsl:apply-templates select="./child::node()"/>
        </span>
    </xsl:template>
    
    <!-- Line break with @rendition and @break (for words broken at line break). 
        See https://css-tricks.com/almanac/properties/h/hyphenate/. 
        A CSS should be applied (soft hyphen &#173; hard hyphen &#8208;)-->
    <xsl:template match="//tei:lb[count(./@*)=2 and count(./@rendition)=1 and count(./@break)=1]">
        <xsl:if test="./@rendition=$hyphenBeforeType and ./@break=$breakNoType">
            <!--<xsl:text disable-output-escaping="yes">&#45;</xsl:text>-->
            <span xmlns="http://www.w3.org/1999/xhtml" class="{$hyphenClass}">-</span>
            <br xmlns="http://www.w3.org/1999/xhtml" class="{$breakNoClass}" />
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>